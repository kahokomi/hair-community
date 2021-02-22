# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "Users", type: :request do
  describe "ユーザーページを表示(GET #show)" do
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
    
    # context 'ログインしていない場合' do
    #   get user_path hairdresser.id
    #   it "リクエストが失敗すること" do
    #     expect(response)
  end
end
