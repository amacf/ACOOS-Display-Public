class BackgroundImagesController < ApplicationController
  before_action :set_background_image, only: [:show, :edit, :update, :destroy]


  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username,password|
      username == 'REDACTED' && password == 'REDACTED'
    end
  end

  # GET /background_images
  # GET /background_images.json
  def index
    authenticate
    @background_images = BackgroundImage.all
  end

  # GET /background_images/1
  # GET /background_images/1.json
  def show
    authenticate
  end

  # GET /background_images/new
  def new
    authenticate
    @background_image = BackgroundImage.new
  end

  # GET /background_images/1/edit
  def edit
    authenticate
  end

  # POST /background_images
  # POST /background_images.json
  def create
    authenticate
    @background_image = BackgroundImage.new(background_image_params)

    respond_to do |format|
      if @background_image.save
        format.html { redirect_to admin_background_path , notice: 'Background image was successfully created.' }
        format.json { render :show, status: :created, location: @background_image }
      else
        format.html { render :new }
        format.json { render json: @background_image.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /background_images/1
  # PATCH/PUT /background_images/1.json
  #def update
   # authenticate
   # respond_to do |format|
  #    if @background_image.update(background_image_params)
  #      format.html { redirect_to @background_image, notice: 'Background image was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @background_image }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @background_image.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end


  # DELETE /background_images/1
  # DELETE /background_images/1.json
  def destroy
    authenticate
    @background_image.destroy
    respond_to do |format|
      format.html { redirect_to admin_background_url, notice: 'Background image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_background_image
      @background_image = BackgroundImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def background_image_params
      params.require(:background_image).permit(:image)
    end
end
