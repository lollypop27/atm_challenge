class Atm

  # ATM funds added
  attr_accessor :funds

  # Balance in account
  def initialize
    @funds = 1000
  end

  # funds deduct on withdraw
  def withdraw(amount)
    @funds -= amount
  end
end
