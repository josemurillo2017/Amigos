Rails.application.routes.draw do
  root "welcome#index"
  resources :member_info

  get 'testing/test1'
  post 'welcome/update_member_form'=> "welcome#update_member_form"
  get 'welcome/update_member_form'=> "welcome#update_member_form"
  get 'welcome/index' => "welcome#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
