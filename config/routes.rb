NHSTimeTag::Application.routes.draw do
  match "/appointments/:id/cancel" => "appointments#cancel"
  match "/appointments/:id/reschedule" => "appointments#cancel", :reschedule => true
  match "/doctors/get_appointments" => "doctors#get_appointments"
  match "/doctors/:id/get_appointments" => "doctors#get_appointments"
  match "/doctors/get_cancellations" => "doctors#get_cancellations"
  match "/doctors/:id/get_cancellations" => "doctors#get_cancellations"
  match "/doctors/:id/update_delay/:delay" => "doctors#update_delay"
  
  resources :hospitals do
    resources :clinics
  end
  resources :clinics do
    resources :doctors
  end
  resources :patients
  root :to => "home#index"
end
