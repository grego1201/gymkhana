Rails.application.routes.draw do
  get 'welcome/index'

  resources :quests do
    post 'check_code', to: 'quests#check_code'
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
