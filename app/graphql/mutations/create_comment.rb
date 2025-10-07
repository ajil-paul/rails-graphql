module Mutations
  class CreateComment < Mutations::BaseMutation
    # return fields
    field :comment, Types::CommentType, null: true
    field :errors, [ String ], null: false

    # input arguments
    argument :post_id, ID, required: true
    argument :description, String, required: false

    def resolve(post_id:, description: nil)
      comment = ::Comment.new(post_id: post_id, description: description)

      if comment.save
        { comment: comment, errors: [] }
      else
        { comment: nil, errors: comment.errors.full_messages }
      end
    end
  end
end
