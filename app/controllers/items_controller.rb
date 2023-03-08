class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :content, :category_id, :condition_id, :shipping_option_id, :prefecture_id, :shipping_term_id, :image).merge(user_id: current_user.id)
  end
end
