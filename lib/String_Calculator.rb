
class String_Calculator

  def Add s

    return 0 if s == nil

    numbers = get_array_from_string(s)
    numbers = numbers.map { |n| n.to_i } 
    
    numbers.each do |n|
      raise("negatives not allowed") if n < 0
    end
    return_val = numbers.reduce(:+)

    return return_val ||= 0
  end

  def get_array_from_string s
    delimeter = get_delimeter_regex_from_input_string s
    a = s.split(delimeter)
    return a
  end

  def get_delimeter_regex_from_input_string s

    s =~ /^\/\/(.)\n/

    return $1 unless $1 == nil

    return /[\n,]/
  end
end
