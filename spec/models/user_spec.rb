require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created with normal attributes" do
    user = User.create(username: "bob", password: "don't tell nobody")
    expect(User.find_by(username: "bob")).to eq(user)
  end

  it "has a password digest instead of a password" do
    User.create(username: "alice", password: "english")
    user = User.find_by(username: "alice")
    expect(user.password).to eq(nil)
    expect(user.password_digest).not_to eq("english")
  end

  it "must have a username" do
    user = User.new(password: "secret")
    refute(user.save)
  end

  it "must have a password" do
    user = User.new(username: "alice")
    refute(user.save)
  end
end
