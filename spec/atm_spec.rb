require './lib/atm.rb'

# adding double class to manage account and card
describe ATM do
  let(:account) { class_double('Account') }

# set value of balance and get a new balance
before do
  allow(account).to receive(:balance).and_return(100)
  allow(account).to receive(:balance=)
end

# adding funds in the atm
it 'has 1000$ on intitialize' do
  expect(subject.funds).to eq 1000
end

# Withdrawal function
it 'funds are reduced at withdraw' do
  subject.withdraw(50, account)
  expect(subject.funds).to eq 950
end

# checking the account to see if there is enough money and amounts drawn are corrects
it 'allow withdraw if account has enough balance.' do
  { status: true, message: 'success', date: Date.today, amount: 45, bills: [10,10,20,5] }
  expect(subject.withdraw(45, account)).to eq expected_output
end

# If not enough funds in account
it 'reject withdraw if account has insufficient funds' do
  expected_output = { status: true, message: 'insufficient funds', date: Date.today }
  expect(subject.withdraw(105, account)).to eq expected_output
end
end
