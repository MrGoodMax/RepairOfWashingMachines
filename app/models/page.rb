class Page < ApplicationRecord
    validate :phone, presence :true, uniqueness: true, length: {minimum:11}
    validate :phone, presence :true, length: {minimum:2}
end
