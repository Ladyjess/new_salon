class Client

  attr_reader :name,:stylist_id, :appointment_date

  def initialize(properties)
    @name = properties[:name]
    @stylist_id = properties[:stylist_id]
    @appointment_date = properties[:appointment_date]
  end

  def self.all
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client["name"]
      stylist_id = client["stylist_id"].to_i
      appointment_date = client["appointment_date"]
      clients << Client.new({:name => name, :stylist_id => stylist_id, :appointment_date => appointment_date})
    end
    clients
  end

  def save
    DB.exec("INSERT INTO clients (name, stylist_id, appointment_date) VALUES ('#{@name}', #{@stylist_id}, '#{@appointment_date}')")
  end

  def ==(another_client)
   self.name.==(another_client.name).&(self.stylist_id.==(another_client.stylist_id)).&(self.appointment_date.==(another_client.appointment_date))
  end

  def delete
    DB.exec("DELETE FROM clients WHERE id = #{self.id};")
  end
end
