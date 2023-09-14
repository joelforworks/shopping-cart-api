class ProductsController < ApplicationController
  def index 
    @events = Product.all
    render json: @events
  end

  def find
    @event = Product.find(params[:id])
    render json: @event
  end

  def create
    @event = Product.new(product_params)
    if @event.save 
      render json: @event 
    else
      render json: {error:"Can't create events"} 
    end
  end
  
  private 

  def product_params
    params.require(:product)
      .permit(
        :name,
        :price,
        :thumbnail,
        :description
      )
  end
end
