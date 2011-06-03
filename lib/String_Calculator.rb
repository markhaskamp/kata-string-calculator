
class String_Calculator

  def Add s

    return 0 if s == nil

    numbers = get_array_from_string(s)

    return_val = 0
    numbers.each do |n|
      return_val += n.to_i unless n == nil
    end

    return return_val
  end

  def get_array_from_string s
    s.gsub!(/\D/, ' ')

    a = s.split(' ')
    return a
  end
end
