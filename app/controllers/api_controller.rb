class ApiController < ApplicationController


	def product
		if params[:id].nil?
			result = Product
								 .order( :id )
								 .where( discontinued: false )
								 .all
								 .collect { |p| remove_private_attributes p }
		else
			result = Product
								 .where( id: params[:id], discontinued: false )
								 .first

			if result.nil? || result.retired?
				result = { error: { code: 404, description: "Product ID #{params[:id]} not found." } }
			else
				result = remove_private_attributes result
			end
		end

		render json: result
	end


	private

		def remove_private_attributes product
			product.attributes.reject { |key| key == 'discontinued' }
		end

end