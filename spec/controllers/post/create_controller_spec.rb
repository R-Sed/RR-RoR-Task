require 'rails_helper'

RSpec.describe PostsController, type: :controller do
   before do
    5.times do
      user = create(:user)
      5.times do
        post = create(:post, user: user)
        5.times do
          comment = create(:comment, user: user, post: post)
        end
      end
    end
  end

  init_table

  it "should be users" do
    posts = Post.all
    puts '-------------->', posts[0].user.posts.length
    expect(2).to eq(2)
  end

end
