class Album < ApplicationRecord
	acts_as_votable
	#does not allow saving of album name-artist combo twice
	validates :name, uniqueness: { scope: :artist, case_sensitive: false }

end