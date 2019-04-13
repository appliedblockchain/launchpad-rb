require_relative 'env'

include Routes

class App < Roda
  plugin :json
  plugin :error_handler
  plugin :not_found

  route do |r|
    r.root &RootRoute.(r)

    r.get "posts", &ResourceRoute
  end

end
