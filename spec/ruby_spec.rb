describe "ruby syntax" do
  describe "ruby split with regex" do
    it "'1 2 3 4' splits on space to a 4 item array" do
      "1 2 3 4".split(' ').count.should == 4
    end
    it "'1 2 3 4'.gsub(/\\D/, ' ') splits on space to a 4 item array" do
      "1 2 3 4".gsub!(/\D/,' ').split(' ').count.should == 4
    end
    it "'1 2 3 4'.gsub(/\\D/, ' ')split.reduce(:+) with add = 10" do
      "1 2 3 4".gsub!(/\D/,' ').split(' ').reduce(:+) == 10
    end
  end

  describe "regex matching" do

    it "using parens in regex" do
      "mark haskamp" =~ /^.*\s(.)/
      $1.should == 'h'
    end

    it "regex match is greedy" do
      "mark haskamp" =~ /^(.*)a/
      $1.should == 'mark hask'
    end
  end
end
