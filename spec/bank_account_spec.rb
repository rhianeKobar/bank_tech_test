require 'bank_account'



describe 'Bank account' do
	
	let(:account){Bank_Account.new}
	let(:with_start_balance){Bank_Account.new(1500)}
	
	it 'Should have a default balance of 0' do
		expect(account.balance).to eq 0
	end

	it 'Should initialize with a balance of 1500' do
		expect(with_start_balance.balance).to eq 1500
	end

	it 'Should initialize with one entry in history' do
		expect(account.history.length).to eq 1
	end

	describe 'Deposit' do
		
		it 'Should increase the balance by the amount entered' do
			account.deposit(3000)
			expect(account.balance).to eq 3000
		end

		it 'Should record the changes made' do
			account.deposit(3000)
			expect(account.history.length).to eq 2
		end

	end
	
	describe 'Withdraw' do
		
		it 'Should decrease the balance by the amount entered' do
			with_start_balance.withdraw(300)
			expect(with_start_balance.balance).to eq 1200
		end

		# it 'Should record the changes made' do
		# 	account.deposit(3000)
		# 	expect(account.history.length).to eq 2
		# end

	end

end