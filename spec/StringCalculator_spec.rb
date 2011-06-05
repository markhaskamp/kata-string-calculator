require 'rspec'
require File.dirname(__FILE__) + '/../lib/String_Calculator.rb'

describe String_Calculator do

  sc = nil

  before(:each) do
    sc = String_Calculator.new
  end

  after(:each) do
    sc = nil
  end

  it "an empty string returns 0" do
    sc.Add("").should == 0 
  end

  it "nil returns 0" do
    sc.Add(nil).should == 0
  end

  it "a single number returns that number" do
    sc.Add('1').should == 1
    sc.Add('66').should == 66
    sc.Add('1492').should == 1492
  end

  it "two numbers, separated by commas, return their sum" do
    sc.Add("1,2").should == 3
  end

  it "add any number of numbers" do
    sc.Add("1,2,3").should == 6
    sc.Add("1,2,3,99").should == 105
    sc.Add("1,2,3,99, 42").should == 147
  end

  # it "Add will handle newlines in addition to ','" do
  #   sc.Add("1\\n2,3").should == 6
  # end

  # it "Add will handle multiple consecutive delimeters" do
  #   sc.Add("1\\n2,,3  4").should == 10
  # end

  # it "'1 2 3 4 5' will add up to 15" do
  #   sc.Add("1 2 3 4 5").should == 15
  # end

end

describe "define the delimeter" do
  sc = nil

  before(:each) do
    sc = String_Calculator.new
  end

  after(:each) do
    sc = nil
  end

  # it "'//;\\\\n1;2' returns 3" do
  #   sc.Add("//;\\n1;2").should == 3
  # end

  # it "'//-\\\\n1-2-3-4' returns 10" do
  #   sc.Add("//;\\n1-2-3-4").should == 10
  # end
end

