class Account
    protected attr_reader :balance

    def initialize(balance)
        @balance = balance
    end

    def greater_balance_than?(other)
        @balance > other.balance
    end
end

class Transaction
    def initialize(account_a, account_b)
        @account_a = account_a
        @account_b = account_b
    end

    def transfer(amount)
        debit(@account_a, amount)
        credit(@account_b, amount)
    end

    private def debit(account, amount)
        account.balance -= amount
    end

    private def credit(account, amount)
        account.balance += amount
    end
end

savings = Account.new(100)
checking = Account.new(200)
p savings
p checking

transaction = Transaction.new(checking, savings)
transaction.transfer(50)
p savings
p checking
