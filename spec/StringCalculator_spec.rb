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

  it "Add will handle newlines in addition to ','" do
    sc.Add("1\n2,3").should == 6
  end

  it "Add will handle newlines in addition to ','" do
    sc.Add("1\n2,3\n4\n5").should == 15
  end
end

describe "define the delimeter" do
  sc = nil

  before(:each) do
    sc = String_Calculator.new
  end

  after(:each) do
    sc = nil
  end

  it "'//;\n1;2' defines ; as the delimeter" do
    sc.get_delimeter_regex_from_input_string("//;\n1;2").should == ';'
  end

  it "'//;\n1;2' returns 3" do
    sc.Add("//;\n1;2").should == 3
  end

  it "'//-\n1-2-3-5-8' returns 19" do
    sc.Add("//-\n1-2-3-5-8").should == 19
  end
end

