Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :page_contents,only: :index
      get '/parse_page' =>"page_contents#parse_page"
    end
  end
end
