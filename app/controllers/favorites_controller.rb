class FavoritesController < ApplicationController
  #お気に入り登録用アクション
  def create
    # binding.pry
    # @user_id = session[:id] #ログインしたユーザのID
    @event_id = Event.find(params[:id]).id #特定の本のID
    #book_idに@book_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
    @favorite = Favorite.new(event_id: @event_id, user_id: current_user.id)
    if @favorite.save
      #保存に成功した場合、本一覧画面に戻る
      flash[:success] = "お気に入り登録完了しました！"
      # redirect_to event_path(@event_id)
    else
      flash[:error] = "お気に入り登録に失敗しました。"
    end
    redirect_to events_path
  end

  #お気に入り削除用アクション
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      redirect_to user_path(session[:id])
    end
  end
end
