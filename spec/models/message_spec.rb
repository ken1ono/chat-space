require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a body, user_id, group_id" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid with image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid with a body, image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a body, user_id, group_id " do
      message = Message.new(body: "", image: "")
      message.valid?
      expect(message.errors[:body_or_image]).to include("Body or imageを入力してください")
    end

    it "is invalid without a group_id" do
      message = Message.new(group_id: "")
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      message = Message.new(user_id: "")
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end
  end
end
