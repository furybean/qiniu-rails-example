class UploadsController < ApplicationController
  
  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.where(:user_id => session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end
  
  def callback
    action = params['action']

    if action == "callback"
      upload = Upload.new
      upload.user = session[:user] if session[:user]
      upload.file_key = params["file_key"]
      upload.file_name = params["file_name"]      
      upload.file_size = params["file_size"]
      upload.file_type = params["file_type"]            

      upload.save
    end

    render :text => params.to_s

  end

  def download
    @upload = Upload.find(params[:id])
    if @upload.file_key
      info = Qiniu::RS.get(QiniuRailsExample::Application::QINIU_BUCKET, @upload.file_key, @upload.file_name)
      if info
        # head :found, :location => info["url"]
        redirect_to info["url"]
        # redirect_to info["url"], :status => 302
      end
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(params[:upload])
    @upload.user = session[:user] if session[:user]

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render json: @upload, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
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

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    if @upload.file_key
      result = Qiniu::RS.delete(QiniuRailsExample::Application::QINIU_BUCKET, @upload.file_key)
      puts "delete result: #{result}"
    end
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
