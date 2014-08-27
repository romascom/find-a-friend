require 'spec_helper'

describe SessionsController do
  describe '.new session' do
    context "when not logged in" do
      before(:each) do
        get :new
      end
      it "should redirect to CAS" do
        expect(response).to be_redirect
        expect(response.location).not_to eq root_url
      end
    end
    context "when logged in" do
      before(:each) do
        RubyCAS::Filter.fake("test")
        get :new
      end
      it "should redirect back to the root path" do
        expect(response.location).to eq root_url
        expect(response).to redirect_to root_path
      end
    end
    context "when logging out" do
      before do
        binding.pry
        RubyCAS::Filter.fake("test")
        get :destroy
      end
      it "should log out and redirect to root" do
        expect(response.location).to eq root_url
        expect(response).to redirect_to root_path
      end
    end
  end
end
