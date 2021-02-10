require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "マイページのテスト" do
     let!(:hairdresser) { create(:hairdresser) }

    before do
      sign_in_as hairdresser
      # json = JSON.parse(response.body)
    end

    it "works! (now write some real specs)" do
      get user_path(hairdresser)
      expect(response).to have_http_status(200)
    end
  end
end
