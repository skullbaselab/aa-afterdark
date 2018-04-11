class CustomerNotifier
  def notify_customer_of_sale(customer)
    Emailer.send_email(customer[:email])
    Texter.send_text(customer[:phone])
  end

end

class Emailer
  def self.send_email(email_address)
    puts "Actually sent an email to #{email_address}"
  end
end

class Texter
  def self.send_text(phone_number)
    puts "Actually sent a text to #{phone_number}"
  end
end
