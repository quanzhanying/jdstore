class FavoriteListsController < ApplicationController
  before_action :set_favorite_list, only: [:show, :edit, :update, :destroy]

  # GET /favorite_lists
  # GET /favorite_lists.json
  def index
    @favorite_lists = FavoriteList.all
  end

  # GET /favorite_lists/1
  # GET /favorite_lists/1.json
  def show
  end

  # GET /favorite_lists/new
  def new
    @favorite_list = FavoriteList.new
  end

  # GET /favorite_lists/1/edit
  def edit
  end

  # POST /favorite_lists
  # POST /favorite_lists.json
  def create
    @favorite_list = FavoriteList.new(favorite_list_params)

    respond_to do |format|
      if @favorite_list.save
        format.html { redirect_to @favorite_list, notice: 'Favorite list was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_list }
      else
        format.html { render :new }
        format.json { render json: @favorite_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_lists/1
  # PATCH/PUT /favorite_lists/1.json
  def update
    respond_to do |format|
      if @favorite_list.update(favorite_list_params)
        format.html { redirect_to @favorite_list, notice: 'Favorite list was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_list }
      else
        format.html { render :edit }
        format.json { render json: @favorite_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_lists/1
  # DELETE /favorite_lists/1.json
  def destroy
    @favorite_list.destroy
    respond_to do |format|
      format.html { redirect_to favorite_lists_url, notice: 'Favorite list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_list
      @favorite_list = FavoriteList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_list_params
      params.require(:favorite_list).permit(:product_id, :user_id)
    end
end
