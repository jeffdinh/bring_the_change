require "pry"
require 'minitest/autorun'

class Register
	def initialize amount
		@amount   =  (amount*100).to_i
		@quarters =  25
		@dimes    =  10
		@nickles  =  5
		@pennies  =  1
	end

	def change 
		@number_of_quarters = @amount/@quarters
		@after_quarters = @amount.%(@quarters)
		@number_of_dimes = @after_quarters/@dimes
		@after_dimes = @after_quarters.%(@dimes)
		@number_of_nickles = @after_dimes/@nickles
		@after_nickles = @after_dimes.%(@nickles)
		@number_of_pennies = @after_nickles/@pennies
		@change = [@number_of_quarters, @number_of_dimes, @number_of_nickles, @number_of_pennies]
	end
end


class RegisterTest < Minitest::Test
	def test_1
		r = Register.new (0.68)
		assert_equal [2,1,1,3], r.change
	end

	def test_2
		r = Register.new (0.88)
		assert_equal [3,1,0,3], r.change
	end


	def test_3
		r =	Register.new (0.33)
		assert_equal [1,1,0,3], r.change
	end

	def test_3
		r = Register.new (0.77)
		assert_equal [3,0,0,2], r.change
	end
end