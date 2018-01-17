class PetCategoriesController < ApplicationController
  before_action :set_pet_category, only: [:show, :edit, :update, :destroy]

  # GET /pet_categories
  # GET /pet_categories.json
  def index
    @pet_categories = PetCategory.all
  end

  # GET /pet_categories/1
  # GET /pet_categories/1.json
  def show
  end

  # GET /pet_categories/new
  def new
    @pet_category = PetCategory.new
  end

  # GET /pet_categories/1/edit
  def edit
  end

  # POST /pet_categories
  # POST /pet_categories.json
  def create
    @pet_category = PetCategory.new(pet_category_params)

    respond_to do |format|
      if @pet_category.save
        format.html { redirect_to @pet_category, notice: 'Pet category was successfully created.' }
        format.json { render :show, status: :created, location: @pet_category }
      else
        format.html { render :new }
        format.json { render json: @pet_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_categories/1
  # PATCH/PUT /pet_categories/1.json
  def update
    respond_to do |format|
      if @pet_category.update(pet_category_params)
        format.html { redirect_to @pet_category, notice: 'Pet category was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_category }
      else
        format.html { render :edit }
        format.json { render json: @pet_category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_category
      @pet_category = PetCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_category_params
      params.require(:pet_category).permit(:name, :description)
    end
end
