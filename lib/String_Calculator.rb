
class String_Calculator

  def Add s

    return 0 if s == nil

    numbers = get_array_from_string(s)
    numbers = numbers.map { |n| n.to_i } 
    return_val = numbers.reduce(:+)

    return return_val ||= 0
  end

  def get_array_from_string s
    s.gsub!(/\D/, ' ')

    a = s.split(' ')
    return a
  end
end
