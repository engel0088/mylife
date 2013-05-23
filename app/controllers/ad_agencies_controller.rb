class AdAgenciesController < ApplicationController
  # GET /ad_agencies
  # GET /ad_agencies.json
  before_filter :authenticate_user!

  layout "adagency", :except => :index
  def index
    @ad_agencies = AdAgency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ad_agencies }
    end
  end

  # GET /ad_agencies/1
  # GET /ad_agencies/1.json
  def show
    @ad_agency = AdAgency.find(params[:id])

    # Tell Mailer to send a test email
    AdAgencyMailer.test_email(@ad_agency).deliver

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ad_agency }
    end
  end

  # GET /ad_agencies/new
  # GET /ad_agencies/new.json
  def new
    @ad_agency = AdAgency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ad_agency }
    end
  end

  # GET /ad_agencies/1/edit
  def edit
    @ad_agency = AdAgency.find(params[:id])
  end

  # POST /ad_agencies
  # POST /ad_agencies.json
  def create
    @ad_agency = AdAgency.new(params[:ad_agency])

    respond_to do |format|
      if @ad_agency.save

        format.html { redirect_to @ad_agency, notice: 'Ad agency was successfully created.' }
        format.json { render json: @ad_agency, status: :created, location: @ad_agency }
      else
        format.html { render action: "new" }
        format.json { render json: @ad_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ad_agencies/1
  # PUT /ad_agencies/1.json
  def update
    @ad_agency = AdAgency.find(params[:id])

    respond_to do |format|
      if @ad_agency.update_attributes(params[:ad_agency])
        format.html { redirect_to @ad_agency, notice: 'Ad agency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_agencies/1
  # DELETE /ad_agencies/1.json
  def destroy
    @ad_agency = AdAgency.find(params[:id])
    @ad_agency.destroy

    respond_to do |format|
      format.html { redirect_to ad_agencies_url }
      format.json { head :no_content }
    end
  end
end
