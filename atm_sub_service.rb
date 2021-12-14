# For debugging
# 
# require 'pry'
puts 'Please Enter value'

input_amount = gets.chomp

# Constant
# 
BADRESPONSE = 'Response 400 Bad Request/422 {}'

# Defined currency
# 
def currency_amount
  @quarter = 25
  @dime = 10
  @nickel = 5
  @penny = 1
end

# Calculation logic
# 
def calculate(input_amount)
  currency_amount
  currencies = %w[quarter dime nickel penny]
  result = {}
  remaining_amount = nil

  currencies.each do |currency|
    case currency
    when 'quarter'
      @coins = input_amount / @quarter
      remaining_amount = input_amount.remainder(@quarter)

      result.merge!(quarter: @coins) if @coins != 0
    when 'dime'
      @coins = remaining_amount / @dime
      remaining_amount = remaining_amount.remainder(@dime)

      result.merge!(dime: @coins) if @coins != 0
    when 'nickel'
      @coins = remaining_amount / @nickel
      remaining_amount = remaining_amount.remainder(@nickel)

      result.merge!(nickel: @coins) if @coins != 0
    when 'penny'
      @coins = remaining_amount / @penny
      remaining_amount = remaining_amount.remainder(@penny)

      result.merge!(penny: @coins) if @coins != 0
    end
  end
  p "Response 200 OK #{result}"
end

# logic to display approprate message
# 
if input_amount.match?(/[[:digit:]]/)
  if input_amount.include?('-')
    puts BADRESPONSE
  else
    input_amount = input_amount.to_i
    calculate(input_amount)
  end
elsif input_amount.match?(/[[:alpha:]]/)
  puts BADRESPONSE
end
