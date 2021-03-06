require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validation for Post model' do
    before(:each) do
      @user = User.new(name: 'Salman', bio: 'Salman is a mechnical engineer', posts_counter: 0)
      @post = Post.new(author: @user, title: 'Patience is the key of success', text: 'Motivated', likes_counter: 1,
                       comments_counter: 4)
    end

    before { @post }

    it 'title should be nil' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'title should be maximum of 250 characters' do
      @post.title = 'Patience is the key of success'
      expect(@post).to be_valid
    end

    it 'likes counter should be in integer' do
      @post.likes_counter = 5
      expect(@post).to be_valid
    end

    it 'likes_counter is less than or eq to to 0' do
      @post.likes_counter = -1
      expect(@post).to be_valid
    end

    it 'comments_counter is greater than or eq to 0.' do
      @post.comments_counter = -1
      expect(@post).to be_valid
    end

    it 'if comments counter is not integer' do
      @post.comments_counter = 'comments'
      expect(@post).to_not be_valid
    end
  end
end
