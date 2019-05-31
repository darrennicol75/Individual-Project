require_relative( "../models/equipment.rb" )
require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require("pry")

Rental.delete_all()
Equipment.delete_all()
Customer.delete_all()

equipment1 = Equipment.new({
  "model" => "Quicksilver RX10",
  "category" => "Surf",
  "quantity" => 6,
  "day_rate" => 10
})

equipment1.save()

equipment2 = Equipment.new({
  "model" => "O'Neill slingshot",
  "category" => "Surf",
  "quantity" => 6,
  "day_rate" => 13
})

equipment2.save()

equipment3 = Equipment.new({
  "model" => "Quicksilver Waterman",
  "category" => "Surf",
  "quantity" => 4,
  "day_rate" => 11
})

equipment3.save()

equipment4 = Equipment.new({
  "model" => "Hurley Slater",
  "category" => "Surf",
  "quantity" => 4,
  "day_rate" => 15
})

equipment4.save()

customer1 = Customer.new({
  "name" => "Kelly Slater",
  "account_number" => 1,
  "shipping_info" => "delivery_usa"
})

customer1.save()

customer2 = Customer.new({
  "name" => "Kanoa Igarashi",
  "account_number" => 2,
  "shipping_info" => "delivery_japan"
})

customer2.save()

customer3 = Customer.new({
  "name" => "John John Florence",
  "account_number" => 3,
  "shipping_info" => "delivery_hawaii"
})

customer3.save()

customer4 = Customer.new({
  "name" => "Jordy Smith",
  "account_number" => 4,
  "shipping_info" => "delivery_south_africa"
})

customer4.save()

rental1 = Rental.new({
  "customers_id" => customer1.id,
  "equipment_id" => equipment4.id
})

rental1.save()

rental2 = Rental.new({
  "customers_id" => customer2.id,
  "equipment_id" => equipment3.id
})

rental2.save()

rental3 = Rental.new({
  "customers_id" => customer3.id,
  "equipment_id" => equipment2.id
})

rental3.save()

rental4 = Rental.new({
  "customers_id" => customer4.id,
  "equipment_id" => equipment1.id
})

rental4.save()

binding.pry
nil
