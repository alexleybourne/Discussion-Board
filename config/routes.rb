Rails.application.routes.draw do
  resources :disscussions

  root to: "disscussions#index"

  get "/auth/:provider/callback" => "sessions#new"
  get "/auth/sign-out" => "sessions#sign_out", as: :sign_out

end
