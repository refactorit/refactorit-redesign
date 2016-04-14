class AttachmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @attachments = Attachment.all.order('created_at DESC')
  end

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    if @attachment.save
      redirect_to attachments_path, notice: "Image succesfully created"
    else
      render "new"
    end
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    redirect_to attachments_path
  end

  private

    def attachment_params
      params.require(:attachment).permit(:image)
    end
end
