require_relative( '../db/sql_runner' )

class Equipment

  attr_reader( :model, :category, :quantity, :day_rate, :id )

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

  def customers
    sql = "SELECT c.* FROM customers c INNER JOIN rentals r ON r.customers_id = c.id WHERE r.equipment_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |customer| Customer.new(customer) }
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Customer.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Customer.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run( sql )
  end

end
