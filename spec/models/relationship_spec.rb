# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe Relationship, "モデルに関するテスト", type: :model do
  let(:user) { create(:user) }            
  let(:hairdresser) { create(:hairdresser) } 
  let(:active) { user.active_relationships.build(follower_id: hairdresser.id) }
  subject { active }
  it { should be_valid }
  
  describe 'followメソッド' do
    it { should respond_to(:follower) }
    it { should respond_to(:following) }
    it "フォローしているユーザーを返すか" do
      expect(active.following). to eq user
    end
    # followerメソッドは、フォローされているユーザを返すこと
    it "フォローされているユーザーを返すか" do
      expect(active.follower). to eq hairdresser
    end
  end
      
    
  
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userモデル(following)との関係' do
      let(:target) { :following }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Userモデル(follower)との関係' do
      let(:target) { :follower }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
