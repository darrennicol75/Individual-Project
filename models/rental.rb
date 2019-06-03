require_relative( '../db/sql_runner' )

class Rental

  attr_accessor( :equipment_id, :customer_id, :hire_duration, :quantity, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @equipment_id = options['equipment_id'].to_i
    @customer_id = options['customer_id'].to_i
    @hire_duration = options['hire_duration'].to_i
    @quantity = options['quantity'].to_i
  end

  def save()
    sql = "INSERT INTO rentals
    (
      equipment_id,
      customer_id,
      hire_duration,
      quantity
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@equipment_id, @customer_id, @hire_duration, @quantity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE equipment
    SET
    (
      equipment_id,
      customer_id,
      hire_duration,
      quantity
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@equipment_id, @customer_id, @hire_duration, @quantity]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM rentals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def customers
    sql = "SELECT c.* FROM customers c INNER JOIN rentals r ON r.customer_id = c.id WHERE r.equipment_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |customer| Customer.new(customer) }
  end

  def equipment()
    sql = "SELECT e.* FROM equipment
    e INNER JOIN rentals r ON
    r.equipment_id = e.id
    WHERE r.customer_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |equipment| Equipment.new(equipment) }
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    results = SqlRunner.run( sql )
    return results.map { |rental| Rental.new( rental ) }
  end

  def self.delete_all()
    sql = "DELETE FROM rentals"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM rentals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Equipment.new( results.first )
  end

  def self.destroy(id)
    sql = "DELETE FROM rentals
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.map_items(rental_data)
    return rental_data.map { |rental| Rental.new(rental) }
  end


end
