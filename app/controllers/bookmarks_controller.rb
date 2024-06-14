class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  def new
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity # Renderizar 'new' en caso de error
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully destroyed.'
  end
  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
  def set_list
    @list = List.find(params[:list_id])
  end
end
