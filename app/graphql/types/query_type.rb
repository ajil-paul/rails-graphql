# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :post, resolver: Resolvers::PostResolver
    field :posts, resolver: Resolvers::PostsResolver
  end
end
