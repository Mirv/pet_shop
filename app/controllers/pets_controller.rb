class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    # @pets = Pet.available_pets
    # @pets = policy_scope(Pet)
    # @pets = Pet.available_pets
    @pets = policy_scope(Pet.available_pets)
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new()
    authorize @pet
  end

  # GET /pets/1/edit
  def edit
    authorize @pet
  end

  # POST /pets
  # POST /pets.json
  def create
    @user = current_user.user_detail # required for assoc relationship
    @pet = @user.pets.build(pet_params)
    authorize @pet
    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    authorize @pet
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  # def destroy
  #   @pet.destroy
  #   respond_to do |format|
  #     format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :description, :pet_category_id, :location_id, :published, :visible, :available, :user_detail_id)
    end
    
end
