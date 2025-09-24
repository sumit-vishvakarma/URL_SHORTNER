class ShortUrl < ApplicationRecord
# Validations
  validates :long_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :short_code, uniqueness: true

  # Callbacks
  before_create :generate_short_code

  private

  # Generate a unique short code
  def generate_short_code
    begin
      self.short_code = SecureRandom.urlsafe_base64(6)
    end while self.class.exists?(short_code: short_code)
  end
end
