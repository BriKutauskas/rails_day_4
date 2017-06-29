Rails.application.routes.draw do
  get 'cars/index'

  root "cars#index"

  get 'cars/create'

  get 'cars/accelerate'

  get 'cars/brake'

  get 'cars/lights'

  get 'cars/parkingbrake'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
