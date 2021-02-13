# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe CommunicationStyle, "モデルに関するテスト", type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'UserCommunicationStyleモデルとの関係' do
      let(:target) { :user_communication_styles }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end
