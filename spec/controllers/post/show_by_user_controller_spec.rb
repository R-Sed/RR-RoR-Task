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
      actual_owners = []
      5.times do |n|
        actual_owners[n] = JSON.parse(response.body)[n]['user']['name']
      end
      expected_owners = Array.new(5, 'User_1')
      expect(actual_owners).to eq(expected_owners)
    end
  end
end
