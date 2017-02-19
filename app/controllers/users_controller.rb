class UsersController < ApplicationController
  def show #show.html.erbを表示するアクション
    @user = User.find(params[:id]) #Userモデルから、userを探してくる
    @kanji = "漢字"
    @nonphoto = "profile.jpg"
  end
end