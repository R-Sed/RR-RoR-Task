require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    before(:all) do
      user = create(:user)
      post = create(:post, user: user)
    end

    before(:each) do
      sign_in User.first
      headers = {
        "ACCEPT" => "application/json",
      }
      post :create, { comment: { text: 'first comment', post_id: 1 }}, headers
      @new_post = Post.first
    end

    it 'render nothing' do
      expect(response.body).to be_blank
    end
  end
end
