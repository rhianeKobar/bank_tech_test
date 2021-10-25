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

		it 'Should raise an error if the deposit amount will go over the upper limit' do
			account.deposit(500000000)
			expect{account.deposit(1)}.to raise_error "Congratulations, you've hit the upper limit! We've redirected this deposit to one of our customers in debt!"
		end

	end
	
	describe 'Withdraw' do
		
		it 'Should decrease the balance by the amount entered' do
			with_start_balance.withdraw(300)
			expect(with_start_balance.balance).to eq 1200
		end

		it 'Should record the changes made' do
			with_start_balance.deposit(3000)
			expect(with_start_balance.history.length).to eq 2
		end

		it 'Should raise an error if the deposit amount will go over the upper limit' do
			account.withdraw(10000)
			expect{account.withdraw(10)}.to raise_error "Unfortunately, your account is #{account.balance} and any more withdrawals will put you over your overdraft limit."
		end

	end

end