class Element < ApplicationRecord
  belongs_to :figure
  has_many :steps, dependent: :destroy
end
