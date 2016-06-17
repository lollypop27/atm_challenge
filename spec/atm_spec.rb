
require './lib/atm.rb'
require 'date'

describe ATM do
  let(:account) { class_double('Account',
                                balance:100,
                                pin_code: '1234',
                                exp_date: '04/17',
                                account_status: :active) } #used for both the bank account and card class

    # ATM funds added
    it 'has 1000$ on intitialize' do
      expect(subject.funds).to eq 1000
    end

    # balance reduced after withdraw
    before do
      allow(account).to receive(:balance).and_return(100)
      allow(account).to receive(:balance=)
    end

    # funds/balance reduced at withdraw
    it 'funds are reduced at withdraw' do
    subject.withdraw(50, '1234', account)
    expect(subject.funds).to eq 950
    end

    # checking if there is enough funds in account
    it 'allow withdraw if account has enough balance.' do
      expected_output = { status: true, message: 'success', date: Date.today, amount: 45, bills: [20, 20, 5] }
      expect(subject.withdraw(45, '1234', account)).to eq expected_output
    end

    #  not enough money in the account reject withdraw
    it 'reject withdraw if account has insufficient funds' do
      expected_output = { status: true, message: 'insufficient funds', date: Date.today}
      expect(subject.withdraw(105, '1234', account)).to eq expected_output
    end

    # checking enough funds in ATM
    it 'reject withdraw if ATM has insufficient funds' do
      subject.funds = 50 # decrease the funds value
      expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
        expect(subject.withdraw(100, '1234', account)).to eq expected_output # prepare our assertion/expectation
    end

    # Checking Pin code
    it 'reject withdraw if pin is wrong' do
      expected_output = { status: false, message: 'wrong pin', date: Date.today }
      expect(subject.withdraw(50, 9999, account)).to eq expected_output
    end

    # Checking to see if Card has expired
    it 'reject withdraw if card is expired' do
      allow(account).to receive(:exp_date).and_return('01/16')
      expected_output = { status: false, message: 'card expired', date: Date.today }
      expect(subject.withdraw(6, '1234', account)).to eq expected_output
    end

    # checking of account is active or not
    it 'reject withdraw if account is disabled' do
      allow(account).to receive(:account_status).and_return(:disabled)
      expected_output = { status: false, message: 'account disabled', date: Date.today }
      expect(subject.withdraw(5, '1234', account)).to eq expected_output
    end

end
