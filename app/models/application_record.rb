class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  serialize :entity_tags, Array
end
