require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  def self.parse(rpn_string)
    arr = rpn_string.split(" ")
    return arr
  end

  def self.evaluate(rpn_list)
    stack = Stack.new
    rpn_list.each do |item|
      if RPNCalculator.is_number(item)
        stack.push(item.to_f)
      end
      if RPNCalculator.is_operation(item)
        x = stack.pop
        y = stack.pop
        stack.push(y.method(item).(x))
      end
    end
    return stack.pop
  end

  def self.is_operation(operation)
    if ["+", "-", "^", "*", "/"].include?(operation)
      return true
    end
    return false
  end

  def self.is_number(num)
    if num.match(/[-]?\d+/)
      return true
    end
    return false
  end

end



