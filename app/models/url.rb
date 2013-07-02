class Url < ActiveRecord::Base
  attr_accessible :old_url
  belongs_to :article
end
