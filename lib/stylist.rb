class Stylist
  attr_reader :name, :id

  def initialize(properties)
    @name = properties[:name]
    @id = properties[:id]
  end

  def self.all
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist["name"]
      id = stylist["id"].to_i
      stylists << Stylist.new({:name => name, :id => id})
    end
    stylists
  end

  def self.find(id_for_stylist)
    found_stylist = nil
    Stylist.all.each do |stylist|
      if stylist.id.== id_for_stylist
        found_stylist = stylist
      end
    end
    found_stylist
  end

  def save
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first["id"].to_i
  end

  def ==(another_stylist)
    self.name.==(another_stylist.name).&(self.id.==(another_stylist.id))
  end

  def update(new_name)
    @name = new_name[:name]
    @id = self.id
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
    DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id};")
  end

  def clients
    clients_stylists = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id};")
      clients.each do |client|
      name = client["description"]
      stylist_id = client["stylist_id"].to_i
      appointment_date = client.fetch("appointment_date")
      clients_stylists << Client.new({:name => name, :stylist_id => stylist_id, :appointment_date => appointment_date})
        end
      clients_stylists
    end
  end
