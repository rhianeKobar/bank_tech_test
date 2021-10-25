require 'bank_account'



describe 'Bank account' do
	
	let(:account){Bank_Account.new}
	
	it 'should have a default balance of 0' do
		test_balance = Bank_Account.new
		expect(test_balance.balance).to eq 0
	end

	it 'should initialize with a balance of 1500' do
		test_balance = Bank_Account.new(1500)
		expect(test_balance.balance).to eq 1500
	end

end