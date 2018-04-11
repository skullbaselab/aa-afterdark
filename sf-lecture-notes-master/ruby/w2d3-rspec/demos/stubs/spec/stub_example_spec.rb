require 'customer_notifier'

describe CustomerNotifier do
  subject(:customer_notifier) {CustomerNotifier.new}

  describe "#notify_customer_of_sale" do
    it "sends the customer a text AND and an email" do
      customer = {
        name: "Asher",
        email: "akingabramson@appacademy.io",
        phone: "415-767-6767"
      }

      customer_notifier.notify_customer_of_sale(customer)
    end
  end

end

