class Bank
  attr_accessor :account

  def initialize
    @account = Array.new(5)
  end

  def add_name(name)
    @account[0] = name
  end

  def add_credit(credit)
    @account[1] = credit
  end

end
