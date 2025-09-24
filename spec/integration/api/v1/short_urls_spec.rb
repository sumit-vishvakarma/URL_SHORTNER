# spec/integration/api/v1/short_urls_spec.rb
require 'swagger_helper'

RSpec.describe "API V1 ShortUrls", type: :request do
  path "/api/v1/short_urls" do
    post "Create a short URL" do
      tags "ShortUrls"
      consumes "application/json"
      parameter name: :short_url, in: :body, schema: {
        type: :object,
        properties: {
          long_url: { type: :string }
        },
        required: ["long_url"]
      }
      response "201", "short URL created" do
        let(:short_url) { { long_url: "https://example.com" } }
        run_test!
      end
    end
  end
end
