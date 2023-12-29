class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id])
    else
      @items = Item.search(params[:search])
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

end
