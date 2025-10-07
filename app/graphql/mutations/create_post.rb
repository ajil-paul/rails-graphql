module Mutations
  class CreatePost < Mutations::BaseMutation
    # return fields
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    # input arguments
    argument :title, String, required: true
    argument :description, String, required: false
    argument :rating, Integer, required: false

    def resolve(title:, description: nil, rating: nil)
      post = ::Post.new(title: title, description: description, rating: rating)

      if post.save
        { post: post, errors: [] }
      else
        { post: nil, errors: post.errors.full_messages }
      end
    end
  end
end
