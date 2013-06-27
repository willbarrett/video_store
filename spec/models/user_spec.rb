require "spec_helper"

describe User do
  describe :validations do
    it "should require all fields on create" do
      u = User.new
      u.valid?.should be_false
      u.errors.messages[:name].should be_present
      u.errors.messages[:email].should be_present
      u.errors.messages[:password].should be_present
    end

    it "should require password to match confirmation" do
      u = FactoryGirl.build(:user)
      u.password_confirmation = "aralkadlfkhalkfuh"
      u.valid?.should be_false
      u.errors.messages[:password].should be_present
    end

    it "should be passable" do
      lambda {
        FactoryGirl.create(:user)
      }.should change(User, :count)
    end

    it "should require email to be unique" do
      u1 = FactoryGirl.create(:user, email: 'hello@example.com')
      u2 = FactoryGirl.build(:user, email: 'hello@example.com')
      u2.save.should be_false
      u2.errors.messages[:email].should be_present
    end
  end
end
