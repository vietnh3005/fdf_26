Rails.application.routes.draw do
  root "pages#show", page: "home"
  get "/pages/*page", to: "pages#show"
  get "/manage_pages/*page", to: "manage_pages#show"
end
