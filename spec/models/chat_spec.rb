# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'


RSpec.describe Chat, "モデルに関するテスト", type: :model do
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

  describe 'バリデーションのテスト' do
    subject { chat.valid? }

    let(:user) { create(:user) }
    let(:room) { create(:room) }
    let(:chat) { create(:chat, user_id: user.id, room_id: room.id) }

    context 'contentカラム' do
      it '空欄の場合保存されないか' do
        chat.content = ''
        is_expected.to eq false
      end
    end
  end
end
