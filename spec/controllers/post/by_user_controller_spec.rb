require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #by_user" do
    before do
      user = create(:user)
      3.times do
        post = create(:post, user: user)
      end
      get :by_user, user_name: 'User_1'
    end

    it "render by_user" do
      expect(response).to render_template('by_user')
    end
  end
end
