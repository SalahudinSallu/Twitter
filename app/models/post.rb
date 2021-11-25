class Post < ApplicationRecord
  enum privacy: [:public_post, :private_post]
  belongs_to :user
end