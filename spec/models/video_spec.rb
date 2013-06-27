require "spec_helper"

describe Video do
  describe :validations do
    it "should require all columns" do
      v = Video.new
      v.valid?.should be_false
      v.errors.messages[:name].should be_present
      v.errors.messages[:slug].should be_present
      v.errors.messages[:publication_date].should be_present
      v.errors.messages[:video].should be_present
      v.errors.messages[:preview].should be_present
    end

    it "should be passable" do
      lambda {
        FactoryGirl.create(:video)
      }.should change(Video, :count).by(1)
    end

  end
end
