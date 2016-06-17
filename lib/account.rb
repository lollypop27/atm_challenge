class Account
  attr_accessor :pin_code, :balance, :account_status

   STANDARD_VALIDITY_YEARS = 5

  def initialize(attrs = {})
    @pin_code = generate_pin
    @balance = 0
    @account_status = :active
    set_owner(attrs[:owner])
  end

  private

  def set_exp_date
    Date.today.next_year(STANDARD_VALIDITY_YEARS).strftime("%m/%y")
  end
  
  def generate_pin
    rand(1000..9999)
  end

  def self.deactivate(account)
    account.account_status = :deactivated
  end

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise "An Account owner is required"
  end
end
