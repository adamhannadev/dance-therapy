class Figure < ApplicationRecord
  has_many :elements, dependent: :destroy
  has_many :steps, dependent: :destroy
end
