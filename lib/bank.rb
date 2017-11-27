class Bank

  AMOUNT = 0

  attr_accessor :account, :balance

  def initialize
    @account = Array.new(5)
    @balance = AMOUNT
  end

  def add_name(name)
    @account[0] = name
  end

  def add_credit(credit)
    @account = Array.new(5)
    @account[1] = credit
    @balance += credit
  end

  def withdraw(debit)
    @account = Array.new(5)
    @balance -= debit
  end


end
