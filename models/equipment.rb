require_relative( '../db/sql_runner' )

class Equipment

  attr_accessor( :model, :category, :quantity, :day_rate, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @model = options['model']
    @category = options['category']
    @quantity = options['quantity'].to_i
    @day_rate = options['day_rate'].to_i
  end

  def save()
    sql = "INSERT INTO equipment
    (
      model,
      category,
      quantity,
      day_rate
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@model, @category, @quantity, @day_rate]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE equipment
    SET
    (
      model,
      category,
      day_rate,
      quantity
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@model, @category, @day_rate, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def customers
    sql = "SELECT c.* FROM customers c INNER JOIN rentals r ON r.customer_id = c.id WHERE r.equipment_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |customer| Customer.new(customer) }
  end

  def equipment(id)
    sql = "SELECT * FROM equipment WHERE id = $1";
    values = [id]
    results = SqlRunner.run( sql, values )
    return Equipment.new( results.first )
  end

  def delete()
    sql = "DELETE FROM equipment
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.destroy(id)
    sql = "DELETE FROM equipment
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM equipment"
    results = SqlRunner.run( sql )
    return results.map { |hash| Equipment.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM equipment
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Equipment.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM equipment"
    SqlRunner.run( sql )
  end

  def self.map_items(equipment_data)
    return equipment_data.map { |equipment| Equipment.new(equipment) }
  end

end
