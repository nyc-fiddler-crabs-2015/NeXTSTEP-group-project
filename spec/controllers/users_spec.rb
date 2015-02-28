require_relative '../spec_helper'

describe 'Users Controller' do
  it 'responded to a get request to /users/:id route' do
    get '/users/1'
    expect(last_response).to be_ok
  end
end
