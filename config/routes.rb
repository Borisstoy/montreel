Rails.application.routes.draw do

  scope '(:locale)', locale: /fr|en/ do
    ActiveAdmin.routes(self)
    devise_for :users

    root to: 'places#index'
    post 'places/filters', 'places#filters'
  end

end
