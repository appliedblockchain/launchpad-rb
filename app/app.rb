require_relative 'env'

# HELLO WORLD
ResourceRoute.()

class App < Roda
  plugin :json
  plugin :error
  plugin :not_found

  routes do |r|
    r.get "items", ResourceRoute
  end

end
