class ToolController < ApplicationController

	def index
		@tools = Tool.all
	end

	def new
		@tool = Tool.new
		respond_to do |format|
			format.js
		end
	end

	def edit
      @tool = Tool.find(params[:id])
       respond_to do |format|
        format.js
       end
    end

	def create
    @tool = Tool.new(tool_params)

    respond_to do |format|
      if @tool.save
        format.html { redirect_to tool_index_path, notice: 'Tool was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tool }
      else
        format.html { render action: 'new' }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@tool = Tool.find(params[:id])
   		 respond_to do |format|
   		 	format.js
   		 end

  end

  def update
  @tool = Tool.find(params[:id])
 
  if @tool.update(tool_params)
    redirect_to tool_index_path
  else
    render 'edit'
  end
end

  def destroy
      @tool = Tool.find(params[:id])
      @tool.destroy
      
      redirect_to tool_index_path
        
      end
    end

	private

	def tool_params
  	params.require(:tool).permit(:name )
  end
end
