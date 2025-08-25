class RecyclingEntriesController < ApplicationController
  # before_action :set_recycling_entry, only: [:show, :update, :destroy]
  # before_action :recycling_entry_params,  only: [:create]

  def index
    @entries = RecyclingEntry.all
    render json: @entries
  end

  # def show
  #   render json: @recycling_entry
  # end

  def create
    @recycling_entry = RecyclingEntry.new(recycling_entry_params)

    if @recycling_entry.save
      render json: @recycling_entry, status: :created
    else
      render json: @recycling_entry.errors, status: :unprocessable_content
    end
  end

  # def update
  #   if @recycling_entry.update(recycling_entry_params)
  #     render json: @recycling_entry
  #   else
  #     render json: @recycling_entry.errors, status: :unprocessable_content
  #   end
  # end

  # def destroy
  #   @recycling_entry.destroy
  #   head :no_content
  # end

  private

  def set_recycling_entry
    @recycling_entry = RecyclingEntry.find(params[:id])
  end

  def recycling_entry_params
    params.require(:recycling_entry).permit(:user_id, :material, :weight)
  end
end
