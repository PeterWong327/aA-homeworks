class Person < ActiveRecord::Base
  validates :name, :house, presence: true, uniqueness: true

  belongs_to :house
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House' #string or symbol

  # def house
  #   House.find(self.house_id)
  # end
end
