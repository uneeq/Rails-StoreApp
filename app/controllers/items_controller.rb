class ItemsController < ApplicationController

  # Create
  # Read
  # Update
  # Destroy

  def index
    @items = Item.all
  end

  # /items/1 GET
  def show
    unless @item = Item.where(id: params[:id]).first
      render text: "Page not found", status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  #   form send to create
  end

  # /items/1/edit GET
  def edit
  #   form send to update
    @item = Item.find(params[:id])
  end

  # /items POST
  def create
    @item = Item.create(params[:item])
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  # /items/1 PUT (POST)
  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  # /items/1 DELETE (POST)
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: "index"
  end

end