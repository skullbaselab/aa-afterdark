class KeeperOfSecrets

  attr_reader :exposed_data

  def initialize
    @exposed_data = "I'll expose this"
    @hidden_data = "I'll keep this to myself..."
  end

  def self.this_is_a_class_method
    puts "I am a class method! I don't belong to an instance!"
  end

  def not_secret
    puts 'I am not secret at all'
  end

  protected

  def kinda_secret
    puts 'I am only kinda secret'
  end

  private

  def super_secret
    puts 'I am super secret'
  end

  public

  def reveal_secrets
    super_secret
    kinda_secret
    not_secret
  end
end
