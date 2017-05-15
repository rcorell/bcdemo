class ProductController < ApplicationController

  def index
    @products = Product.order('created_at').all
  end

  def new
    @product = Product.new( session[:product] )
    session[:product] = nil

    @title = 'Create product'
    @action = 'create'
    @method = :post

    render 'product/product_form'
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

  def edit
    @product = Product.find( params[:id] )

    if @product.nil?
      flash[:error] = [ 'Product not found' ]
      redirect_to product_path
    else
      @title = "Edit #{@product.title}"
      @action = 'update'
      @method = :put
      render 'product/product_form'
    end
  end

  def update
    @product = Product.find( params[:id] )

    if @product.nil?
      flash[:error] = [ 'Product not found' ]
      redirect_to product_path
    elsif @product.update_attributes product_params
      flash[:success] = [ "Product \"#{@product.title}\" updated successfully." ]
      redirect_to product_index_path
    else
      flash[:error] = @product.errors.full_messages
      @title = "Edit #{@product.title}"
      @action = 'update'
      @method = :put
      render 'product/product_form'
    end
  end

  def show
  	@product = Product.find( params[:id] )

	if @product.nil?
		flash[:error] = [ 'Product not found' ]
		redirect_to product_path
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
