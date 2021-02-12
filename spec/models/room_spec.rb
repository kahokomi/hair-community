# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'


RSpec.describe Room, "モデルに関するテスト", type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'UserRoomモデルとの関係' do
      let(:target) { :user_rooms }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Chatモデルとの関係' do
      let(:target) { :chats }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Userモデルとの関係' do
      let(:target) { :user }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Notificationモデルとの関係' do
      let(:target) { :notifications }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end
