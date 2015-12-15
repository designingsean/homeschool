Rails.application.routes.draw do
  root 'logs#index'

  resources :logs do
    collection do
    end
  end

  resources :books do
    collection do
    end
  end
end
