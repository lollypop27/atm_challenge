require './lib/account.rb'

describe Account do

    # checking Pin is 4 digits
    it 'is expected to have a 4 digit pin number on initialize' do
      pin_length = Math.log10(subject.pin_code).to_i + 1 # Returns the base 10 logarithm of numeric.
      expect(pin_length).to eq 4
    end

end
