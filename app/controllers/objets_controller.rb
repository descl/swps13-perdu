class ObjetsController < ApplicationController
  # GET /objets
  # GET /objets.json
  def index
    @objets = Objet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @objets }
    end
  end

  # GET /objets/1
  # GET /objets/1.json
  def show
    @objet = Objet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objet }
    end
  end

  # GET /objets/new
  # GET /objets/new.json
  def new
    @objet = Objet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @objet }
    end
  end

  # GET /objets/1/edit
  def edit
    @objet = Objet.find(params[:id])
  end

  # POST /objets
  # POST /objets.json
  def create
    @objet = Objet.new(params[:objet])

    respond_to do |format|
      if @objet.save
        format.html { redirect_to @objet, notice: 'Objet was successfully created.' }
        format.json { render json: @objet, status: :created, location: @objet }
      else
        format.html { render action: "new" }
        format.json { render json: @objet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /objets/1
  # PUT /objets/1.json
  def update
    @objet = Objet.find(params[:id])

    respond_to do |format|
      if @objet.update_attributes(params[:objet])
        format.html { redirect_to @objet, notice: 'Objet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @objet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objets/1
  # DELETE /objets/1.json
  def destroy
    @objet = Objet.find(params[:id])
    @objet.destroy

    respond_to do |format|
      format.html { redirect_to objets_url }
      format.json { head :no_content }
    end
  end
end
