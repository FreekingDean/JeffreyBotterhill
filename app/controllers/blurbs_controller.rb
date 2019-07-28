class BlurbsController < ApplicationController
  # POST /blurbs
  def create
    Learner.learn!(blurb_params[:text])
  end

  private

  def blurb_params
    params.require!(:event).permit(
      :text
    )
  end
end
