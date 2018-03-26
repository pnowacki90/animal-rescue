require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with valid attributes" do
    user = User.new(email: "pnowacki@wp.pl", password: "klopsiki", admin: true)

    expect(user).to be_valid
  end

  it "is not valid without an email" do
    user = User.new(email: nil)

    expect(user).to_not be_valid
  end

  it "is not valid if an email is duplicated" do
    user1 = User.new(email: "pnowacki@wp.pl")
    user2 = User.new(email: "pnowacki@wp.pl")

    expect(user2).to_not be_valid
  end

  it "is not valid without a password" do
    user = User.new(password: nil)

    expect(user).to_not be_valid
  end

  it "is not valid if the password is too short" do
    user = User.new(password: "abcd")

    expect(user).to_not be_valid
  end

end
