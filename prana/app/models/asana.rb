class Asana < ActiveRecord::Base

    validates :asana_name, presence: true, uniqueness: true
    validates :asana_type, presence: true
    validates :target_general, presence: true
    validates :target_specific, presence: true
    validates :difficulty, presence: true
    validates :duration, presence: true

    def self.search(search)
        if search
            where(["asana_name LIKE ?","%#{search}%"])
        else
            all
        end
    end
end
