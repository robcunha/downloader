class Api::DownloaderController < ApplicationController
  def index
    link = params[:url]
    
    begin
      data = ::TwitterService.get_video(link)
    rescue
      puts "deu ruim"
    end

    if data == false
      render json: {
        message: 'erro ao buscar vídeo'
      }, status: :not_found
    else
      render json: data, status: :ok
    end

  end
end