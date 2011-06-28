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
      test[0].should == 'CITY_NAME'
    end
  end
  
  describe ".facility" do
    before do
      stub_get("rad_facility/CITY_NAME/PASADENA").
        to_return(:status => 200, :body => fixture("facility.xml"))
    end
    
    it "should return the correct item" do
      test = @client.facility(:column => 'CITY_NAME', :value => 'PASADENA')
      a_get("rad_facility/CITY_NAME/PASADENA").should have_been_made
      test.rad_facility_list.rad_facility[0].city_name.should == "PASADENA"
    end
  end
  
  describe ".facility_type" do
    before do
      stub_get("rad_facility_type/SEC_CIT_REF_FLAG/N").
        to_return(:status => 200, :body => fixture("facility_type.xml"))
    end
    
    it "should return the correct item" do
      test = @client.facility_type(:column => 'SEC_CIT_REF_FLAG', :value => 'N')
      a_get("rad_facility_type/SEC_CIT_REF_FLAG/N").should have_been_made
      test.rad_facility_type_list.rad_facility_type[0].subpart_id.should == "B"
    end
  end
  
  describe ".geo" do
    before do
      stub_get("rad_geo_location/RAD_SYS_ID/RAD200000137").
        to_return(:status => 200, :body => fixture("geo.xml"))
    end
    
    it "should return the correct item" do
      test = @client.geo(:column => 'RAD_SYS_ID', :value => 'RAD200000137')
      a_get("rad_geo_location/RAD_SYS_ID/RAD200000137").should have_been_made
      test.rad_geo_location_list.rad_geo_location.rad_sys_id.should == "RAD200000137"
    end
  end
  
end