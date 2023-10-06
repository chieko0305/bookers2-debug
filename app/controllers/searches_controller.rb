class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == "user"
      @records = User.search_for(@content, @method)
    else
      @records = Book.search_for(@content, @method)
    end
  end

  # def authenticate_user!
    # user = User.find(params[:id])
  # end
  #【質問】beforeアクションを最上部に記述したけどこの表記は必要なのか

end
