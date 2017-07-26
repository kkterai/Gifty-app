class Comment < ApplicationRecord
    belongs_to :list_item

    serialize :content
end
