
class String_Calculator

  def Add s

    return 0 if s == nil

    return_val = 0
    negative_numbers = ''
    leader = ''

    numbers = get_array_from_string(s)
    numbers = numbers.map { |n| n.to_i } 
    
    numbers.each do |n|
      if (n < 0)
        negative_numbers += "#{leader}#{n.to_s}"
        leader = ","
      else
        return_val += n if n < 1000
      end
    end

    raise "negatives not allowed: #{negative_numbers}" if negative_numbers.length > 0
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
