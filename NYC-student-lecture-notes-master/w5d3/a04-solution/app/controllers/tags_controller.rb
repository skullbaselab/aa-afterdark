class TagsController < ApplicationController
  before_action :require_signed_in!

  def create
    tag = Tag.create(tag_params)
    flash[:errors] = tag.errors.full_messages

    redirect_to post_url(tag.post)
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy

    redirect_to post_url(tag.post)
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :post_id)
  end
end
