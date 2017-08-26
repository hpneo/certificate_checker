class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.string :code
      t.string :business_name
      t.string :ruc
      t.string :address
      t.string :machine_type
      t.string :machine_brand
      t.string :machine_model
      t.string :machine_code
      t.string :reference_code
      t.date :issued_at
      t.date :valid_until

      t.timestamps
    end
  end
end
