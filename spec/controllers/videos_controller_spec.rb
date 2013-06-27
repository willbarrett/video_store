require "spec_helper"

describe VideosController do
  describe :index do

    it "should load" do
      get :index
      response.code.should eq('200')
    end

  end
end
