# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "Chats", type: :request do
  let(:user) { create(:user) }
  let(:hairdresser) { create(:hairdresser) }
  let(:tweet) { create(:tweet, user_id: hairdresser.id) }
  let(:like) { create(:like, user_id: user.id, tweet_id: tweet.id) }
  
  
  
end