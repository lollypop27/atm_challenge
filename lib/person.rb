class Person
  attr_accessor :name

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @account = nil
  end

  def create_account
    @account = Account.new(owner: self)
  end

  private

  def set_name(name)
    name == nil ? missing_name : name
  end

  def missing_name
    rais ArgumentError, 'A name is required'
  end

end
