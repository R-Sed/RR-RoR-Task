require 'rails_helper'
require 'json'

RSpec.describe PostsController, type: :controller do
  describe "POST #show_by_user" do
    before(:all) do
      2.times do
        user = create(:user)
        6.times do
          post = create(:post, user: user)
        end
      end
    end

    before(:each) do
      post :show_by_user, user_name: 'User_1'
    end

    it 'return 5 posts' do
      expect(JSON.parse(response.body).length).to eq(5)
    end

    it 'posts belong to User_1' do
      post_owners_are = []
      5.times do |n|
        post_owners_are[n] = JSON.parse(response.body)[n]['user']['name']
      end
      post_owners__should_be = Array.new(5, 'User_1')
      expect(post_owners_are).to eq(post_owners__should_be)
    end
  end
end
