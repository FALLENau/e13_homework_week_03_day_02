class PizzaOrder

  attr_accessor :first_name, :last_name, :toppping, :quantity

  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @toppping = options["toppping"]
    @quantity = options["quantity"].to_i()
  end

end
