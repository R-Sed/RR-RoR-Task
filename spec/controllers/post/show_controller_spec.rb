require 'rails_helper'
require 'json'

RSpec.describe PostsController, type: :controller do
  describe "GET #show" do
    before do
      user = create(:user)
      6.times do
        post = create(:post, user: user)
      end
      post :show
    end

    it "return 5 posts" do
      expect(JSON.parse(response.body).length).to eq(5)
    end
  end
end
