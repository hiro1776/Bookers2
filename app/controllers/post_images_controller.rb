class PostImagesController < ApplicationController
	def new
		@post_image = PostImage.new
	end
	def create
		@profile_image = ProfileImage.new(profile_image_params)
		@profile_image.user_id = current_user.id
		@profile_image.save
		redirect_to profile_image_path
	end
	def index
		@post_images = PostImage.all
	end
	def show
		@post_image = PostImage.find(params[:id])
	end
	private
	def post_image_params
		params.require(:post_image).permit(:shop_name, :image, :caption)
	end
end
