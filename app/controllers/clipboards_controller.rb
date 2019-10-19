class ClipboardsController < ApplicationController
  def index
  end

  def show
    history = Clipboard.history
    render json: { history: history }, status: :ok
  end

  def copy
    copy_to_clipboard = Clipboard.copy_to_clipboard(params[:uid, :content])
    if copy_to_clipboard
      render json: { message: "copied to clipboard" }, status: 201
    else
      render json: { message: "Unable to complete request" }, status: 500
    end
  end


  def params
    params.permit(:uid, :content, :start, :end)
  end

end
