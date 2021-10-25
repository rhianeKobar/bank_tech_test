class Bank_Account

	UPPER_LIMIT = 500000000
	LOWER_LIMIT = -10000
	attr_reader :balance, :history

	def initialize(balance = 0)
		@balance = balance
		@history = [[get_current_date, "", "", balance]]
	end

	def deposit(amount)
		fail "Congratulations, you've hit the upper limit! We've redirected this deposit to one of our customers in debt!" if upper_limit?(amount)
		@balance += amount
		@history.push([get_current_date, "", amount, @balance])
	end

	def withdraw(amount)
		fail "Unfortunately, your account is #{@balance} and any more withdrawals will put you over your overdraft limit." if lower_limit?(amount)
		@balance -= amount
		@history.push([get_current_date,amount,"", @balance])
	end

	private

	def get_current_date
		Time.now.strftime("%d/%m/%Y")
	end

	def upper_limit?(amount)
		amount + @balance > UPPER_LIMIT
	end

	def lower_limit?(amount)
		@balance - amount < LOWER_LIMIT
	end

end