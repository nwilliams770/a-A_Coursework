require 'rails_helper'
require 'shoulda-matchers'
require 'factory_girl_rails'

describe User do
  subject(:user) do
  user = User.create(email: 'homer@simpsons.com', password: 'password')
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe '#is_password?' do
    it "returns true when password is correct" do
      expect(user.is_password?('password')).to be true
    end

    it "returns false when password is incorrect" do
      expect(user.is_password?('not_password')).to be false
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "returns user with correct credentials" do
      expect(User.find_by_credentials('homer@simpsons.com', 'password')).to eq(user)
    end

    it "returns nil with incorrect credentials" do
    expect(User.find_by_credentials('homer@simpsons.com', 'not_password')).to eq(nil)
    end
  end

  describe "#reset_session_token!" do
    it "resets and returns a new session token" do
    expect(user.reset_session_token!).to eq(user.session_token)
    end
  end
end
