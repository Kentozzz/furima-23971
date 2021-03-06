class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  #authenticate_user!→ログイン済ユーザーのみにアクセスを許可するヘルパーメソッド（deviseを入れることで使える）
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # バリデーションで問題があれば、保存はされず「商品出品画面」を再描画
    if @item.save
      return redirect_to root_path
    else
      # アクションのnewをコールすると、エラーメッセージが入った@itemが上書きされてしまうので注意
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
    return redirect_to root_path if current_user.id != @item.user.id
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params) if current_user.id == @item.user.id
    return redirect_to item_path if @item.valid?
    render 'edit'
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy if current_user.id == @item.user.id
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :info,
      :category_id,
      :sales_status_id,
      :shipping_fee_status_id,
      :prefecture_id,
      :scheduled_delivery_id,
      :price
    ).merge(user_id: current_user.id)
  end

  
end
