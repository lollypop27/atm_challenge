class Atm
  attr_accessor :funds

# adding funds in the atm
  def initialize
    @funds = 1000
  end

# Withdrawal
def withdraw(amount, account)
  case # check if there is enough funds
  when amount > account.balance then # exit method if amount to withdral is biiger than the balance
    return
  else # If not biger, transaction is performed and deduct the amount
    @funds -= amount
    account.balance = account.balance - amount # deducting amount from balance
    { status: true, message: 'success', date: Date.today, amount: amount } #response for successful Withdraw  al
  end
  end
end
