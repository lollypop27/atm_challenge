class Atm
  attr_accessor :funds

# ATM adding funds
def initialize
  @funds = 1000
end

# ATM Withdrawal
def withdraw(amount)
  @funds -= amount
end

# Checking that there is enough funds to withdraw
def withdraw(amount, account)
  case
  when amount > account.balance then
    return
  else
  @funds -= amount
  account.balance = account.balance - amount
  {status: true, message: 'success', Date.today, amount: amount}
  end
end
