# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  attr_reader :user

  def create
    user?
  end
end
