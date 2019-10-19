Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :clipboard do
    post "copy", to: "clipboard#copy"
  end

  root to: "cliboard#show"
end
