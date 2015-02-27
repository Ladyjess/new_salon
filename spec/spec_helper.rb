require 'rspec'
require 'pg'
require 'stylist'
require 'client'


DB = PG.connect({:dbname => "hair_salon_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
  end
end
