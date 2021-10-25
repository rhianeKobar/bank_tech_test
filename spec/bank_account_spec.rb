require 'bank_account'
require './spec/account_helper.rb'



describe 'Bank account' do
	
	let(:account){Bank_Account.new}
	let(:with_start_balance){Bank_Account.new(1500)}
	date_today = Time.now.strftime("%d/%m/%Y")
	
	it 'Should have a default balance of 0' do
		expect(account.balance).to eq 0
	end

	it 'Should initialize with a balance of 1500' do
		expect(with_start_balance.balance).to eq 1500
	end

	it 'Should initialize with one entry in history' do
		expect(account.history).to include([date_today, "", "", account.balance])
	end

	describe 'Deposit' do
		
		it 'Should increase the balance by the amount entered' do
			add(3000)
			expect(account.balance).to eq 3000
		end

		it 'Should record the changes made' do
			add(3000)
			expect(account.history).to include([date_today, "", 3000, account.balance])
		end

		it 'Should raise an error if the deposit amount will go over the upper limit' do
			add(500000000)
			expect{account.deposit(1)}.to raise_error "Congratulations, you've hit the upper limit! We've redirected this deposit to one of our customers in debt!"
		end

	end
	
	describe 'Withdraw' do
		
		it 'Should decrease the balance by the amount entered' do
			remove(300)
			expect(with_start_balance.balance).to eq 1200
		end

		it 'Should record the changes made' do
			remove(300)
			expect(with_start_balance.history).to include([date_today,300, "", with_start_balance.balance])
		end

		it 'Should raise an error if the withdrawal amount will go below the lower limit' do
			remove(11500)
			expect{remove(10)}.to raise_error "Unfortunately, your account is #{with_start_balance.balance} and any more withdrawals will put you over your overdraft limit."
		end

	end

end