Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /fr|en/ do
    root to: 'places#index'
  end

end
