require 'barby'
require 'barby/barcode/qr_code'
require 'barby/outputter/png_outputter'

ActiveAdmin.register Certificate do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :code, :business_name, :ruc, :address, :machine_type,
    :machine_brand, :machine_model, :machine_code, :reference_code,
    :issued_at, :valid_until

  index do
    selectable_column
    column "Código QR" do |certificate|
      barcode = Barby::QrCode.new(certificate.attributes.to_json)
      image = barcode.to_image(xdim: 2, margin: 5).to_data_url
      image_tag(image, width: 150)
    end
    column :code
    column :business_name
    # column :ruc
    column :address
    column :machine_type
    column :machine_brand
    column :machine_model
    column :machine_code
    column :reference_code
    column :issued_at
    column :valid_until
    actions
  end

  form partial: 'form'

end
