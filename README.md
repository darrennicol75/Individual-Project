# Individual-Project-Ruby-Sinatra-PostgreSQL

This was the first project which was an individual project to demonstrate capabilities in the following areas: - 

Ruby-Sinatra-PostgreSQL

From the options I chose the brief that was to build an on-line inventory management system

The MVP, which was achieved, was to have the following functionality: - 

- Add/ Delete/ Adjust Inventory
- Add/ Delete/ Adjust Customer Profiles
- Assign Inventory to a Customer

Prerequisites: 
Prior to installation you will need the following installed on your machine -

Sinatra
Sinatra::Contrib
Ruby
PG Gem
PostreSQL
Pry
Installation: 

Here's how you can get the Rental Shop running locally once you download the repository. 
This will need to be done from the local folder.

Create the database:
createdb rentals

Run database schema:
psql -d rentals -f db/rentals.sql
Run seed file for creation of initial inventory, customers and rentals
ruby db/seeds.rb

Launch app:
ruby app.rb
Finally, visit http://localhost:4567 in your browser.

Possible Extensions and Bugs: 

I would have liked to add the ability to track days rented and thereafter to apply a day rate and produce an invoice. 
This would turn an inventory management system to a business management system. 
There are some bugs and some elements I would like to improve such assigning customer photos to their profiles. 
Also apologies for the over use of Gifs, they were quite new to me! :0) 




