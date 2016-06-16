
require './lib/atm.rb'

  # ATM funds added
  describe Atm do
    it 'has 1000$ on intitialize' do
      expect(subject.funds).to eq 1000
    end

    #funds reduced at withdraw
    it 'funds are reduced at withdraw' do
    subject.withdraw 50
    expect(subject.funds).to eq 950
  end
end
