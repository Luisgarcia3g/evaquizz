Rails.application.routes.draw do



  #get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/welcome', to: 'welcome#index'

  get "inicio/maestro"



  post "welcome" => "welcome#validar"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  namespace :admin do
    #resource :pregunta
    get '/', to: 'dashboard#index'
    get '/usuarios', to: 'admins#new'
    get '/logout', to: "dashboard#logout"

    get 'pregunta/nueva', to: 'preguntas#new'
    get 'pregunta/', to: "preguntas#index"
    get "pregunta/:id" => "preguntas#show"
    get '/desactivar', to: "preguntas#desactivar"


    get'quizz/', to: 'quizzs#index'
    get'quizz/nuevo', to: 'quizzs#new'
    get'quizz/:id', to: 'quizzs#show'
    get '/desactivar', to: "quizzs#desactivar"

    get'tema/nuevo', to: 'temas#new'
    get'tema/editar', to: 'temas#edit'
    patch' tema/actualizar', to: 'temas#update'
    get'tema/mostrar', to: 'temas#show'
    get'tema/', to: 'temas#index'
    put "temas/:id" => "temas#update"
    get '/desactivar', to: "temas#desactivar"

    put "temarios/:id" => "temarios#update"
    get'temario/nuevo', to: 'temarios#new'
    get'temario/editar', to: 'temarios#edit'
    get'temario/:id', to: 'temarios#show'
    post 'temarios/:id', to: 'temarios#show'
    get'temario/', to: 'temarios#index'
    get '/desactivar', to: "temarios#desactivar"



    resources :preguntas
    resource :admin
    resources :quizzs do
      member  do
        get 'agregar_pregunta'
        get 'pregunta_nueva'
      end
    end
    resources :temas
    resources :temarios
  end
  namespace :maestro do
    get '/', to: 'dashboard#index'
    get '/grupo', to: 'dashboard#grupo'
    get '/grafica', to: 'dashboard#grafica'
    get '/gestion', to: "dashboard#gestion"
    get '/logout', to: "dashboard#logout"
    get '/especificacion', to: "dashboard#especificacion"
    get '/filtrar', to: "dashboard#filtrar"
  end
  namespace :alumno do
    get '/', to: 'dashboard#index'
    post 'codigo', to: 'dashboard#validarCodigo'
    get 'esperar', to: 'dashboard#esperar'
    get 'respuestas', to: 'dashboard#respuestas'
    get 'enviada', to: 'dashboard#enviada'
    get 'puntaje', to: 'dashboard#puntaje'
    get '/logout', to: "dashboard#logout"
  end

end
