# launchpad.rb

status: WIP

### Application Stack

- ruby
- roda
- parity
- launchpad swarm setup
- postgres

### Coding Style

The code style of the project is `RubyJS` (RJS for the most intimates - :D)

The core principles are:

- use arrow functions (lambdas)
- use exports
- use brackets ( `()` and `.()` ) when defining and calling methods
- use modules not classes
- use `{}` instead of where you commonly use the `do` -- `end` coding style commonly used for multiline blocks

```ruby
function -> { } 
```

```ruby
module Something
  SomeFunction = -> {
    # ...
  }
end

Exports.default = Something
```

see more infos about RJS: https://github.com/makevoid/rjs


And remember to use RSpec and request specs

```ruby
Rspec.describe do |r|
  r.specify("") {
    value.should == '123'
    # get("/"); body.should =~ /foobar/
  }
end
```

### Modules

- search (dm ferret or elasticsearch)
- datamapper to datamapper2 (ROM)
- op_return integration and explorer

### SOON

- ipfs
- tendermint



#### https://github.com/makevoid/launchpad-rb/blob/master/stack/app/try-eth-rb.rb

### Step 1) Setup

Deploy an ethereum contract and call it

```rb
require_relative 'env'

contract = Ethereum::Contract.create file: "store.sol", client: CLIENT
address = contract.deploy_and_wait
puts "new contract: #{address}"

5.times do
  contract.transact.set "rand-#{rand 10}"
  value = contract.call.get
  puts "got value: #{value}"
end
```

### Step 2) Configure

serverless/docker-compose.yml
```
services:
  app:
    image: me/my-launchpad-function1
    environment:
      - RACK_ENV=production
      - PARITY_HOST=xxx
    depends_on:
      - parity
    # ports:
    # - 9292:9292
  parity:
    image: appliedblockchain/parity-solo
    environment:
      - NETWORK=mainnet
      #- NETWORK=kovan
```

### Step 3) Deploy

### Deploy via kubernetes

```
docker pull me/my-launchpad-function1
docker stack deploy -c docker-compose.yml my-launchpad-stack --orchestrator=kubernetes
```
