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
end
  

