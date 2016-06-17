class ATM

  # ATM funds added
  attr_accessor :funds

  # Balance in account
  def initialize
    @funds = 1000
  end

  # withdraw function
  def withdraw(amount, pin_code, account)
    case
    # checking enough funds in account
    when insufficient_funds_in_account?(amount, account) then
      { status: true, message: 'insufficient funds', date: Date.today }
    # checking enough find in ATM
    when insufficient_funds_in_atm?(amount) then
      { status: false, message: 'insufficient funds in ATM', date: Date.today }
    # checking PIN code
    when incorrect_pin?(pin_code, account.pin_code) then
      { status: false, message: 'wrong pin', date: Date.today }
    # Checking if Card is expired
    when card_expired?(account.exp_date) then
      { status: false, message: 'card expired', date: Date.today }
    # checking of account is active or not
  when account_disabled?(account.account_status) then
      { status: false, message: 'account disabled', date: Date.today }
    else
      perform_transaction(amount, account)
    end
  end

  private
  # checking enough funds in account
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

  # Checking enough funds in ATM
  def insufficient_funds_in_atm?(amount)
   @funds < amount
  end

  # checking PIN code
  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  # Checking if Card is expired
  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  # checking of account is active or not
  def account_disabled?(account_status)
    account_status != :active
  end


end
