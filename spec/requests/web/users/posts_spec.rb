require 'rails_helper'

RSpec.describe "Web::Users::Posts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/web/users/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
