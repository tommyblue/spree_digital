module Spree
  class DigitalsController < Spree::BaseController
    ssl_required :show

    def show
      link = DigitalLink.find_by_secret(params[:secret])

      if link.present? and link.digital.file_url.present?
        attachment = link.digital

        if link.authorize!
          uri = URI.parse(attachment.file_url)
          http = Net::HTTP.new(uri.host, uri.port)
          request = Net::HTTP::Get.new(uri.request_uri)
          request.basic_auth(ALFRESCO_USERNAME, ALFRESCO_PASSWORD)
          response = http.request(request)
          send_data response.body, filename: 'photos.zip', disposition: 'inline'
        else
          render :unauthorized
        end
      else
          render :unauthorized
      end
    end

  end
end
