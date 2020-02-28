class Article < ApplicationRecord
  attachment :image

  has_many :interests, dependent: :destroy
end
