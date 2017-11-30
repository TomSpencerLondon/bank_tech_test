require 'date'
require 'csv'

class Bank

  AMOUNT = 0
  HEADER = "date || credit || debit || balance"

  attr_accessor :account, :transaction, :balance

  def initialize
    @balance = AMOUNT
    @transaction = { :date => "", :credit => "", :debit => "", :customer_balance => "" }
  end

  def add_name(name)
    @transaction[:name] = name
  end

  def add_date
    date = Date.today
    @transaction[:date] = date
  end

  def add_credit(credit)
    add_date
    @transaction[:debit] = " "
    @transaction[:credit] = convert_to_currency(credit)
    @balance += credit
    @transaction[:customer_balance] = convert_to_currency(@balance)
    save_account
  end

  def withdraw(debit)
    add_date
    @transaction[:credit] = " "
    @transaction[:debit] = convert_to_currency(debit)
    @balance -= debit
    @transaction[:customer_balance] = convert_to_currency(@balance)
    save_account
  end

  def save_account
    CSV.open("../account.csv", "w") do |csv|
      csv << @transaction.values
    end
  end

  def convert_to_currency(integer)
    format('%.2f', integer)
  end

  def print_statement
    p HEADER
    CSV.foreach("../account.csv") do |row|
    p row.join("||")
    end
  end
end

bank = Bank.new
bank.add_credit(100)
bank.withdraw(10)
bank.print_statement
