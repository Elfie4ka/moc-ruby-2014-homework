class Article < ActiveRecord::Base
  validates :title, presence: true,
            length: { minimum: 5 }
  :tag_list
  acts_as_taggable
end