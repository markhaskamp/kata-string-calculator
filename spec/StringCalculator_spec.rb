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
    sc.Add('1492').should == 0
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

  it "'//;\\n1;2' defines ; as the delimeter" do
    sc.get_delimeter_regex_from_input_string("//;\n1;2").should == ';'
  end

  it "'//;\\n1;2' returns 3" do
    sc.Add("//;\n1;2").should == 3
  end

  it "'//-\\n1-2-3-5-8' returns 19" do
    sc.Add("//-\n1-2-3-5-8").should == 19
  end

  it "delimeter defintion prefix can be ommitted" do
    sc.Add("1,2,3,5,8").should == 19
  end
end

describe "negatives throw an exception" do
  sc = nil

  before(:each) do
    sc = String_Calculator.new
  end

  after(:each) do
    sc = nil
  end

  it "Add will throw an exception if input string contains a negative number" do
    lambda {sc.Add("1,-1")}.should raise_error("negatives not allowed: -1")
  end

  it "negative numbers throw an exception, exception contains the negative number" do
    lambda {sc.Add("1,-1")}.should raise_error("negatives not allowed: -1")
  end

  it "1,2,-1,-2 raises exception with -1 and -2 in the execption message" do
    lambda {sc.Add("1,2,-1,-2")}.should raise_error("negatives not allowed: -1,-2")
  end
end

describe "numbers > 1000 aren't added" do
  sc = nil

  before(:each) do
    sc = String_Calculator.new
  end

  after(:each) do
    sc = nil
  end

  it "1,1001 == 1" do
    sc.Add("1,1001").should == 1
  end

  it "//;\\n1;1001;2;1002 == 3" do
    sc.Add("//;\n1;1001;2;1002").should == 3
  end
end

describe "Delimeters can be longer than 1 characters" do
  sc = nil

  before(:each) do
    sc = String_Calculator.new
  end

  after(:each) do
    sc = nil
  end

  it "//foo\n1foo2foo3foo5foo8 == 19" do
    sc.Add("//foo\n1foo2foo3foo5foo8").should == 19
  end

  it "//<>o\n1<>2<>3<>5<>8 == 19" do
    sc.Add("//<>\n1<>2<>3<>5<>8").should == 19
  end

  it "//a long delimeter with spaces\n1a long delimeter with spaces2a long delimeter with spaces3a long delimeter with spaces5a long delimeter with spaces8a long delimeter with spaces13 == 32" do
    sc.Add("//a long delimeter with spaces\n1a long delimeter with spaces2a long delimeter with spaces3a long delimeter with spaces5a long delimeter with spaces8a long delimeter with spaces13").should == 32
  end
end

