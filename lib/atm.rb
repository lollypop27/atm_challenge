class ATM
  attr_accessor :funds

# adding funds in the atm
  def initialize
    @funds = 1000
  end

# Withdrawal of funds
def withdraw(amount, account)
  case
  when insufficient_funds_in_account?(account.balance) then
   { status: false, message: 'insufficient funds', date: Date.today }

  # If not biger, transaction is performed and deduct the amount
  return
  else
    perform_transaction(amount, account)
  end
end

private

def insufficient_funds_in_account(amount, account)
  amount > account.balance
end

# deduct amounts from atm
def perform_transaction(amount, account)
    @funds -= amount
    account.balance -= account # deducting amount from balance
    { status: true, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount) } #response for successful Withdrawal
end
end
