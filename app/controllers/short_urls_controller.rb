class ShortUrlsController < ApplicationController
  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.new(short_url_params)
    if @short_url.save
      redirect_to short_url_path(@short_url)
    else
      render :new
    end
  end

  def show
    @short_url = ShortUrl.find(params[:id])
  end

  # Redirect short code to original URL
  def redirect
    short_url = ShortUrl.find_by!(short_code: params[:short_code])
    redirect_to short_url.long_url
  end

  private

  def short_url_params
    params.require(:short_url).permit(:long_url)
  end
end
