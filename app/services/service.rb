class Service
  def self.call(*args)
    new(*args).call
  end

  def call
    raise 'Must be overridden by sublcass'
  end
end
