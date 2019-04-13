module Routes

  ResourceRoute = -> {
    contract = CONTRACT

    value = ""
    3.times do
      contract.transact.set "rand-#{rand 10}"
      value = contract.call.get
      puts "got value: #{value}"
    end

    Post.create! title: "post-#{rand 1000}", text: "..."

    {
      status: "ok",
      posts: Post.count,
      store: { value: value },
    }.to_json
  }

end
