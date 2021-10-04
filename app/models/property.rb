class Property < ApplicationRecord
    validates :title,:description,:rooms,:bathroom,:daily_rate, presence: {message:'não pode ficar em branco'}

  
end
