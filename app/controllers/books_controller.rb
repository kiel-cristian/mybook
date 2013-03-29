class BooksController < ApplicationController
  before_filter { load_cart :book }
  def index
  end

  def show
  end

  def new
  end

  def create
    respond_to do |format|
      if @item.valid?
        @item.save
        format.html { redirect_to book_path(@item) }
      else
        flash[:error] = "Create error"
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @item.valid?
        @item.save
        format.html { redirect_to book_path(@item) }
      else
        flash[:error] = "Update error"
        format.html { render :edit }
      end
    end
  end

  def remove
    @item.delete if @item.presence
    return_to_load_page
  end
end
