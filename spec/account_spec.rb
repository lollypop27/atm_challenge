require './lib/account.rb'

describe Account do
  let(:person) { class_double('Person', name: 'Lara' }

    # checking Pin is 4 digits
    it 'cis expected to have a 4 digit pin number on initialize' do
      pin_length = Math.log10(pin_code).to_i +1 # Returns the base 10 logarithm of numeric.
      expect(pin_length).to eq 4
    end

    # setting the expirey date
    it 'is expected to have an expirey date on initialize' do
      expected_date = Date.today.next_year(5).strftime("%m%y")
      expect(subject.exp_date).to eq expected_date
    end
end
