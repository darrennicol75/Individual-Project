require_relative( '../db/sql_runner' )

class Customer

  attr_reader( :name, :account_number, :shipping_info, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @account_number = options['account_number'].to_i
    @shipping_info = options['shipping_info']
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      account_number,
      shipping_info
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @account_number, @shipping_info]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def equipment()
    sql = "SELECT e.* FROM equipment
    e INNER JOIN rentals r ON
    r.equipment_id = e.id
    WHERE r.customers_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |equipment| Equipment.new(equipment) }
  end

  def self.destroy(id)
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run( sql )
    return results.map { |customer| Customer.new( customer ) }
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

  def self.map_items(customer_data)
    return customer_data.map { |customer| Customer.new(customer) }
  end

end
