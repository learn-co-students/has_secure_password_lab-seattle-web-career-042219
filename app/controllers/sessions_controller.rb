# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])

    if @user
      session[:user_id] = @user.id
      redirect_to(controller: 'welcome', action: 'home')
    else
      redirect_to(controller: 'sessions', action: 'new')
    end
end

  def destroy
    session.delete :name
    redirect_to '/'
  end
end
