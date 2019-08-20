class AuctionController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_auction, only: [:show, :edit, :update, :destroy]
    before_action :authorize!, only: [:edit, :update, :destroy]
  
    def new
      @auction = Auction.new
    end
  
    def create
      # # The 'params' object available in controllers
      # # is composed of the query string, url params,
      # # and the body of a form
      # # (e.g. req.query + req.params + req.body)
      #
      # # A good trick to see if your routes are working
      # # and you're getting the data that you want, is to
      # # render the params as JSON. This is like doing
      # # res.send(req.body) in Express
  
      # Use 'require' on the params object to retrieve
      # the nested hash of a key usually corresponding to
      # the name-value pairs of a form
  
      # Then use permit to specify all input names that
      # are allowable (as symbols).
      @auction = Auction.new auction_params
      @auction.user = current_user
      if @auction.save
        flash[:notice] = "Auction created successfully"
        
        redirect_to auction_path(@auction)
      else
       
        render :new
      end
    end
  
    def show
    
      @bid = Bid.new
      @bids = @auction.bids.order(created_at: :desc)
    end
  
    def index
    
        @auctions = Auction.order(created_at: :desc)
        respond_to do |format|
          format.html { render  }
          format.json { render json: @auctions }
        end
       
    end
  
    def edit
    end
  
    def update
      
      if @auction.update auction_params
        redirect_to auction_path(@auction)
      else
        render :edit
      end
    end
  
    def destroy
      flash[:notice] = "Auction destoryed!"
      @auction.destroy
      redirect_to auctions_path
    end
  
    private
  
    def auction_params
      params.require(:auction).permit(:title, :description, :current_price, :auction_end, :rsv_price)
    end
  
    def find_auction
      # get the current value inside of the db
      @auction = Auction.find params[:id]
    end
  
    def authorize!
      redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @auction)
    end
end
