require "pg"

class PizzaOrder

  attr_accessor :first_name, :last_name, :toppping, :quantity
  attr_reader :id
  #note: don't even use anything other then attr_reader for id's

  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @toppping = options["toppping"]
    @quantity = options["quantity"].to_i()
    @id = options["id"].to_i() if options["id"]
  end

  def save()
    db = PG.connect({dbname: "pizza_shop", host: "localhost"})
    sql = "INSERT INTO pizza_orders
    (
      first_name,
      last_name,
      toppping,
      quantity
    )
      VALUES
    (
      '#{@first_name}',
      '#{@last_name}',
      '#{@toppping}',
      #{@quantity}
    ) RETURNING id"
    @id = db.exec(sql)[0]["id"].to_i()
    db.close()
  end #Note: PG.connect is a methord you can call on the database(ie pizza_shop), every time you create a new app you have to change the dbname #Note: db.exec(sql) will call the exe of the var sql

  def delete()
    db = PG.connect({dbname: "pizza_shop", host: "localhost"})
    sql = "DELETE FROM pizza_orders WHERE id = #{@id}"
    db.exec(sql)
    db.close()
  end

  def update()
    db = PG.connect({dbname: "pizza_shop", host: "localhost"})
    sql = "UPDATE pizza_orders
      SET
      (
        first_name,
        last_name,
        toppping,
        quantity
      )
      =
      (
        '#{@first_name}',
        '#{@last_name}',
        '#{@toppping}',
        #{@quantity}
      ) WHERE id = #{@id}
      "
    db.exec(sql)
    db.close()
  end

  def PizzaOrder.all()
    db = PG.connect({dbname: "pizza_shop", host: "localhost"})
    sql = "SELECT * FROM pizza_orders"
    orders = db.exec(sql)
    db.close()
    return orders.map {|order| PizzaOrder.new(order)}
  end

  def PizzaOrder.delete_all()
    db = PG.connect({dbname: "pizza_shop", host: "localhost"})
    sql = "DELETE FROM pizza_orders"
    db.exec(sql)
    db.close()
  end


end
