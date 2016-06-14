class Atm
  attr_accessor :funds

# adding funds in the atm
  def initialize
    @funds = 1000
  end

# Withdrawal of funds
def withdraw(amount, account)
  # check if there is enough funds
  case
  # exit method if amount to withdral is biiger than the balance
when insufficient_funds_in_account?(account.balance) then
    return
  # If not biger, transaction is performed and deduct the amount
  else
    perform_transaction(amount, account)
  end
end

private

def perform_transaction?(amount, account)
  amount > account.balance
end

# deduct amounts from atm
def perform_transaction(amount, account)
    @funds -= amount
    account.balance = account.balance - amount # deducting amount from balance
    { status: true, message: 'success', date: Date.today, amount: amount } #response for successful Withdrawal
  end
end
