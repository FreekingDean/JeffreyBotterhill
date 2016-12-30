class BlurbsController < ApplicationController
  # POST /blurbs
  def create
    @blurb = Blurb.new(blurb_params)

    if @blurb.save
      render json: @blurb, status: :created
    else
      render json: @blurb.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def blurb_params
      params.require(:blurb).permit(:message, :source, :type).tap do |whitelist|
        whitelist[:metadata] = params['blurb']['metadata'].permit!
        whitelist[:api_client_id] = api_client.id
      end
    end
end
