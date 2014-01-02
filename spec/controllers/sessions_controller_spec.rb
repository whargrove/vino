require 'spec_helper'

describe SessionsController do
  describe 'GET #new' do
    context 'user not logged in' do
      it 'renders #new (as /login)' do
        get :new
        expect(response).to render_template('new')
      end
    end

    context 'user logged in' do
      it 'redirects to /admin/posts' do
        pending("Will be implemented when #16 is closed")
        get :new
        expect(response).to redirect_to(admin_posts_url)
      end
    end
  end

  describe 'POST #create' do
    context 'user not logged in' do
      before :each do
        @user = create(:user)
      end

      it 'creates a new session' do
        post :create, user_name: @user.user_name, password: @user.password
        session[:user_id].should eq(@user.id)
        session[:user_id].should_not eq(nil)
      end

      it 'redirects to /admin/posts' do
        post :create, user_name: @user.user_name, password: @user.password
        expect(response).to redirect_to(admin_posts_url)
      end
    end

    context 'user logged in' do
      it 'redirects to /admin/posts' do
        @user = create(:user)
        session[:user_id] = @user.id
        post :create, user_name: @user.user_name, password: @user.password
        expect(response).to redirect_to(admin_posts_url)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user not logged in' do
      it 'redirects to #new (as /login)'
    end

    context 'user logged in' do
      before :each do
        @user = create(:user)
        session[:user_id] = @user.id
      end

      it 'deletes the session' do
        delete :destroy, id: session[:user_id]
        session[:user_id].should eq(nil)
        session[:user_id].should_not eq(@user.id)
      end

      it 'redirects to /' do
        delete :destroy, id: session[:user_id]
        expect(response).to redirect_to(root_url)
      end
    end
  end
end