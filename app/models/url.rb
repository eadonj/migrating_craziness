class Url < ActiveRecord::Base
  attr_accessible :old_url, :article_id
  belongs_to :article
end
