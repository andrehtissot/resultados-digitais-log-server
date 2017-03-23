class ContactUser
  include Mongoid::Document
  validates :email, uniqueness: true, presence: true, format: { with: /@/ }
  has_many :contact_messages, dependent: :destroy, :foreign_key => :contact_user_id,
    :order => :created_at.asc

  field :email, type: String
end
