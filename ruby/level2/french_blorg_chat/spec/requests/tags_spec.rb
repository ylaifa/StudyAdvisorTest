require 'rails_helper'

RSpec.describe "Tags", type: :request do
  describe "GET /show" do
    xit "returns http success" do
      get "/tags/show"
      expect(response).to have_http_status(:success)
    end
  end

end
