# spec/requests/short_urls_spec.rb
require "rails_helper"

RSpec.describe "ShortUrls", type: :request do
  it "redirects to long URL" do
    short_url = ShortUrl.create!(long_url: "https://example.com")
    get "/#{short_url.short_code}"
    expect(response).to redirect_to("https://example.com")
  end
end
