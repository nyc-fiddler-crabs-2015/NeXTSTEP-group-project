require_relative '../spec_helper'

describe "Authentication controller"  do
  let(:user) {User.create(first_name: "Demo", last_name: "Person", email: "demoperson@email.com", password: "password")}


  describe 'GET /authentication/signup' do
    it 'should load the signup page' do
      get '/authentication/signup'
      expect(last_response).to be_ok
   end
  end

  describe 'GET /authentication/signin' do
    it 'should load the sign in page' do
      get '/authentication/signin'
      expect(last_response).to be_ok
   end
  end


  describe 'POST /authentication/login' do
    it 'should log in a registered user' do
      post '/authentication/login', params={user:{email: "demoperson@email.com", password: "password"}}
      expect(last_response).to be_redirect
      follow_redirect!
      last_request.path.should == "/users/#{user.id}"
   end
  end


   describe 'POST /authentication/register_user' do
    it 'should register a user' do
      get '/authentication/register_user', params={user:{first_name: "Demo", last_name: "Person", email: "demoperson@email.com", password: "password"}}
      expect(last_response).to be_redirect
      follow_redirect!
      last_request.oath.should == "/"
   end
  end


  describe 'GET /authentication/logout' do
    it 'should log the user out of the app' do
      get '/authentication/logout'
      expect(last_response).to be_redirect
      follow_redirect!
      last_request.path.should == '/'
   end
  end





end