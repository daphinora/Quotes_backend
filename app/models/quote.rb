class Quote < ApplicationRecord
    has_many :quote_collections
    has_many :users, through: :quote_collections
end
