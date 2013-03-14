class Post < ActiveRecord::Base
  belongs_to :category
  # Remember to create a migration!

  before_create :generate_url

  def generate_url
    self.post_url = SecureRandom.urlsafe_base64(8)
  end

  
end
