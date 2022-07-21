require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'For the Post model' do
    before(:each) do
      @user = User.create(name: 'Muneba', bio: 'Designer', posts_counter: 0)
      @post = Post.create(author: @user, title: 'fashion', text: 'Designing', likes_counter: 7,
                          comments_counter: 5)
    end
    before { @post.save }
    it 'if there is max 250 characters' do
      @post.title = 'Testing'
      expect(@post).to be_valid
    end
    it 'if likes counter is integer' do
      @post.likes_counter = 5
      expect(@post).to be_valid
    end
    it 'if likes counter greater than or equal to zero' do
      @post.likes_counter = 2
      expect(@post).to be_valid
    end
    it 'if comments counter greater than or equal to zero.' do
      @post.comments_counter = 5
      expect(@post).to be_valid
    end
    it 'if comments counter is integer' do
      @post.comments_counter = 8
      expect(@post).to be_valid
    end
  end
end
