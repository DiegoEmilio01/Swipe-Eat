Rails.application.routes.draw do

  ### RUTAS CRUD ADMIN ###
  devise_for :admins, controllers: {sessions: 'admins/sessions', registrations: 'admins/registrations'}
  # Rutas adicionales de admins
  devise_scope :admin do
    get 'admin_root' => 'admins/registrations#index', as: 'admin_root'
    get 'admins' => 'admins/registrations#index', as: 'lista_admins'
    get 'admins/:id', to: 'admins/registrations#show', as: 'admin'
  end

  ### RUTA LISTA DE CRUDS ###
  get '/', to: 'cruds#index', as: 'lista_cruds'

  ### RUTAS CRUD COMUNA ###
  #CREATE
  get 'comunas/new', to: 'comunas#new'
  post 'comunas', to: 'comunas#create'
  #READ
  get 'comunas', to: 'comunas#index', as: 'lista_comunas'
  get 'comunas/:id', to: 'comunas#show', as: 'comuna'
  #UPDATE
  get 'comunas/:id/edit', to: 'comunas#edit', as: 'edit_comuna'
  patch 'comunas/:id', to: 'comunas#update'
  #DELETE
  delete 'comunas/:id', to: 'comunas#destroy'
  ### FIN CRUD COMUNA ###

  ### RUTAS CRUD COMENTARIO ###
  #CREATE
  get 'comentarios/new', to: 'comentarios#new'
  post 'comentarios', to: 'comentarios#create'
  #READ
  get 'comentarios', to: 'comentarios#index', as: 'lista_comentarios'
  get 'comentarios/:id', to: 'comentarios#show', as: 'comentario'
  #UPDATE
  get 'comentarios/:id/edit', to: 'comentarios#edit', as: 'edit_comentario'
  patch 'comentarios/:id', to: 'comentarios#update'
  #DELETE
  delete 'comentarios/:id', to: 'comentarios#destroy'
### FIN CRUD COMENTARIO ###
end
