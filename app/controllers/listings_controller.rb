class ListingsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index

  def index
    if user_signed_in?
      @listings = Listing.where(account_id: @current_account.id)
    else
      @listings = Listing.where(active: true)
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.account_id = @current_account.id
    if @listing.save
      redirect_to listings_path, notice: "Listing created!"
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to listings_path, notice: "Listing updated!"
    else
      render :edit
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :address, :city, :state, :zipcode, :active, :account_id)
  end
end
