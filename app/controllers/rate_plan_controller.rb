class RatePlanController < ApplicationController

	def index
		@rate_plans = RatePlan.order('created_at').all
	end

	def new
		@rate_plan = RatePlan.new( session[:rate_plan] )
		session[:rate_plan] = nil

		@title = 'Create rate plan'
		@action = 'create'
		@method = :post

		@products_for_select = Product.order(:title).all.collect{ |p| [ p.title, p.id ] }

		render 'rate_plan/rate_plan_form'
	end

	def create
		@rate_plan = RatePlan.new( rate_plan_params )

		if @rate_plan.save
			flash[:success] = [ "RatePlan \"#{@rate_plan.title}\" created successfully." ]
			redirect_to rate_plan_index_path
		else
			flash[:error] = @rate_plan.errors.full_messages
			session[:rate_plan] = rate_plan_params
			redirect_to new_rate_plan_path
		end
	end

	def edit
		@rate_plan = RatePlan.find( params[:id] )

		if @rate_plan.nil?
			flash[:error] = [ 'RatePlan not found' ]
			redirect_to rate_plan_path
		else
			@title = "Edit #{@rate_plan.title}"
			@action = 'update'
			@method = :put
			render 'rate_plan/rate_plan_form'
		end
	end

	def update
		@rate_plan = RatePlan.find( params[:id] )

		if @rate_plan.nil?
			flash[:error] = [ 'RatePlan not found' ]
			redirect_to rate_plan_index_path
		elsif @rate_plan.update_attributes rate_plan_params
			flash[:success] = [ "RatePlan \"#{@rate_plan.title}\" updated successfully." ]
			redirect_to rate_plan_index_path
		else
			flash[:error] = @rate_plan.errors.full_messages
			@title = "Edit #{@rate_plan.title}"
			@action = 'update'
			@method = :put
			render 'rate_plan/rate_plan_form'
		end
	end

	def show
		@rate_plan = RatePlan.find( params[:id] )

		if @rate_plan.nil?
			flash[:error] = [ 'RatePlan not found' ]
			redirect_to rate_plan_index_path
		end
	end


	private

	def rate_plan_params
		params[:rate_plan]
			.permit(
				:title,
				:description,
				:billing_frequency,
				:price,
				:start_date,
				:end_date,
				:product_id)
	end
	
end
