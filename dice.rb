class Assignment
  def roll
    is_valid = get_inputs
    roll_dices(@dices,@sides) if is_valid  
  end

  def get_inputs
    puts "Enter Number of Dices:"
    @dices = gets
    @dices = @dices.to_i
    puts "Enter comma seperated values for number of sides without spaces for each dice:"
    @sides = gets
    @sides = @sides.chomp().split(',')
    validate(@dices,@sides)
  end

  def validate(dices,sides)
    errors = []
    if dices > 0 && dices != sides.length
      errors << "Please enter number of sides for all dices"
    end
    if dices <= 0
      errors << "Please enter valid number of dices"
    end
    sides.map do |s|
      if s.to_i <= 0
        errors << 'Please Enter valid side value'
      end       
    end
    if errors.count > 0
      puts errors.join(', ')
      return false
    else
      return true
    end
  end

  def roll_dices(dices,sides)
    total = 0
    dices.times do |d|
      random_to = sides[d].to_i
      num = rand(1..random_to)
      puts "Dice #{d + 1} number = #{num}"
      total = total + num 
    end
    puts "Total = #{total}"
    return total    
  end
end

# Uncomment below lines to run code
# Comment below line while running spec
# you can run spec by moving into this directory and run `rspec spec spec/dice_spec.rb`

# a = Assignment.new 
# total = a.roll 