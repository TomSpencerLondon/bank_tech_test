class Bank

  AMOUNT = 0

  attr_accessor :account, :customer, :balance

  def initialize
    @customer = { :name => [], :date => [], :credit => [], :debit => [], :balance => [] }
    @balance = AMOUNT
  end

  def add_name(name)
    @customer[:name] = name
  end

  def add_credit(credit)
    @customer[:credit] = credit
    @balance += credit
  end

  def withdraw(debit)
    @customer[:debit] = debit
    @balance -= debit
  end

  def save_account
    file = File.open("account.csv", "w")
    @customer.each do |detail|
      csv_line = @customer.join(",")
      file.puts csv_line
    end
    file.close
  end

end
