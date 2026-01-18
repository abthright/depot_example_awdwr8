class StoreController < ApplicationController

  def index
    @products = Product.order(:title)
    session[:counter] = (session[:counter] || 0 ) + 1

    @sessionCount = session[:counter]
  end
end

