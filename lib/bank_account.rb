# frozen_string_literal: true

# class BankAccount
class BankAccount
  UPPER_LIMIT = 500_000_000.00
  LOWER_LIMIT = -10_000.00
  attr_reader :balance, :history

  def initialize(balance = 0.00)
    @balance = balance
    @history = [Transaction.new(current_date, "-", "-", balance)]
  end

  def deposit(amount)
    if upper_limit?(amount)
      raise "Congratulations, you've hit the upper limit! This deposit will go to customers in debt!"
    end

    @balance += amount
    @history << Transaction.new(current_date, "-", amount, @balance) 
  end

  def withdraw(amount)
    raise 'Unfortunately, any more withdrawals will put you over your overdraft limit.' if lower_limit?(amount)

    @balance -= amount
    @history << Transaction.new(current_date, amount, "-", @balance) 
  end

  def print_statement
    statement_header
    @history.each do |entry|
      p "#{entry.date} ||     #{entry.withdrawal}     ||       #{entry.deposit}      ||       #{entry.balance}   "
    end
  end

  private

  def current_date
    Time.now.strftime('%d/%m/%Y')
  end

  def upper_limit?(amount)
    amount + @balance > UPPER_LIMIT
  end

  def lower_limit?(amount)
    @balance - amount < LOWER_LIMIT
  end

  def statement_header
    p 'Date       || Withdrawal || Deposit || Balance'
  end
end
