require 'rails_helper'
require 'json'

RSpec.describe PostsController, type: :controller do
  describe 'POST #search' do
    before(:all) do
      3.times do
        user = create(:user)
        3.times do
          post = create(:post, user: user)
        end
      end
    end

    before(:each) do
      post :search, key: '3_post'
    end

    it 'return post with right text' do
      expect(JSON.parse(response.body)[0]['text']).to eq('3_post_text')
    end

    it 'return post with right title' do
      expect(JSON.parse(response.body)[0]['title']).to eq('3_post_title')
    end
  end
end
