module ApplicationHelper
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def link_to_add_webref_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_webref_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def logo
    logo = raw '<div id="logo"></div>'
  	link_to logo, root_path, :id => 'logo_link'
    # Fill in.
  end

  # Return a title on a per-page basis.
  def title
    base_title = "orangenwerk .. Werbung, Werbetechnik und Webdesign für Oranienburg und Berlin"
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end
  
  def nepp
    raw '<img src="/images/no.png" class="nepp" />'
  end
  
  def jepp
    raw '<img src="/images/ok.png" class="jepp" />'
  end
  
  def harken(f, att)
    @abgeharkt = ''
    @abgeharkt = (f.object.errors[att].count > 0 ? nepp : jepp) if f.object.errors.any?
    @abgeharkt
  end
  
  def geschlechter
    %w[Herr Frau]
  end

  def show_pic
    image_tag '/images/22_show.png', :class => 'admin_edit_symbol', :title => 'Anzeigen'
  end
  
  def edit_pic
    image_tag '/images/22_edit.png', :class => 'admin_edit_symbol', :title => 'Bearbeiten'
  end
  
  def del_pic
    image_tag '/images/22_del.png', :class => 'admin_edit_symbol', :title => 'Löschen'
  end
  
  
  def sortable(column, title = nil)  
    title ||= column.titleize  
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}  
  end
  
  def link_to_delete(resource, options = {})
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
  
  private
  
    def sort_column  
      # => Product.column_names.include?(params[:sort]) ? params[:sort] : "name"  
      %w[name titel sorter].include?(params[:sort]) ? params[:sort] : "name"
       
    end  
    
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end 
    
end
