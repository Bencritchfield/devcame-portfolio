class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all


	def index
		@portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
  end

  render nothing: true
end
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your post is now live.' }
      else
        format.html { render :new }
      end
    end
  end


	def edit
		
      
	end



  def update
  	

    respond_to do |format|
      if @portfolio_item.update(portfolio_pramas)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  def show
   
  end

  
  def destroy
    #perform the lookup


    #destroy/delete the record
    @portfolio_item.destroy

    #redirected
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Post was removed.' }
    end
  end
  
  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body,
                                      technologies_attributes: [:id, :name, :_destroy])
  end
    def set_portfolio_item
        @portfolio_item = Portfolio.find(params[:id])
      end


end