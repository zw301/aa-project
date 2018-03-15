require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:session_token)}
  it { should validate_length_of(:password).is_at_least(6)}

  subject(:user1) { User.new(username: 'jack', password: 'abcdef')}
  it { should validate_uniqueness_of(:username), :case_sensitive => false }

  describe 'password encryption' do
    it "does not save password to the database" do
      User.create!(username: 'jack', password: 'abcdef')
      user = User.find_by(username: 'jack')
      expect(user.password).not_to eq('abcdef')
    end
    it "encrypts the password using BCrypt" do
      user_params = { username: 'jack', password: 'abcdef' }
      expect(BCrypt::Password).to receive(:create).with(user_params[:password])
      User.new(user_params)
    end
  end

  describe 'session_token' do
    it "assigns a session token if one is not given" do
      jack = User.create!(username: 'jack', password: 'abcdef')
      expect(jack.session_token).not_to be_nil
    end
  end

  describe 'associations' do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
    it { should have_many(:cheers) }
  end

  describe 'class method' do
    it 'should find a user by username and password' do
      user1 = User.create!(username: 'jack', password: 'abcdef')
      user2 = User.create!(username: 'rose', password: '123456')
      expect(User.find_by_credentials('jack', 'abcdef')).to eq(user1)
      expect(User.find_by_credentials('jack', 'abcdef')).not_to eq(user2)
    end
  end
end
