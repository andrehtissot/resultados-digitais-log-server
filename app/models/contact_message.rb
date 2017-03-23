class ContactMessage
  include Mongoid::Document
  validates :contact_user_id, presence: true
  before_create :force_created_at
  has_many :page_visits, dependent: :destroy, :foreign_key => :contact_message_id,
    :order => :time.asc

  field :contact_user_id, type: BSON::ObjectId
  field :name, type: String
  field :message, type: String
  field :created_at, type: DateTime

  def force_created_at
    self.created_at = DateTime.now
  end
end
