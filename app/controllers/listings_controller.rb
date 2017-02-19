class ListingsController < ApplicationController
  before_action:authenticate_user! # ログインしてないユーザーには、listingを表示させないようにする, only: [:new]とかで、newの場合だけとかできる
  before_action:set_listing, only:[:update,:basics,:description,:address,:price,:photos,:calendar,:bankaccount,:publish]
  
  
  def index
  end

  def show
  end

  def new
    #現在のユーザーのリスティングの作成（保存は別）
    @listing = current_user.listings.build
  end

  def create
    # パラメータと共に、現在のユーザーのリスティングを作成
    @listing = current_user.listings.build(listing_params)
    
    if @listing.save
      redirect_to manage_listing_basics_path(@listing), notice: "リスティングの作成・保存を行いました"
    else
      redirect_to new_listing_path, notice: "リスティングを作成・保存出来ませんでした"
    end
    
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to :back, notice:"更新できました"
    end
  end
  
  
  def basics
  end
  
  def description
  end
  
  def address
  end
  
  def price
  end
  
  def photos
    @photo = Photo.new
  end
  
  def calendar
  end
  
  def bankaccount
  end
    
  def publish
  end

private
  def listing_params
    params.require(:listing).permit(:home_type,:pet_type, :breeding_years, :pet_size,:price_pernight)
    #params が :listing というキーを持ち、params[:listing] は :home_type .... というキーを持つハッシュであること を検証します
  end
  
  def set_listing
    @listing = Listing.find(params[:id])
  end
  
end
