require 'rails_helper'

RSpec.describe "Drugs", type: :request do
  describe "GET /drugs" do
    it "works! (now write some real specs)" do
      get drugs_path
      expect(response).to have_http_status(200)
    end
  end
end
