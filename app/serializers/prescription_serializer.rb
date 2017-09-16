class PrescriptionSerializer < ActiveModel::Serializer
  attributes :id, :description, :brand_name, :drug_name, :notes, :created_at, :updated_at
end
