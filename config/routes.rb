Rails.application.routes.draw do
  scope "/homeschool" do
    root 'logs#index'
    resources :logs do
      collection do
      end
    end
  end
end
