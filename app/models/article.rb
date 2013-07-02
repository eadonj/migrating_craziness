class Article < ActiveRecord::Base
  attr_accessible :title, :description
  belongs_to :category
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_one :url
end
