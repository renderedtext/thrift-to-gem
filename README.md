# Thrift |> Gem

Creates a gem based on thrift definition.

## Installation

``` elixir
def deps do
  {:thrift_to_gem, github: "renderedtext/thrift_to_gem", ref: "origin/master"}
end
```

### Usage

To generate a gem based on a thrift definition run:

``` bash
mix thift.to.gem --source thrift/user_service.thrift
                 --output ../user_service_gem
                 --name users_client
```

This will create a directory called `user_service_gem` with the source of your
gem based on the Thrift definition.
