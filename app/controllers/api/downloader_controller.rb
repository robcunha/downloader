class Api::DownloaderController < ApplicationController
  def index
    link = params[:url]
    
    data = ::TwitterService.get_video(link)

    if data == false
      render json: {
        message: 'erro ao buscar vídeo'
      }, status: :not_found
    else
      render json: data, status: :ok
    end

  end
end