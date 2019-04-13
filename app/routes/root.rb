module Routes

  RootRoute = -> (r) {
    -> {
      r.redirect "/posts"
    }
  }

end
