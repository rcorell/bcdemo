class ProductController < ApplicationController

  def index
    @products = Product.order('created_at').all
  end

  def new
    @product = Product.new( session[:product] )
    session[:product] = nil
  end

  def create
    @product = Product.new( product_params )

    if @product.save
      flash[:success] = [ "Product \"#{@product.title}\" created successfully." ]
      redirect_to product_index_path
    else
      flash[:error] = @product.errors.full_messages
      session[:product] = product_params
      redirect_to new_product_path
    end

  end

  private

    def product_params
      params[:product]
        .permit(
            :title,
            :description,
            :start_date,
            :end_date,
            :discontinued)
    end

end
