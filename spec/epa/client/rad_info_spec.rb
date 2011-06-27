require 'helper'

describe EPA::Client::RadInfo do

  before do
    @client = EPA::Client::RadInfo.new
  end
  
  describe ".catalog" do
    
    it "should return the correct list of databases when empty" do
      test = @client.catalog()
      test[0].should == "facility"
    end
    
    it "should return the columns for a given database" do
      test = @client.catalog("facility")
      test[0].should == 'CITY_NAME
    end
  end
  
end