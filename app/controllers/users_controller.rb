class UsersController < ApplicationController
  before_action :set_user, only: [ :recycling_summary ]

  def show
    @user = User.includes(:recycling_entries).find(params[:id])
    # render json: @user

    render json: @user, include: :recycling_entries
    # render json: @user.as_json(
    #   include: {
    #     recycling_entries: {
    #       only: [:id, :material, :weight, :created_at]
    #     }
    #   }
    # )
  end

  def recycling_summary
    total_weight = @user.recycling_entries.sum(:weight)
    entry_count = @user.recycling_entries.count

    render json: {
      user_id: @user.id,
      total_weight: total_weight,
      entry_count: entry_count
    }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end

  # def set_user
  #   # @user = User.find(params[:id])
  #   # @user = User.includes(:recycling_entries).find(params[:id])
  #   # @user = User.preload(:recycling_entries)
  #   #         .joins(:recycling_entries)
  #   #         .find(params[:id])
  # end
end
