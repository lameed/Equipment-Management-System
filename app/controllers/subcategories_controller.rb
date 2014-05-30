class SubcategoriesController < ApplicationController
	def create
		@item = Item.find(params[:item_id])
		@subcategory = @item.subcategories.create(subcategory_params)
		redirect_to item_path(@item)
	end

	def destroy
		@item = Item.find(params[:item_id])
		@subcategory = @item.subcategories.find(params[:id])
		@subcategory.destroy
		redirect_to item_path(@item)
	end

	private
	def subcategory_params
		params.require(:subcategory).permit(:name)
	end
end
