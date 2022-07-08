require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations for User model' do
    before(:each) do
      @user = User.new(name: 'Salman', photo: 'https://unsplash.com/photos/BXCZi9smw78',
                       bio: 'Salman is a mechnical engineer')
    end

    before { @user }

    it 'name  should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'name should be string' do
      @user.name = 'Salman'
      expect(@user).to_not be_valid
    end

    it 'photo url is not a string' do
      @user.photo = 2
      expect(@user).to_not be_valid
    end

    it 'posts_counter should not be greater than or eq to zero' do
      @user.posts_counter = -3
      expect(@user).to_not be_valid
    end

    it 'posts_counter should be greater than or eq to zero' do
      @user.posts_counter = 4
      expect(@user).to be_valid
    end
  end
end
