class CertificatesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def check
    certificate = Certificate.where(code: params[:code]).first

    if certificate
      if certificate.valid_until > Date.today
        render json: { status: 'ok', data: certificate }
      else
        render json: { status: 'error', reason: 'La vigencia del certificado ya expiró' }
      end
    else
      render json: { status: 'error', reason: 'El código ingresado no existe' }
    end
  end
end