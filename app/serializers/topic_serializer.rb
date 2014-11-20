class TopicSerializer < ActiveModel::Serializer
  attributes :id, :name, :sticky
  has_one :user
end
