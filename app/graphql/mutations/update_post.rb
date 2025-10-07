module Mutations
  class UpdatePost < Mutations::BaseMutation
    # return fields
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    # input arguments
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :rating, Integer, required: false

    def resolve(id:, title: nil, description: nil, rating: nil)
      post = ::Post.find_by(id: id)

      return { post: nil, errors: ["Post not found"] } unless post

      attrs = {}
      attrs[:title] = title unless title.nil?
      attrs[:description] = description unless description.nil?
      attrs[:rating] = rating unless rating.nil?

      if attrs.empty?
        return { post: post, errors: [] }
      end

      if post.update(attrs)
        { post: post, errors: [] }
      else
        { post: nil, errors: post.errors.full_messages }
      end
    end
  end
end
