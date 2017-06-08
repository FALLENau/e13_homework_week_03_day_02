require ('pry-byebug')
require_relative ('bounty.rb')

Bounty.delete_all()

bounty1 = Bounty.new({
  "name" => "Luke Skywalker",
  "species" => "human",
  "bounty_value" => 10000,
  "homeworld" => "Tatooine"
  })

bounty2 = Bounty.new({
  "name" => "Leia Organa",
  "species" => "human",
  "bounty_value" => 30000,
  "homeworld" => "Aldraan"
  })

bounty3 = Bounty.new({
  "name" => "Chewbaccak",
  "species" => "Wookiee",
  "bounty_value" => 15000,
  "homeworld" => "Kashyyyk"
  })

bounty4 = Bounty.new({
  "name" => "Han Solo",
  "species" => "human",
  "bounty_value" => 16000,
  "homeworld" => "Corellia"
  })

bounty1.save()
bounty2.save()
bounty3.save()
bounty4.save()

# binding.pry
nil
