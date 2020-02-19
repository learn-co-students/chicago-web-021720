require 'pry'

class Account
  attr_reader :id
  attr_accessor :balance

  def initialize(id, balance)
    @id = id
    @balance = balance
    p self
  end

  def initialize_again(first, second)
    puts "RUNNING INIT AGAIN"
  end

  def deposit(amount)
    # self.balance = balance + amount
    self.balance += amount
  end

  def withdraw(amount)
    if self.balance >= amount
      self.balance -= amount
    else
      raise(ArgumentError, "sorry, you cannot withdraw that much. your current balance is #{balance}")
    end
  end

  # def id
  #   @id
  # end

  # def balance
  #   @balance
  # end

  # def balance=(new_value)
  #   @balance = new_value
  # end

  # Account#instance_method
  def instance_info
    "I am an instance method of Account with id #{self.id} and a balance of #{balance} !"
  end

  # Account.class_method
  def self.class_method
    "I am the #{self} class!"
  end
end

# puts "Welcome to MyBank! Please create your account: What is your user id?"
# user_id = gets.chomp.to_i
#
# puts "Thanks! and what is your bank balance?"
# user_balance = gets.chomp.to_i

account = Account.new(3, 100)
binding.pry
