# frozen_string_literal: true

Rails.application.routes.draw do
  ### RUTAS CRUD OWNER ###
  devise_for :owners, controllers: { sessions: 'owners/sessions',
                                     registrations: 'owners/registrations' }
  # Rutas adicionales de owner
  devise_scope :owner do
    get 'owners_root' => 'owners/sessions#menu', as: 'owner_root'
    get 'owners' => 'owners/registrations#index', as: 'lista_owners'
    get 'owners/:id' => 'owners/registrations#show', as: 'owner'
    get 'owners/:id/edit', to: 'owners/registrations#edit_admin', as: 'admin_edit_owner'
    patch 'owners/:id', to: 'owners/registrations#update_admin'
    delete 'owners/:id', to: 'owners/registrations#destroy_admin'
    post 'owners-filtrados' => 'owners/registrations#filtro'

    get 'reportar_comentario/:cid' => 'owner_reporte#new', as: 'owner_reportando'
    post 'reportar_comentario' => 'owner_reporte#create', as: 'owner_reporta'
    get 'reportes_comentarios' => 'owner_reporte#index', as: 'owner_reportes'
    get 'reporte_comentario/:rid' => 'owner_reporte#show', as: 'owner_reporte'
    delete 'reporte_comentario/:rid' => 'owner_reporte#destroy', as: 'destroy_owner_reporte'
  end

  ### RUTAS CRUD SWIPERS ###
  devise_for :swipers, controllers: { sessions: 'swipers/sessions',
                                      registrations: 'swipers/registrations' }
  # Rutas adicionales de swipers
  devise_scope :swiper do
    get 'swiper_root' => 'pages#home', as: 'swiper_root'
    get 'swipers' => 'swipers/registrations#index', as: 'lista_swipers'

    get 'swipers/:id' => 'swipers/registrations#show', as: 'swiper'
    get 'swipers/lista_matchs/:id' => 'pages#lista_matchs', as: 'lista_matchs'
    get 'swipers/:id/lista_matchs/:id_d' => 'pages#eliminar_match', as: 'eliminar_match'

    get 'swipers/reportar/:id_a' => 'reportes#new', as: 'reportar_swiper'
    post 'swipers/reportar' => 'reportes#create', as: 'create_reporte_swiper'

    get 'swipers/:id/edit', to: 'swipers/registrations#edit_admin', as: 'admin_edit_swiper'
    patch 'swipers/:id', to: 'swipers/registrations#update_admin'
    delete 'swipers/:id', to: 'swipers/registrations#destroy_admin'
    delete 'swipers/imagen/:id_i/:id_s' => 'swipers/registrations#delete_imagen', as: 'delete_'\
                                                                                  'imagen_swiper'
    post 'swipers-filtrados' => 'swipers/registrations#filtro'
    get 'swipers/mensajes/:id' => 'pages#mensajes', as: 'mensajes'
    post 'mensaje-nuevo' => 'pages#crear_mensaje'
  end

  ### RUTAS CRUD ADMIN ###
  devise_for :admins, controllers: { sessions: 'admins/sessions',
                                     registrations: 'admins/registrations' }
  # Rutas adicionales de admins
  devise_scope :admin do
    get 'admin_root' => 'cruds#index', as: 'admin_root'
    get 'admins' => 'admins/registrations#index', as: 'lista_admins'
    get 'admins/:id', to: 'admins/registrations#show', as: 'admin'
    get 'admins/:id/edit', to: 'admins/registrations#edit_admin', as: 'admin_edit_admin'
    patch 'admins/:id', to: 'admins/registrations#update_admin'
    delete 'admins/:id', to: 'admins/registrations#destroy_admin'
    post 'admins-filtrados' => 'admins/registrations#filtro'

    get 'reportes', to: 'reportes#index', as: 'reportes'
    get 'reporte/:id', to: 'reportes#show', as: 'reporte'
    delete 'reporte/:id', to: 'reportes#destroy', as: 'destroy_reporte'
  end

  ### RUTAS NAVEGACION SWIPER(HOME)###
  root to: 'pages#home', as: 'home_root'
  get 'pages/swiper_mostrados/:id', to: 'pages#swipers_mostrados', as: 'aceptando'
  get 'pages/swiper_mostrados/:id/aceptar/:id_a', to: 'pages#aceptar', as: 'aceptado'

  get 'add_favorito/:id/:idr', to: 'pages#add_favorito', as: 'add_favorito'
  get 'delete_favorito/:id/:id_a/:idr', to: 'pages#delete_favorito', as: 'delete_favorito'

  get 'cita/:id_a', to: 'pages#choose_restaurante', as: 'menu_cita_restaurante'
  get 'cita/:id/:id_a', to: 'pages#agendar_cita', as: 'agendar_cita'

  get 'cita/restaurante/favoritos/:id/:id_a/:fav', to: 'restaurantes#index', as: 'rest_cita_fav'
  get 'cita/restaurante/:id/:id_a', to: 'restaurantes#index', as: 'restaurantes_cita'

  get 'cita/restaurante/:id/:id_a/:id_r', to: 'restaurantes#show', as: 'restaurante_cita'
  get 'cita/:id/:id_a/:id_r/:bool', to: 'restaurantes#show', as: 'fecha_cita'
  post 'cita', to: 'meet#create', as: 'generar_cita'

  get 'aceptar_cita/:mid', to: 'meet#accept', as: 'aceptar_cita'
  get 'citas', to: 'pages#menu_citas', as: 'menu_citas'

  get 'citas/1', to: 'pages#lista_citas', as: 'lista_citas'
  get 'citas/2', to: 'pages#citas_entrantes', as: 'citas_entrantes'
  get 'citas/3', to: 'pages#citas_salientes', as: 'citas_salientes'

  get 'citas/:id/:mid/:a', to: 'meet#eliminar_cita', as: 'eliminar_cita'

  get 'pages/gustos/:id', to: 'pages#gustos', as: 'add_gustos'

  ### RUTAS CRUD COMUNA ###
  # CREATE
  get 'comunas/new', to: 'comunas#new'
  post 'comunas', to: 'comunas#create'
  # READ
  get 'comunas', to: 'comunas#index', as: 'lista_comunas'
  get 'comunas/:id', to: 'comunas#show', as: 'comuna'
  # UPDATE
  get 'comunas/:id/edit', to: 'comunas#edit', as: 'edit_comuna'
  patch 'comunas/:id', to: 'comunas#update'
  # DELETE
  delete 'comunas/:id', to: 'comunas#destroy'
  # FILTRO
  post 'comunas-filtradas' => 'comunas#filtro'

  ### RUTAS CRUD COMENTARIO ###
  # CREATE
  get 'comentarios/new/:ids/:idr', to: 'comentarios#new', as: 'comentar_restaurante'
  post 'comentarios', to: 'comentarios#create'
  # READ
  get 'comentarios', to: 'comentarios#index', as: 'lista_comentarios'
  get 'comentarios/:id', to: 'comentarios#show', as: 'comentario'
  # UPDATE
  get 'comentarios/:id/edit', to: 'comentarios#edit', as: 'edit_comentario'
  patch 'comentarios/:id', to: 'comentarios#update'
  # DELETE
  delete 'comentarios/:id', to: 'comentarios#destroy'
  # FILTRO
  post 'comentarios-filtrados' => 'comentarios#filtro'

  ### RUTAS CRUD GUSTO ###
  # CREATE
  get 'gustos/new', to: 'gustos#new'
  post 'gustos', to: 'gustos#create'
  # READ
  get 'gustos', to: 'gustos#index'
  get 'gustos/:id', to: 'gustos#show', as: 'gusto'
  # UPDATE
  get 'gustos/:id/edit', to: 'gustos#edit', as: 'edit_gusto'
  patch 'gustos/:id', to: 'gustos#update'
  # DELETE
  delete 'gustos/:id', to: 'gustos#destroy'

  ### RUTAS CRUD RESTAURANTE ###
  # CREATE
  get 'restaurantes/new', to: 'restaurantes#new', as: 'restaurante_new'
  post 'restaurantes', to: 'restaurantes#create'
  # READ
  get 'restaurantes', to: 'restaurantes#index', as: 'lista_restaurantes'
  get 'restaurantes/:id', to: 'restaurantes#show', as: 'restaurante'
  get 'stats/:rid', to: 'restaurantes#stats', as: 'ver_stats'
  # UPDATE
  get 'restaurantes/:id/edit', to: 'restaurantes#edit', as: 'edit_restaurante'
  patch 'restaurantes/:id', to: 'restaurantes#update'
  # DELETE
  delete 'restaurantes/:id', to: 'restaurantes#destroy'
  delete 'restaurantes/imagen/:id_i/:id_r', to: 'restaurantes#delete_imagen', as: 'delete_'\
                                                                              'imagen_restaurante'
  # FILTRO
  post 'restaurantes-filtrados' => 'restaurantes#filtro'
  # RUTAS EXTRA
  get 'pages/choose_login', to: 'pages#choose_login', as: 'choose_login'
  get 'pages/choose_registration', to: 'pages#choose_registration', as: 'choose_registration'

  get 'pendientes' => 'restaurantes#pendientes', as: 'pendientes'
end
