class ValidationsController < ApplicationController
  # GET /validations
  # GET /validations.json
  def index
    @validations = Validation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @validations }
    end
  end

  # GET /validations/1
  # GET /validations/1.json
  def show
    #debugger
    @validation = Validation.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @validation }
    end
  end

  # GET /validations/new
  # GET /validations/new.json
  def new
    @validation = Validation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @validation }
    end
  end

  # GET /validations/1/edit
  def edit
    @validation = Validation.find(params[:id])
  end

  # POST /validations
  # POST /validations.json
  def create
    #@validation = Validation.new(params[:validation])
    #debugger
    @validation = Validation.add_tag(params[:validation])
    respond_to do |format|
      if @validation.save
        format.html { redirect_to @validation, notice: 'Validation was successfully created.' }
        format.json { render json: @validation, status: :created, location: @validation }
      else
        format.html { render action: "new" }
        format.json { render json: @validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /validations/1
  # PUT /validations/1.json
  def update
    @validation = Validation.find(params[:id])

    respond_to do |format|
      if @validation.update_attributes(params[:validation])
        format.html { redirect_to @validation, notice: 'Validation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /validations/1
  # DELETE /validations/1.json
  def destroy
    @validation = Validation.find(params[:id])
    @validation.destroy

    respond_to do |format|
      format.html { redirect_to validations_url }
      format.json { head :no_content }
    end
  end
end
