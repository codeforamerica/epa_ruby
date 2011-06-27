require 'helper'

describe EPA::Client::RadInfo do

  before do
    @client = EPA::Client::RadInfo.new
  end
  
  describe ".catalog" do
    
    it "should return the correct list of databases" do
      test = @client.catalog()
      test[0].should == "Regulatory Program"
    end
  end
  
end