require_relative( "../models/equipment.rb" )
require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require("pry")

Rental.delete_all()
Equipment.delete_all()
Customer.delete_all()

equipment1 = Equipment.new({
  "model" => "Quicksilver RX10",
  "category" => "Surf Board",
  "quantity" => 10,
  "day_rate" => 10
})

equipment1.save()

equipment2 = Equipment.new({
  "model" => "O'Neill slingshot",
  "category" => "Surf Board",
  "quantity" => 10,
  "day_rate" => 13
})

equipment2.save()

equipment3 = Equipment.new({
  "model" => "Quicksilver Waterman",
  "category" => "SUP Board",
  "quantity" => 10,
  "day_rate" => 11
})

equipment3.save()

equipment4 = Equipment.new({
  "model" => "Hurley Slater",
  "category" => "Wind Surf",
  "quantity" => 10,
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

customer5 = Customer.new({
  "name" => "Carissa Moore",
  "account_number" => 5,
  "shipping_info" => "delivery_hawaii"
})

customer5.save()

customer6 = Customer.new({
  "name" => "Stephanie Gilmore",
  "account_number" => 6,
  "shipping_info" => "delivery_australia"
})

customer6.save()

customer7 = Customer.new({
  "name" => "Courtney Conlogue",
  "account_number" => 7,
  "shipping_info" => "delivery_usa"
})

customer7.save()

customer8 = Customer.new({
  "name" => "Caroline Marks",
  "account_number" => 8,
  "shipping_info" => "delivery_usa"
})

customer8.save()


rental1 = Rental.new({
  "customer_id" => customer1.id,
  "equipment_id" => equipment4.id,
  "hire_duration" => 14,
  "quantity" => 1
})

rental1.save()

rental2 = Rental.new({
  "customer_id" => customer2.id,
  "equipment_id" => equipment3.id,
  "hire_duration" => 7,
  "quantity" => 1
})

rental2.save()

rental3 = Rental.new({
  "customer_id" => customer3.id,
  "equipment_id" => equipment2.id,
  "hire_duration" => 21,
  "quantity" => 1
})

rental3.save()

rental4 = Rental.new({
  "customer_id" => customer4.id,
  "equipment_id" => equipment1.id,
  "hire_duration" => 28,
  "quantity" => 1
})

rental4.save()

rental5 = Rental.new({
  "customer_id" => customer5.id,
  "equipment_id" => equipment4.id,
  "hire_duration" => 14,
  "quantity" => 1
})

rental5.save()

rental6 = Rental.new({
  "customer_id" => customer6.id,
  "equipment_id" => equipment3.id,
  "hire_duration" => 7,
  "quantity" => 1
})

rental6.save()

rental7 = Rental.new({
  "customer_id" => customer7.id,
  "equipment_id" => equipment1.id,
  "hire_duration" => 21,
  "quantity" => 1
})

rental7.save()

rental8 = Rental.new({
  "customer_id" => customer8.id,
  "equipment_id" => equipment1.id,
  "hire_duration" => 28,
  "quantity" => 1
})

rental8.save()


binding.pry
nil
