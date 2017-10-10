Rails.application.routes.draw do

  scope '(:locale)', locale: /fr|en/ do
    ActiveAdmin.routes(self)
    devise_for :users

    root to: 'pages#home'
    resources :places
    post 'places/filters', 'places#filters'
    post 'places/monuments_filter', 'places#monuments_filter'
  end

end
