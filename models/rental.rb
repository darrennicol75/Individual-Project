require_relative( '../db/sql_runner' )

class Rental

  attr_reader( :equipment_id, :customers_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @equipment_id = options['equipment_id'].to_i
    @customer_id = options['customers_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals
    (
      equipment_id,
      customers_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@equipment_id, @customer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    results = SqlRunner.run( sql )
    return results.map { |rental| Rental.new( rental ) }
  end

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run( sql, values )
    return Customer.new( results.first )
  end

  def equipment()
    sql = "SELECT * FROM equipment
    WHERE id = $1"
    values = [@equipment_id]
    results = SqlRunner.run( sql, values )
    return Equipment.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM rentals"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM rentals
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
