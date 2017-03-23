class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = ContactUser.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # POST /contacts
  # POST /contacts.json
  def create
    allowDifferentOrigin
    respond_to do |format|
      begin
        params.require(:email)
        contact_user = ContactUser.where(params.permit(:email)).first
        contact_user = ContactUser.create!(params.permit(:email)) if contact_user.nil?
        last_message = contact_user.contact_messages.last
        if last_message.nil? || params.permit(:name)[:name] != last_message.name ||
          params.permit(:message)[:message] != last_message.message
          contact_message = ContactMessage.new(params.permit([:name, :message]))
          contact_message.contact_user_id = contact_user._id
          contact_message.save!
        else
          contact_message = last_message
        end
        format.json { render json: {status: :success, messageId: contact_message._id.to_s},
          status: :created }
      rescue Exception => e
        format.json { render json: {status: :failure}, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = ContactUser.find(params[:id])
    end
end
