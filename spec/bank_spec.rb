require 'bank'

describe Bank do
  let(:subject){ Bank.new }

  it 'has an empty account with 5 spaces for name, date, credit, debit and balance' do
    expect(subject.account.length).to eq(5)
  end

  it 'is possible to add a name to the account' do
    name = "David Johnson"
    subject.add_name(name)
    expect(subject.account[0]).to eq(name)
  end

  it 'is possible to add credit to the account and increase balance' do
    credit = 1000
    subject.add_credit(credit)
    expect(subject.account[1]).to eq(credit)
    expect(subject.balance).to eq(1000)
  end

  it 'is possible to debit the account and decrease the balance' do
    credit = 1000
    subject.add_credit(credit)
    debit = 500
    subject.withdraw(debit)
    expect(subject.balance).to eq(500)
  end

  it 'is possible to save the account information to a CSV file' do
    filename = "account.csv"
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, date, credit, debit, balance = line.chomp.split(',')
      account = subject.account << name, date, credit, debit, balance
    end
    p account
    file.close
    expect(subject.account[0]).to eq(name)
  end

end
