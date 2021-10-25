class Bank_Account

	attr_reader :balance, :history

	def initialize(balance = 0)
		@balance = balance
		@history = [[get_current_date, "", "", balance]]
	end

	def deposit(amount)
		@balance += amount
		@history.push([get_current_date, "", amount, @balance])
	end

	def withdraw(amount)
		@balance -= amount
		# @history.push([get_current_date, "", amount, @balance])
	end

	private

	def get_current_date
		Time.now.strftime("%d/%m/%Y")
	end

end