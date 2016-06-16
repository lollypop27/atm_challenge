class ATM

  # ATM funds added
  attr_accessor :funds

  # Balance in account
  def initialize
    @funds = 1000
  end

  # withdraw function
  def withdraw(amount, account)
    case
    when insufficient_funds_in_account?(amount, account) then

      return
    else
      perform_transaction(amount, account)
    end
  end

  private
  # checcking enough funds
  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  # deducting amount from ATM and users account
  def perform_transaction(amount, account)
    @funds -= amount # funds deducted on withdrawal from ATM
    account.balance -= amount # deducts the amount from users balance
    require 'date'
    { status: true, message: 'success', date: Date.today, amount: amount } # success response on withdraw
    end
  end
