module Spree
  class DigitalsController < Spree::BaseController
    ssl_required :show

    def show
      link = DigitalLink.find_by_secret(params[:secret])

      if link.present? and link.digital.file_url.present?
        attachment = link.digital

        if link.authorize!
          redirect_to attachment.file_url and return
        end
      end

      render :unauthorized
    end

  end
end
