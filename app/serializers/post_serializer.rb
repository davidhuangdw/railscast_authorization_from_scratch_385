class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :inline_images
  has_one :topic
end
