require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    context 'when the page is opened' do
      it 'return a correct response' do
        get '/users/1/posts'
        expect(response).to have_http_status(200)
        expect(response.body).to render_template(:index)
        expect(response.body).to include('Lists all posts for a user')
      end
    end
  end

  describe 'GET /show' do
    context 'when the page is opened' do
      it 'returns the correct response' do
        get '/users/1/posts/1'
        expect(response).to have_http_status(200)
        expect(response.body).to render_template(:show)
        expect(response.body).to include('display information for a specific post')
      end
    end
  end
end
