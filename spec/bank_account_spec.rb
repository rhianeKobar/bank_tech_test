# frozen_string_literal: true

require 'bank_account'
require './spec/account_helper'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  let(:with_start_balance) { BankAccount.new(1500) }
  date_today = Time.now.strftime('%d/%m/%Y')

  it 'Should have a default balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'Should initialize with a balance of 1500' do
    expect(with_start_balance.balance).to eq 1500
  end

  it 'Should initialize with one entry in history' do
    expect(account.history).to include([date_today, '', '', account.balance])
  end

  describe 'Deposit' do
    it 'Should increase the balance by the amount entered' do
      add(3000)
      expect(account.balance).to eq 3000
    end

    it 'Should record the changes made' do
      add(3000)
      expect(account.history).to include([date_today, '', 3000, account.balance])
    end

    it 'Should raise an error if the deposit amount will go over the upper limit' do
      add(500_000_000)
      expect do
        account.deposit(1)
      end.to raise_error "Congratulations, you've hit the upper limit! This deposit will go to customers in debt!"
    end
  end

  describe 'Withdraw' do
    it 'Should decrease the balance by the amount entered' do
      remove(300)
      expect(with_start_balance.balance).to eq 1200
    end

    it 'Should record the changes made' do
      remove(300)
      expect(with_start_balance.history).to include([date_today, 300, '', with_start_balance.balance])
    end

    it 'Should raise an error if the withdrawal amount will go below the lower limit' do
      remove(11_500)
      expect do
        remove(10)
      end.to raise_error 'Unfortunately, any more withdrawals will put you over your overdraft limit.'
    end
  end

  describe 'Print statement' do
    it 'Should output the history in single lines of code' do
      add(3000.76)
      add(3000.65)
      account.withdraw(1500.34)
      expect(account.print_statement).to include([date_today, '', 3000.76, 3000.76])
    end
  end
end
