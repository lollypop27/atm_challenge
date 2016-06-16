
require './lib/atm.rb'

  # ATM funds added
  describe Atm do
    let(:account) { class_double("Account")} #used for both the bank account and card class

    it 'has 1000$ on intitialize' do
      expect(subject.funds).to eq 1000
    end

    #funds reduced at withdraw
    it 'funds are reduced at withdraw' do
    subject.withdraw 50
    expect(subject.funds).to eq 950
  end

  # balnce reduced after withdraw
  before do
    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end
end
