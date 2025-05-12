class BabySerializer < ActiveModel::Serializer
  attributes :id, :name, :birth_date, :gender,
             :weight_at_birth, :height_at_birth,
             :blood_type, :allergies, :notes
end
