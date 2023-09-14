class CartsController < ApplicationController


  def index 
    @carts = Cart.all
    render json: @carts
  end

  def find 
    @cart = Cart.find(params[:id])
    if !@cart
      render json: {error:"Can't add  products"} 
    end
    render json: @cart
  end

  # Add products to cart
  def addProduct 
    @cart = Cart.find(params[:id])
    @product_ids = params[:product_ids]
    ## append all products
    array = @cart.product_ids
    for product_id in @product_ids do
      array.push(product_id)
    end

    if @cart.save 
      render json: @cart 
    else
      render json: {error:"Can't add  products"} 
    end
  end

  # Remove products to cart
  def removeProduct 
    @cart = Cart.find(params[:id])
    @product_ids = params[:product_ids]
    ## remove all products
    array = @cart.product_ids
    for product_id in @product_ids do
      if index = array.index(product_id)
        array.delete_at(index)
      end
    end

    if @cart.save 
      render json: @cart 
    else
      render json: {error:"Can't add  products"} 
    end
  end

  # Add events to cart
  def addEvent 
    @cart = Cart.find(params[:id])
    @event_ids = params[:event_ids]
    ## append all events
    array = @cart.event_ids
    for event_id in @event_ids do
      array.push(event_id)
    end

    if @cart.save 
      render json: @cart
    else
      render json: {error:"Can't add  events"} 
    end
  end

  # remove events to cart
  def removeEvent 
    @cart = Cart.find(params[:id])

    @event_ids = params[:event_ids]
    ## remove all products
    array = @cart.event_ids
    for event_id in @event_ids do
      if index = array.index(event_id)
        array.delete_at(index)
      end
    end

    if @cart.save 
      render json: @cart 
    else
      render json: {error:"Can't add  products"}
    end
  end

  def create 
    @cart = Cart.new
    # crate a cart with no products and events
    @cart.product_ids = []
    @cart.event_ids = []
    if @cart.save 
      render json: @cart 
    else
      render json: {error:"Can't create events"} 
    end
  end

  private 

  def cart_params 
  end
    
end
