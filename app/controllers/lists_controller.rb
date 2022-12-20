class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  # l'action set_list est à la fois dans show et dans destroy

  def index
    @lists = List.all
    # affiche toute les listes
  end

  def show
    @bookmark = Bookmark.new
    # affihce un bookmark
  end

  def new
    @list = List.new
    # affihce une nouvelle list
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
    # créer une liste, sauvegarde là directement dans les lists
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
    # détruire une liste
  end

  private

  def set_list
    @list = List.find(params[:id])
    # afficher la list en fonction de son id
  end

  def list_params
    params.require(:list).permit(:name, :photo)
    # pour une liste besoin obligatoire de son nom et d'une photo
  end
end
