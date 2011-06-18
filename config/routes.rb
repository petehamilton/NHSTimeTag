NHSTimeTag::Application.routes.draw do
  match "/hospitals/:id" => "clinics#index"
  match "/doctors/get_appointments" => "doctors#get_appointments"
  match "/doctors/:id/get_appointments" => "doctors#get_appointments"
  match "/doctors/get_cancellations" => "doctors#get_cancellations"
  match "/doctors/:id/get_cancellations" => "doctors#get_cancellations"
  match "/doctors/:id/update_delay/:delay" => "doctors#update_delay"
  resources :clinics, :doctors, :hospitals
  root :to => "home#index"
end
