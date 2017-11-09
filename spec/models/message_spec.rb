require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a body, image, user_id, group_id" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a body, user_id, group_id " do
      message = build(:message, body: nil, image: nil)
      message.valid?
      expect(message.errors[:body_or_image]).to include("Body or imageを入力してください")
    end

    it "is invalid without a group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end
  end
end
