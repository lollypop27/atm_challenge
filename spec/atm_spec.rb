
require './lib/atm.rb'

describe ATM do
  let(:account) { class_double('Account') } #used for both the bank account and card class

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
    subject.withdraw(50, account)
    expect(subject.funds).to eq 950
    end

    # checking if there is enough funds
    it 'allow withdraw if account has enough balance.' do
      require 'date'
      expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
      expect(subject.withdraw(45, account)).to eq expected_output
    end
end
