require './lib/atm.rb'

# Adding funds
describe Atm do
  it 'has 1000$ on intitialize' do
    expect(subject.funds).to eq 1000
end

# Withdrawal funds
it 'funds are reduced at withdraw' do
    subject.withdraw 50
    expect(subject.funds).to eq 950
end

# Successful response
let(:account) { class_double('Account') }

before do
  allow(account).to receive(:balance).and_return(100)
  allow(account).to receive(:balance=)
end

# Atm needs to know if there is enough funds before transaction is cleared
it 'allow withdraw if account has enough balance.' do
    expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
    expect(subject.withdraw(45, account)).to eq expected_output
end
end
