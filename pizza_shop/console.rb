require "pry-byebug"
require_relative "pizza_order"

PizzaOrder.delete_all()

order1 = PizzaOrder.new({
  "first_name" => "Luke",
  "last_name" => "Skywalker",
  "toppping" => "Womp rats",
  "quantity" => 1
  })

order2 = PizzaOrder.new({
  "first_name" => "Darth",
  "last_name" => "Vader",
  "toppping" => "Lava hot Feast",
  "quantity" => 4
  })

order1.save()
order2.save()

binding.pry
nil
