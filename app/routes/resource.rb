module Routes

  ResourceRoute = -> {
    contract = Ethereum::Contract.create file: "store.sol", client: ETH
    address = contract.deploy_and_wait
    puts "new contract: #{address}"

    5.times do
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
