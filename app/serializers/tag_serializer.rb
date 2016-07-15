class TagSerializer < ActiveModel::Serializer
  attributes :id, :entity_type, :entity_id, :entity_tags
end
