class Client < ApplicationRecord
    validates :phone, presence :true, uniqueness: true, length: {minimum:11}
end
