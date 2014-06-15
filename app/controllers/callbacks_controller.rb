class CallbacksController < ApplicationController

  # GET /callback
  def callback_verification
    render text: params["hub.challenge"]
  end

  # POST /callback
  def callback
    # save image url and print
  end
end
