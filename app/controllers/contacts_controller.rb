class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]
  skip_before_filter :verify_authenticity_token
  before_action :set_contact, only: [:edit]

  def new
    @new_contact = Contact.new
  end

  def create
    @new_contact = Contact.new contacts_params

    respond_to do |format|
      if @new_contact.save
        format.js
        flash[:notice] = t('controllers.contacts.success')
        AdminNotificationMailer.new_contact_notification(@new_contact).deliver
        format.html { redirect_back(fallback_location: root_path) }
      else
        format.js { render :new }
        format.html do
          flash[:alert] = t('controllers.contacts.fail')
          render :new
        end
      end
    end
  end

  def edit
  end

  private

  def contacts_params
    params.require(:contact).permit(:name,
                                    :email,
                                    :content)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
