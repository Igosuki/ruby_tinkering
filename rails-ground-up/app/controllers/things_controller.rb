class ThingsController < ActionController::Base
	def index
		@things = Thing.all
	end

	def show
		@thing = Thing.find(params[:id])
	end

	def edit
		@thing = Thing.find(params[:id])
	end

	def new
		@thing = Thing.new
	end

	def create
		@thing = Thing.new(params[:thing])
		if @thing.save
			redirect_to @thing, notice: "Thing was successfuly created"
		else
			render action: "edit"
		end
	end

	def update
		@thing = Thing.find(params[:id])
		if @thing.update_attributes(params[:thing])
			redirect_to @thing, notice: "Thing was successfuly updated"
		else 
			render action: "edit"
		end
	end

	def destroy 
		@thing = Thing.find(params[:id])
		@thing.destroy
		redirect_to things_url
	end
end