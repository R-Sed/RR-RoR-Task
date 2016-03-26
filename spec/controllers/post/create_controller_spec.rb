require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "POST #create" do
    before(:all) do
      @user = create(:user)
    end

    before do
      sign_in User.first
      headers = {
        "ACCEPT" => "application/json",
      }
      post :create, { post: { title: 'rspec', text: 'this is the test' }}, headers
      @new_post = Post.first
    end

    it "was created and belong to right user" do
      expect(response).to redirect_to('/users/User_1')
    end

    it "has right title" do
      expect(@new_post.title).to eq('rspec')
    end

    it "has right body" do
      expect(@new_post.text).to eq('this is the test')
    end
  end
end
