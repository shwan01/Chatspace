require 'rails_helper'

describe Chat do
  describe '#create' do
    context '保存できる場合' do
      it "メッセージがあれば保存できる" do
        chat = build(:chat, image: nil)
        expect(chat).to be_valid
      end

      it "画像があれば保存できる" do
        chat = build(:chat, message: nil)
        expect(chat).to be_valid
      end

      it "メッセージと画像がどちらもあれば保存できる" do
        chat = build(:chat)
        expect(chat).to be_valid
      end
    end

    context '保存できない場合' do
      it "メッセージも画像もないと保存できない" do
        chat = build(:chat, message:nil, image: nil)
        chat.valid?
        expect(chat.errors[:message_or_image]).to include("を入力してください")
      end

      it "group_idがないと保存できない" do
        chat = build(:chat, group_id: nil)
        chat.valid?
        expect(chat.errors[:group]).to include("を入力してください")
      end

      it "user_idがないと保存できない" do
        chat = build(:chat, user_id: nil)
        chat.valid?
        expect(chat.errors[:user]).to include("を入力してください")
      end
    end

  end
end
