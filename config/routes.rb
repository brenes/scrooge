require 'digest'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope Digest::SHA256.hexdigest(Rails.application.secrets.telegram_api_key) do
    resources :sentences, only: :create
  end

end
