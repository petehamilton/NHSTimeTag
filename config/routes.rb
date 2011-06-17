NHSTimeTag::Application.routes.draw do
  match "/doctors/get_cancellations" => "doctors#get_cancellations"
  # match "/doctors/:id/get_cancellations" => "doctors#get_cancellations", :defaults => { :format => 'json' }
  match "/doctors/:id/update_delay/:delay" => "doctors#update_delay"
  resources :clinics, :doctors
  root :to => "home#index"
end
