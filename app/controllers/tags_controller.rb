class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.all

    render json: @tags
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  # POST /tag, /tags
  def create
    @tag = Tag.new(tag_params)
    if !@tag.entity_tags.nil?
	entity_tags=params[:entity_tags]
	entity_tags=@tag.entity_tags if params[:entity_tags].nil?
	iterator=Array.new(entity_tags)
	iterator.each{|newtag|
    		@tag.entity_tags << newtag
	}
    else
	@tag.entity_tags = params[:entity_tags].first
    end
    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end
 def single
  	@tag = Tag.find_by(entity_id: params[:entity_id],entity_type: params[:entity_type])
     render json: @tag
 end 
 def deletesingle
	loop do
		@tag = Tag.find_by(entity_id: params[:entity_id],entity_type: params[:entity_type])
		break if @tag.nil?
		@tag.destroy
	end
 end
  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:entity_type, :entity_id, :entity_tags)
    end
end
