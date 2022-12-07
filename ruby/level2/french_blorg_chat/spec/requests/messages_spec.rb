require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /index" do
    xit "returns http success" do
      get "/messages/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    xit "returns http success" do
      get "/messages/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    xit "returns http success" do
      get "/messages/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    xit "returns http success" do
      get "/messages/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destoy" do
    xit "returns http success" do
      get "/messages/destoy"
      expect(response).to have_http_status(:success)
    end
  end

end
