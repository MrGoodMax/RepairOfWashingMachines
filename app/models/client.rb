class Client < ApplicationRecord
    validate :phone, presence :true, uniqueness: true, length: {minimum:11}
end
