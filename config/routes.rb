Rails.application.routes.draw do
  resources :member_info
  get 'testing/test1'

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
