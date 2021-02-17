# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "Users", type: :request do
  describe "マイページのテスト" do
    let!(:hairdresser) { create(:hairdresser) }

    context "ログインしている場合" do
      before do
        sign_in hairdresser
        get user_path hairdresser.id
      end

      it "リクエストが成功すること" do
        expect(response).to have_http_status "200"
      end
    end
    # it "works! (now write some real specs)" do
    #   post user_sessions_path, params: hairdresser
    #   # get user_path(hairdresser)
    #   expect(response).to have_http_status(200)
    # end
  end
end
