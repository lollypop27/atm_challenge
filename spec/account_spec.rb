require './lib/account.rb'

describe Account do
  let(:person) {instance_double('Person', name: 'Lara')}
  subject { described_class.new({owner: person}) }

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end

    # checking Pin is 4 digits
    it 'is expected to have a 4 digit pin number on initialize' do
      pin_length = Math.log10(subject.pin_code).to_i + 1 # Returns the base 10 logarithm of numeric.
      expect(pin_length).to eq 4
    end

    # have balance
    it 'is expected to have a balance of 0 on initialize' do
      expect(subject.balance).to eq 0
    end

    # Atm Check the account balance
    it 'is expected to have :active status on initialize' do
      expect(subject.account_status).to eq :active
    end

    it 'deactivates account using Class method' do
      Account.deactivate(subject)
      expect(subject.account_status).to eq :deactivated
    end

    it 'is expected to have an owner' do
      expect(subject.owner).to eq person
    end

    it 'is expected to raise error if no owner is set' do
      expect { described_class.new }.to raise_error 'An Account owner is required'
    end

end
