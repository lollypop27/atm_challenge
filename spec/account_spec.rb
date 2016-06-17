require './lib/account.rb'

describe Account do

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

end
