class Blog < ApplicationRecord
  validates :title, length: { in: 1..30 }
  validates :content, length: { in: 1..255 }

  belongs_to :user
end
