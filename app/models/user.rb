class User < ApplicationRecord
    has_many :quote_collections
    has_many :quotes, through: :quote_collections
end
