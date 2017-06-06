require ("pg")

class Bounty

  attr_accessor :name, :species, :bounty_value, :homeworld
  attr_reader :id


  def initialize(options)
    @name = options["name"]
    @species = options["species"]
    @bounty_value = options["bounty_value"].to_i()
    @homeworld = options["homeworld"]
    @id = options["id"].to_i() if options["id"]
  end


  def save()
    db = PG.connect({dbname: "bountyhub", host: "localhost"})
    sql = "INSERT INTO bounty 
    (
      name,
      species,
      bounty_value,
      homeworld
    )
    VALUES
    (
      '#{@name}',
      '#{@species}',
      #{@bounty_value},
      '#{@homeworld}'
    )
    RETURNING id"
    @id = db.exec(sql)[0]["id"].to_i()
    db.close()
  end

  def update()
    db = PG.connect({dbname: "bountyhub", host: "localhost"})
    sql = "UPDATE bounty 
        SET
        (
          name,
          species,
          bounty_value,
          homeworld
          ) 
        =
        (
          '#{@name}',
          '#{@species}',
          #{@bounty_value},
          '#{@homeworld}'
          )
          WHERE id = #{@id}"
    db.exec(sql)
    db.close()
  end

  def delete()
        db = PG.connect({dbname: "bountyhub", host: "localhost"})
        sql = "DELETE FROM bounty WHERE id = #{@id}"
        db.exec(sql)
        db.close()    
  end

  def Bounty.all()
    db = PG.connect({dbname: "bountyhub", host: "localhost"})
    sql = "SELECT * FROM bounty"
    single_bounty = db.exec(sql)#this is like the return command on ruby
    db.close()
    return single_bounty.map {|single_bounty| Bounty.new(single_bounty)}
  end

  def Bounty.delete_all()
    db = PG.connect({dbname: "bountyhub", host: "localhost"})
    sql = "DELETE FROM bounty"
    db.exec(sql)
    db.close()
  end

  def Bounty.find(id)
    db = PG.connect({dbname: "bountyhub", host: "localhost"})
      sql = "SELECT * FROM bounty WHERE id = '#{id}'"
      bounty_hash = db.exec(sql)[0]
      db.close() 
      return Bounty.new(bounty_hash)
  end

end