class Admin::ItemsController < ApplicationController

  def new
  end

  def index
    @items = Item.all
  end

  def create
    item = Item.new(item_params)
    if item.save!
      redirect_to admin_item_path(item)
    else
      @items = Item.all
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      @item = Item.find(params[:id])
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_sold, :genre_id)
  end
end
