# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'


RSpec.describe UserRoom, "モデルに関するテスト", type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userモデルとの関係' do
      let(:target) { :user }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Roomモデルとの関係' do
      let(:target) { :room }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
