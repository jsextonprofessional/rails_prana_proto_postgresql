class Search < ActiveRecord::Base

    def search_asanas
        asanas = Asana.all

        asanas = asanas.where(["asana_name LIKE ?","%#{keywords}%"]) if keywords.present?
        asanas = asanas.where(["asana_name LIKE ?", "%#{asana_name}%"]) if asana_name.present?
        asanas = asanas.where(["asana_type LIKE ?", "%#{asana_type}%"]) if asana_type.present?
        asanas = asanas.where(["target_general LIKE ?", "%#{target_general}%"]) if target_general.present?
        asanas = asanas.where(["target_specific LIKE ?", "%#{target_specific}%"]) if target_specific.present?
        asanas = asanas.where(["difficulty LIKE ?", "%#{difficulty}%"]) if difficulty.present?
        asanas = asanas.where(["duration = ?", "%#{duration}%"]) if duration.present?

        return asanas
    
    end

end
