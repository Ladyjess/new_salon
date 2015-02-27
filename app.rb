require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "./lib/client"
require "./lib/stylist"
require "pg"


DB = PG.connect({:dbname => "hair_salon"})

get '/' do
  @stylists = Stylist.all
  erb :index
end

post "/clients" do
  name = params["name"]
  stylist_id = params["stylist_id"].to_i
  appointment_date = params["appointment_date"]
  client = Client.new({:name => name, :stylist_id => stylist_id, :appointment_date => appointment_date})
  client.save
  @stylist = Stylist.find(stylist_id)
  erb :stylist
end

post "/stylists" do
  name = params["name"]
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save
  @stylists = Stylist.all
  erb :index
end

get "/stylists/:id" do
  @stylist = Stylist.find(params["id"].to_i)
  erb :stylist
end

get "/stylists/:id/edit" do
  @stylist = Stylist.find(params["id"].to_i)
  erb :stylist_edit
end

patch "/stylists/:id" do
  name = params["name"]
  @stylist = Stylist.find(params["id"].to_i)
  @stylist.update({:name => name})
  erb :stylist
end

delete "/stylists/:id" do
  @stylist = Stylist.find(params["id"].to_i)
  @stylist.delete
  @stylists = Stylist.all
  erb :index
end
