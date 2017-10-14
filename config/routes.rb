Rails.application.routes.draw do

  scope '(:locale)', locale: /fr|en/ do
    ActiveAdmin.routes(self)
    devise_for :users

    if Rails.env.development?
      root to: 'places#index'
    elsif Rails.env.production?
      root to: 'pages#home'
    end
    resources :places
    post 'places/filters', 'places#filters'
    post 'places/monuments_filter', 'places#monuments_filter'
  end

end
