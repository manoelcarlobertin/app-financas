require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    user = User.new email: 'test@example.com'

    expect(user.attributes.keys).to include("email")
  end

  it do
    user = User.new email: 'test@example.com'

    expect(user.email).to eq("test@example.com")
  end
end
