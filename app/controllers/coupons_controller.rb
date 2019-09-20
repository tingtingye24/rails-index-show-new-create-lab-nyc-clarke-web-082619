class CouponsController < ApplicationController
    before_action :find_coupon, only: [:show, :edit, :update, :destroy]
    def index
        @coupons = Coupon.all 
    end

    def show 
        render :show
    end

    def new
        @coupon = Coupon.new
        render :new
    end

    def create
        @coupon = Coupon.create(coupon_params)
        redirect_to coupon_path(@coupon)
    end
    
    def edit
        render :edit
    end

    def update
        @coupon.update(coupon_params)
        redirect_to coupon_path(@coupon)
    end

    def destroy
        @coupon.destroy
        redirect_to coupons_path
    end        
    

    private

    def coupon_params
        params.require(:coupon).permit(:coupon_code, :store)
    end

    def find_coupon
        @coupon = Coupon.find(params[:id])
    end
end
