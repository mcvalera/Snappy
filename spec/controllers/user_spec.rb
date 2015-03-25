require 'spec_helper'

describe 'POST /accounts/register' do

  context 'when the request has valid parameters' do

    before do
      User.delete_all
    end

    it 'creates a new user' do
      expect {
        post '/accounts/register', {username: 'hello', email: 'hello@gmail.com', password_hash: 'helloagain'}
      }.to change{
        User.count
      }
    end

    it 'redirects the valid user to the /accounts/hello route' do
      post '/accounts/register', {username: 'hello', email: 'hello@gmail.com', password_hash: 'helloagain'}
      expect(last_response.location).to eq('http://example.com/accounts/hello')
    end

  end

  context 'when the request does not include a required value' do

    it 'does not create a new user' do
      expect {
        post '/accounts/register', {username: 'hello'}
      }.to_not change{
        User.count
      }
    end

  end

  context 'when the request does not include a unique name value' do

    it 'does not create a new user' do
      post '/accounts/register', {username: 'hello', email: 'hello1@gmail.com', password: 'helloagain'}
      expect {
        post '/accounts/register', {username: 'hello', email: 'hello2@gmail.com', password: 'helloagain'}
      }.to_not change {
        User.count
      }
    end

  end

end