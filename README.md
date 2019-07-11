# Individual-Project-Ruby-Sinatra-PostgreSQL

This was the first project which was an individual project. 

From the options I chose the following brief: - 





Prerequisites
Prior to installation you will need the following installed on your machine -

Sinatra
Sinatra::Contrib
Ruby
PG Gem
PostreSQL
Pry
Installation
Here's how you can get the Rental Shop running locally 
once you download the repository. This will need to be done from the local folder.

Create the database

createdb rentals
Run database schema

psql -d spending_tracker -f db/rentals.sql
Run seed file for creation of initial transactions, merchants and categories

ruby db/seeds.rb
Launch app

ruby app.rb
Finally, visit http://localhost:4567 in your browser.
