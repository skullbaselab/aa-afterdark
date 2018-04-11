class DriveIn
  attr_reader :name, :cash_register, :status
  def initialize(name)
    @name = name
    @cash_register = []
    @status = "closed"
  end

  def open
    @status = "open"
  end

  def serve_customer(customer)
    raise "Store is closed!" if @status == "closed"
    @cash_register << customer.pay(10)
    customer.consume("Special")
  end
end
