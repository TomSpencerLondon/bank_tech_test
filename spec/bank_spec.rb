require 'bank'

describe Bank do
  let(:subject){ Bank.new }


  it 'is possible to add a name to the account' do
    name = "David Johnson"
    subject.add_name(name)
    expect(subject.customer[:name]).to eq(name)
  end

  it 'is possible to add credit to the account and increase balance' do
    credit = 1000
    subject.add_credit(credit)
    expect(subject.customer[:credit]).to eq(credit)
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
      account = subject.customer << name, date, credit, debit, balance
    end
    p account
    file.close
    expect(subject.customer[:name]).to eq(name)
  end

end
