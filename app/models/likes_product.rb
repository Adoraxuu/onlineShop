# frozen_string_literal: true

class LikesProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
