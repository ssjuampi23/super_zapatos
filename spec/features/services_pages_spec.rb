require 'spec_helper'

describe Services::API do
  def app
    Services::API
  end

  def basic_auth(user, password)
    ActionController::HttpAuthentication::Basic.encode_credentials user, password
  end

  describe Services::API do
    describe "GET /services/stores" do
      it "returns an array full of stores" do
         credentials = basic_auth('my_user','my_password')
         get 'api/v1/services/stores', nil, {'HTTP_AUTHORIZATION' =>  credentials }
      end
    end
  end
end
