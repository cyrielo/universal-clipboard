class ClipboardsController < ApplicationController

  def show
    current_user = User.find(clipboard_params[:uid])
    render json: current_user.clipboards.order(updated_at: :desc), status: :ok
  end

  def create
    current_user = User.find(clipboard_params[:uid])
    new_clipboard_params = { content: clipboard_params[:content], device_name: clipboard_params[:device_name] }
    new_clipboard = current_user.clipboards.new(new_clipboard_params)
    new_clipboard.save
    if new_clipboard || new_clipboard.errors[:base] == "Already copied!"
      render json: { message: "copied to clipboard" }, status: 201
    else
      render json: { message: "Unable to complete request", error: new_clipboard.errors }, status: 500
    end
  end

  def clipboard_params
    params.permit(:id, :uid, :content, :device_name, :start, :end)
  end

end
