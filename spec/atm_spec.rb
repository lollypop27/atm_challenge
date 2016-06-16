require './lib/atm.rb'

# adding double class to manage account and card
describe ATM do
  let(:account) { class_double('Account', pin_code: '1234', exp_date: '04/17', account_status) }

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
    subject.withdraw(50, '1234', account)
    expect(subject.funds).to eq 950
  end

  # checking the account to see if there is enough money and amounts drawn are corrects
  it 'allow withdraw if account has enough balance.' do
    { status: true, message: 'success', date: Date.today, amount: 35, bills: [20,10,5] }
    expect(subject.withdraw(35, account)).to eq expected_output
  end

  # If not enough funds in account
  it 'reject withdraw if account has insufficient funds' do
    expected_output = { status: true, message: 'insufficient funds', date: Date.today }
    expect(subject.withdraw(105, account)).to eq expected_output
  end

  # If not enough funds in ATM
  it 'reject withdraw if ATM has insufficient funds' do
    subject.funds = 50
    expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    expect(subject.withdraw(100, account)).to eq expected_output
  end

  # If pin code entered is incorrect
  it 'reject withdraw if pin is wrong' do
    expected_output = { status: false, message: 'wrong pin', date: Date.today }
    expect(subject.withdraw(50, 9999, account)).to eq expected_output
  end

  # If the card has expired
  it 'reject withdraw if card is expired' do
    allow(account).to receive(:exp_date).and_return('05/16')
    expected_output = { status: false, message: 'card expired', date: Date.today }
    expect(subject.withdraw(6, '1234', account)).to eq expected_output
  end

  # Check to see if account is active or not
  it 'reject withdraw if account is disabled' do
    allow(account).to receive(:account_status).and_return(:disbaled)
    expected_output = { status: false, message: 'account disabled', date: Date.today }
    expect(subject.withdraw(5, '1234', account)).to eq expected_output
  end
end
