class UploadsController < ApplicationController
  layout 'adagency'

  def index
    @uploads=Upload.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads.map{|upload| upload.to_jq_upload } }
    end
  end

  def show
    @upload=Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
  end

  def edit
    @upload=Upload.find(params[:id])
  end

  def create
    @upload=Upload.create(params[:upload])
    if @upload.save
       redirect_to uploads_url, notice: "painting was successfully uploaded."
    else
       render :new
    end
  end

  def update
     @upload = Upload.find(params[:id])
     respond_to do |format|
       if @upload.update_attributes(params[:upload])
         format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @upload.errors, status: :unprocessable_entity }
       end
     end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
