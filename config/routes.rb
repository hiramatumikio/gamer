Rails.application.routes.draw do
  devise_for :publics, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
