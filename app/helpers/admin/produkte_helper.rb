module Admin::ProdukteHelper
  
  
  def product_picker_field(name, value)
    products = Produkt.with_ids(value)
    product_names_hash = products.inject({}){|memo,item| memo[item.id] = item.name; memo}
    %(<input type="text" name="#{name}" value="#{value}" class="tokeninput products" data-names='#{product_names_hash.to_json}' />).html_safe
  end

  # renders set of hidden fields and button to add new record using nested_attributes
  def link_to_neue_felder(name, append_to_selector, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, raw("add_fields(\"#{append_to_selector}\", \"#{association}\", \"#{escape_javascript(fields)}\")"), :class => 'add_fields')
  end

  # renders hidden field and link to remove record using nested_attributes
  def link_to_felder_raus(name, f)
    f.hidden_field(:_destroy) + link_to_with_icon(:delete, name, '#', :class => 'remove_fields')
  end

  def link_to_löschen(resource, options = {})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :name)

    options.reverse_merge! :url => object_url(resource) unless options.key? :url
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :dataType => 'script'
    options.reverse_merge! :success => "function(r){ jQuery('##{dom_id resource}').fadeOut('hide'); }"
    options.reverse_merge! :name => icon("delete") + ' ' + t("delete")

    #link_to_with_icon('delete', t("delete"), object_url(resource), :confirm => t('are_you_sure'), :method => :delete )
    link_to_function options[:name], "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });"
  end

  def link_to_with_icon(icon_name, text, url, options = {})
    options[:class] = (options[:class].to_s + " icon_link").strip
    link_to(icon(icon_name) + ' ' + text, url, options)
  end
  
  def icon(icon_name)
    icon_name ? image_tag("/images/admin/icons/#{icon_name}.png") : ''
  end

  def button(text, icon_name = nil, button_type = 'submit', options={})
    content_tag('button', content_tag('span', icon(icon_name) + ' ' + text), options.merge(:type => button_type))
  end

  def button_link_to(text, url, html_options = {})
    if (html_options[:method] && 
        html_options[:method].to_s.downcase != 'get' && 
        !html_options[:remote])
      form_tag(url, :method => html_options[:method]) do
        button(text, html_options[:icon])
      end
    else
      if html_options['data-update'].nil? && html_options[:remote]
        object_name, action = url.split('/')[-2..-1]
        html_options['data-update'] = [action, object_name.singularize].join('_')
      end
      html_options.delete('data-update') unless html_options['data-update']
      link_to(text_for_button_link(text, html_options), url, html_options_for_button_link(html_options))
    end
  end
  
  
  

  private
  def attribute_name_for(field_name)
    field_name.gsub(' ', '_').downcase
  end
end
