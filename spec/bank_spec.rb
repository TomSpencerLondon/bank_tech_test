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

  it 'is possible to add credit to the account' do
    credit = 500
    subject.add_credit(credit)
    expect(subject.account[1]).to eq(credit)
  end
end
