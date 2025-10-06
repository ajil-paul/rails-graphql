# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :description, String
    field :post, Types::PostType
  end
end
