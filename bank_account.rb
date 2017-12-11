# 1. Common account transactions that normally occur for a bank account such as:
# - displaying your account number, 
# - checking and savings amount, 
# - total amount. 
# 2. There are also methods to invoke such as:
# - depositing a check, 
# - checking your balance, 
# - withdrawing money

# a) BankAccount should have a method that returns a user's account number, 
# account number should be generated by a private method, account number should be random.
# b) BankAccount should have a method that returns the user's checking account balance
# c) BankAccount should have a method that returns the user's saving account balance  
# d) BankAccount should allow a user to deposit money into either their checking or saving account  
# e) BankAccount should allow a user to withdraw money from one of their accounts, 
# return an error if there are insufficient funds  
# f) BankAccount should allow the user to view the total amount of money they have at the bank
# g) BankAccount should track how many accounts the bank currently has
# h) Add an interest_rate attribute that is not accessible by the user. Set it to 0.01
# j) A user should not be able to set any attributes from the BankAccount class

class BankAccount
    # attr_accessor :first_name, :last_name
    # attr_reader :last_name
    attr_reader :account #A) #DO NOT need the *at* WITHIN ATTR_ GETTER/SETTER METHODS
    attr_reader :acct_checking #B)
    attr_reader :acct_savings #C)
    # J) No writer methods provided to set any of the attributes directly.

    @@num_accounts =0; # G)
    # def initialize(f_name, l_name)
    # or just def initialize, without paratheses
    #   @first_name = f_name
    #   @last_name = l_name
    def initialize
        @account=gen_acct  # CAN CALL A FUNCTION gen_acct THIS WAY!
        @acct_checking=0
        @acct_savings=0
        @interest_rate = 0.01 # H) We simply provide no Getter (or Writer) methods for this attr.
        @@num_accounts+=1 # G)
    end

    # def deposit_chk(amount)
    #     @acct_checking+=amount
    # end
    # def deposit_svg(amount)
    #     @acct_savings+=amount
    # end

    def account_information # I)
        "User account: #{@account}\n#{total}\nChecking Balance: #{@acct_checking}\nSavings Balance: #{@acct_savings}\nInterest Rate: #{@interest_rate}\n"
    end
    # NOTE: #{self.total} or #{$total} are both ok methods in this case.

    def deposit(account, amount) #D)
        if account.downcase=checking
            @acct_checking+=amount
        else
            @acct_savings+=amount
        end
    end

    def withdrawal(account, amount) #E)
        if account.downcase == "checking"
            if @acct_checking-amount < 0
                raise "Insufficient Funds, you have #{@acct_checking} in this account"
            else
                @acct_checking-=amount
            end
        else
            if @acct_savings-amount < 0 
                raise "Insufficient Funds, you have #{@acct_savings} in this account"
            else
                @acct_savings-=amount
            end
        end
    end

    def total #F)
      "Your total balance is " + (@acct_checking+@acct_savings).to_s
    end
    
    private
    def gen_acct
        Array.new(10).map {rand(1..9)}.join
    end
end

me=BankAccount.new
puts me.account_information,"\n"