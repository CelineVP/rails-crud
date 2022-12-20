class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
    # affihce une nouveau bookmark
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list # un bookmark est forcément associé à une list
    if @lbookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
    # créer un bookmark, sauvegarde le directement dans les lists
  end

  def destroy
    @bookmark.destroy
    redirect_to lists_path(@bookmark.list), status: :see_other
    # détruire un bookmark
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id) # voir en fonction du modèl
    # pour une liste besoin obligatoire de son nom et d'une photo
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
    # afficher la list en fonction de son id
  end

end
