# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'


RSpec.describe HairStyle, "モデルに関するテスト", type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'UserHairStyleモデルとの関係' do
      let(:target) { :user_hair_styles }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end