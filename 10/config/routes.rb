Rails.application.routes.draw do
  get 'articles/index'

  Rails.application.routes.draw do

    get 'tags/:tag', to: 'articles#index', as: :tag
    resources :articles
    root 'articles#index'
  end

  resources :articles do
    resources :comments
  end

end
