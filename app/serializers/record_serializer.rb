class RecordSerializer < ActiveModel::Serializer
  attributes :id, :diagnosis, :symptoms, :created_at, :updated_at
end
