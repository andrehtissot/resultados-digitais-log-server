class PageVisit
  include Mongoid::Document
  validates :contact_message_id, presence: true
  validates :page_name, presence: true
  validates :time, presence: true
  validates :url, presence: true, format: { with: /:\/\// }

  field :contact_message_id, type: BSON::ObjectId
  field :page_name, type: String
  field :time, type: DateTime
  field :url, type: String
end
