# frozen_string_literal: true

def remove(amount)
  with_start_balance.withdraw(amount)
end

def add(amount)
  account.deposit(amount)
end
