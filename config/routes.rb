Rails1::Application.routes.draw do
  
  resources :users
  
  match "/kontakt" => redirect("/kontakt/kontaktdaten/kontakt")
  match "/kontakt/kontaktdaten" => redirect("/kontakt/kontaktdaten/kontakt")
  match "/portfolio" => redirect("/portfolio/projekte")
  match "/news" => redirect("/news/aktuelles")
  match "/news/newsletter" => redirect("/news/newsletter/anmelden")
  
  match '/lightbox/:id' => 'app_front#lightbox'


  match 'user/:name' => 'users#showa'
  
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signup' => 'users#new'
  match '/signin' => 'sessions#new'
  match '/login' => 'sessions#new'
  match '/anmelden' => 'sessions#new'
  match '/signout' => 'sessions#destroy'
  match '/logout' => 'sessions#destroy'
  match '/abmelden' => 'sessions#destroy'
  
  
  match 'fckeditor/check_spelling' => 'fckeditor#check_spelling'
  match 'fckeditor/command' => 'fckeditor#command'
  match 'fckeditor/upload' => 'fckeditor#upload'
  
  
  match 'news/newsletter/anmelden' => 'news_bereiche#newsletter_on'
  match 'news/newsletter/abmelden' => 'news_bereiche#newsletter_off'
  match 'news/newsletter/anmeldung' => 'news_bereiche#newsletter_safe'
  match 'news/newsletter/abmeldung' => 'news_bereiche#newsletter_search'
  match 'news/newsletter/kill' => 'news_bereiche#newsletter_kill'
  
  match 'kontakt/agb' => 'kontakt_bereiche#agbs'
  match 'kontakt/faqs' => 'kontakt_bereiche#faqs'
  
  
  match 'produkte/:name/(:paramx/(:paramy))' => 'produkte#show'
  # => match 'portfolio/:name/(:paramx/(:paramy))' => 'portfolio_bereiche#show'
  
  match 'portfolio/:name/(:paramx/(:paramy))' => 'portfolio_bereiche#show'
  
  match 'news/:name/(:paramx)' => 'news_bereiche#show'
  match 'kontakt/:name' => 'kontakt_bereiche#show'
  match 'kontakt/:name/:paramx' => 'kontakt_bereiche#katshow'
  
  match 'kontakt/kontaktdaten/kontakt/mail' => 'kontakt_bereiche#kontaktmail_safe'
  
  match '/agb', :to => 'kontakt_bereiche#agbs'
  match '/AGB', :to => 'kontakt_bereiche#agbs'
  match '/faqs', :to => 'kontakt_bereiche#faqs'
  match '/FAQs', :to => 'kontakt_bereiche#faqs'
  match '/sitemap', :to => 'app_front#sitemap'
  

  
  resources :portfolio_bereiche, :path => "portfolio", :only => [ :index, :show ]
  
  resources :kontakt_bereiche, :path => "kontakt", :only => [ :index, :show, :katshow ]
  
  resources :news_bereiche, :path => "news", :only => [ :index, :show ]
  
  
  resources :produkte, :only => [ :index, :show ]


  namespace :admin do
    resources :produkt_bereiche
    resources :produkt_kategorien
    resources :produkte do
      resources :produkt_detail_bilder do
        member do
          get :select
          delete :remove
        end
        collection do
          post :available
          get  :selected
        end
      end
      resources :banners do
        member do
          get :select
          delete :remove
        end
        collection do
          post :available
          get  :selected
          get :available
        end
      end
      resources :referenzen do
        member do
          get :select
          delete :remove
        end
        collection do
          post :available
          get  :selected
          get :available
        end
      end
      resources :leistungen do
        member do
          get :select
          delete :remove
        end
        collection do
          post :available
          get  :selected
          get :available
        end
      end
    end
    
    resources :leistungen do
      collection do
          post :reorder
          get  :reorder
          put  :reorder
        end
      resources :produkt_bereiche do
        member do
          get :select
          delete :remove
        end
        collection do
          post :available
          get  :selected
          get :available
        end
      end
    end
      
    resources :produkt_detail_bilder
    resources :portfolio_bereiche
    
    resources :referenzen do
      resources :referenz_bilder
      resources :web_referenzen
      resources :web_referenz_bilder
      
      resources :produkt_bereiche do
        member do
          get :select
          delete :remove
        end
        collection do
          post :available
          get  :selected
          get :available
        end
      end
      resources :produkt_kategorien do
        member do
          get :select
          delete :remove
        end
        collection do
          post :available
          get  :selected
          get :available
        end
      end
      resources :produkte do
        member do
          get :select
          delete :remove
        end
        collection do
          post :available
          get  :selected
          get :available
        end
      end
      
    end
    
    resources :referenz_bilder
    resources :web_referenzen do
      resources :web_referenz_bilder
    end
    resources :web_referenz_bilder
    resources :branchen
    resources :kunden
    resources :kunden_meinungen
    resources :banners
    resources :sliders
    resources :aktionen
    resources :seiten
    resources :sidebars
    resources :start_head_sliders
    

    resources :news_bereiche
    resources :news_eintraege
    resources :newsletter_abos

    resources :kontakt_bereiche
    resources :kontakt_kategorien
    resources :agbs
    match 'reorder_agbs', :to => 'agbs#reorder'
    resources :faqs
    
    resources :users
    root :to => 'admin_front#index'
  end
  
  
  match '/start', :to => 'app_front#start'
  match '/front', :to => 'app_front#start'
  # => root :to => "app_front#fangseite"
  root :to => "app_front#start"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
