class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        format.json { render :show, status: :created, location: @comment}
        format.js {render :index}
      else
        format.html { render :new }
        format.json { render json: @comment.errors,status: :unprocessable_entiny }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
      respond_to do |format|
        @comment.destroy
        format.html { redirect_to blog_path(@blog), notice: 'コメントを削除しました。' }
        format.json { render :show, status: :created, location: @comment}
        format.js {render :index}
      end
  end

  private
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
end
