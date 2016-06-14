require './lib/atm.rb'

# adding double class to manage account and card
describe Atm do
  let(:account) { class_double('Account') }

  # adding funds in the atm
    it 'has 1000$ on intitialize' do
      expect(subject.funds).to eq 1000
    end

# set value of balance and get a new balance
    before do
      allow(account).to receive(:balance).and_return(100)
      allow(account).to receive(:balance=)
    end

# checking the account to see if there is enough money
  it 'allow withdraw if account has enough balance.' do
    expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
    expect(subject.withdraw(45, account)).to eq expected_output
  end

# Withdrawal function
  it 'funds are reduced at withdraw' do
    subject.withdraw(50, account)
    expect(subject.funds).to eq 950
  end
end
