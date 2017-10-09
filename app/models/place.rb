class Place < ApplicationRecord
	geocoded_by :address, latitude: :lat, longitude: :lon
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
