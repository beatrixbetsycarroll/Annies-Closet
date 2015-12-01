class ItemController < ApplicationController
  def index
  	@items = Item.all
  end

  def new
  end

  def show
  end

  def update
  end

  def delete
  end
end
