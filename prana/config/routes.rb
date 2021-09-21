Rails.application.routes.draw do
  root "asanas#index"
  get "/asanas/search" => "asanas#search"
  get "/asanas/search/by_asana_name" => "asanas#search_by_asana_name"
  get "/asanas/search/by_asana_type" => "asanas#search_by_asana_type"
  get "/asanas/search/by_body_part" => "asanas#search_by_body_part"
  get "/asanas/search/results" => "asanas#search_results"
  get "/asanas/show/all" => "asanas#show_all"
  resources :asanas
  resources :searches
end
