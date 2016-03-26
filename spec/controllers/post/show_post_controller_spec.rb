require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #show_post' do
    before(:all) do
      2.times do
        user = create(:user)
        3.times do
          post = create(:post, user: user)
        end
      end
    end

    before(:each) do
      get :show_post, user_name: 'User_1', post_id: 1
    end

    it 'render show_post' do
      expect(response).to render_template('show_post')
    end
  end
end
