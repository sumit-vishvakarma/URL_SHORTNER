# app/controllers/api/v1/short_urls_controller.rb
module Api::V1
  class ShortUrlsController < ApplicationController
    include TokenAuthenticatable

    def create
      short_url = ShortUrl.new(long_url: params[:long_url])
      if short_url.save
        render json: { short_code: short_url.short_code, url: short_url_path(short_url.short_code) }, status: :created
      else
        render json: { errors: short_url.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
