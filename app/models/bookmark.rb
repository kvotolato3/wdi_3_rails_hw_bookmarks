class Bookmark < ActiveRecord::Base
  CATEGORIES = ['', 'Useful', 'Funny', 'Serious', 'Depressing', 'Wonderous']

  # makes sure the URL starts with http:// OR https://
  validates :url, format: { :with => /\Ahttp[s]?\:\/\/.*/ }

  def self.by_category(category)
    if category == 'uncategorized'
      Bookmark.where('category is NULL OR category = \'\'').order(:title)
    elsif category
      Bookmark.where(category: category.capitalize).order(:title)
    else
      Bookmark.order(:title)
    end
  end
end
