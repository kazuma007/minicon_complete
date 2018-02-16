def show
    @user = User.find(params[:id])
    #特定のユーザーが登録したお気に入りを全て取得する
    @favorites = Favorite.where("user_id = ?", @user)
end