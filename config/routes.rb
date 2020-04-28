Rails.application.routes.draw do
	get 'comunas/new', to: 'comunas#new'
	post 'comunas', to: 'comunas#create'
	get 'comunas', to: 'comunas#index', as: 'lista_comunas'
	get 'comunas/:id', to: 'comunas#show', as: 'comuna'
	get 'comunas/:id/edit', to: 'comunas#edit', as: 'edit_comuna'
	patch 'comunas/:id', to: 'comunas#update'
	delete 'comunas/:id', to: 'comunas#destroy'
end
