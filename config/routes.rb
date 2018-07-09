Rails.application.routes.draw do
  root "welcome#index"
  resources :member_info

  get 'testing/test1'
  post 'welcome/update_member_form'=> "welcome#update_member_form"
  get 'welcome/update_member_form'=> "welcome#update_member_form"
  get 'welcome/index' => "welcome#index"
  get "welcome/risk" => "welcome#risk_page"
  get "welcome/solution" => "welcome#solution_page"
  get "welcome/dashboard" => "welcome#dashboard"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
