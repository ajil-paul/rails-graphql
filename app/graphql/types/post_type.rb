# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID
    field :description, String
    field :title, String
    field :rating, Integer
    field :truncated_preview, String, null: false
    field :comments, [ Types::CommentType ],
          description: "This post's comments, or null if this post has comments disabled."
  end
end
