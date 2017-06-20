class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
layout 'portfolio'

	def index
		@portfolio_items = Portfolio.all
  end
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

	def new
		@portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
	end
	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your post is now live.' }
        format.json { render :show, status: :created, location: @blog }
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
                                      technologies_attributes: [:name])
  end
    def set_portfolio_item
        @portfolio_item = Portfolio.find(params[:id])
      end


end