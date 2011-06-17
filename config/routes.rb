NHSTimeTag::Application.routes.draw do
  root :to => "home#index"
  match "/clinics/:id/status" => "clinics#status"
end
