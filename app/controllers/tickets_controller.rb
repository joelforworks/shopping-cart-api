class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all()
    render json: @tickets
  end
  def find 
    @ticket = Ticket.where(:id => params[:id])
    if @ticket[0]
      render json: @ticket[0]
    else
      render json: 'Ticket not found.'
    end

  end

  def create 
    # find cart 
    @cart = Cart::find(ticket_params[:cart_id])
    # get Product and events
    @products= @cart.product_ids.map { |id| Product::find(id) }
    @events = @cart.event_ids.map { |id| Event::find(id) }
    @items = @products + @events
    # get total
    @total = 0
    for item in @items do
      @total += item.price
    end
    # Create ticket
    @ticket = Ticket.new
    @ticket.items = @items
    @ticket.total = @total
    @ticket.cart_id = @cart.id
    
    if @ticket.save 
      render json: @ticket
    else 
      render json: "Can't create Ticket."
    end

    
    
  end

  private 
  def ticket_params
    params.require(:ticket)
      .permit(
        :cart_id
      )
  end
end
