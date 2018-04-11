module Api
  class ApiController < ApplicationController
    private
      def require_signed_in!
        unless signed_in?
          render json: ["You must be signed in to do that"], status: :unauthorized
        end
      end
    # end private
  end
end
