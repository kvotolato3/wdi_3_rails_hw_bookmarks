class Bookmark < ActiveRecord::Base
  CATEGORIES = ['', 'Useful', 'Funny', 'Serious']

  # makes sure the URL starts with http:// OR https://
  validates :url, format: { :with => /\Ahttp[s]?\:\/\/.*/ }
end
