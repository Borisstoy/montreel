Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /fr|en/ do
    root to: 'places#index'
    post 'places/filters', 'places#filters'
  end

end
