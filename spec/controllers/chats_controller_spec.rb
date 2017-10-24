require 'rails_helper'

describe ChatsController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:chat) { build(:chat) }

  describe 'GET #index' do
    context 'ログインしている場合' do
      before do
        login_user
      end
      it "@groupの値が適切" do
        get :index, group_id: group
        expect(assigns(:group)).to eq group
      end

      it "@chatの値が適切" do
        get :index, group_id: group
        expect(assigns(:chat)).to be_a_new Chat
      end

      it "indexに遷移" do
        get :index, group_id: group
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      it "ログインページに遷移" do
        get :index, group_id: group
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'ログインしているかつ、保存に成功した場合' do
      before do
        login_user
      end
      it "@chatがsaveされる" do
        expect{
          post :create, group_id:group, chat: attributes_for(:chat)
        }.to change(Chat, :count).by(1)
      end

      it "indexに遷移" do
        post :create, group_id:group, chat: attributes_for(:chat)
        expect(response).to render_template :index
      end
    end

    context 'ログインしているが、保存に失敗した場合' do
      before do
        login_user
      end
      it "@chatがsaveされない" do
        expect{
          post :create, group_id:group, chat: attributes_for(:chat, message: nil, image: nil)
        }.not_to change(Chat, :count)
      end

      it "indexに遷移" do
        post :create, group_id:group, chat: attributes_for(:chat)
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      it "ログインページに遷移" do
        post :create, group_id: group
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
