# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe Notification, "モデルに関するテスト", type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Roomモデルとの関係' do
      let(:target) { :room }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Chatモデルとの関係' do
      let(:target) { :chat }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Tweetモデルとの関係' do
      let(:target) { :tweet }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Userモデル(visitor)との関係' do
      let(:target) { :visitor }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end

      it '結合するモデルのクラスはUserか' do
        expect(association.class_name).to eq 'User'
      end
    end

    context 'Userモデル(visited)との関係' do
      let(:target) { :visited }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end

      it '結合するモデルのクラスはUserか' do
        expect(association.class_name).to eq 'User'
      end
    end
  end
end
