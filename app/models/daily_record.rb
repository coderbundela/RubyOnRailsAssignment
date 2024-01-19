class DailyRecord < ApplicationRecord
    include ActiveModel::Dirty
    
    after_save :calculate_avg_age, if: :saved_change_to_male_count? || :saved_change_to_female_count?
    
    def gender_count(gender)
        if gender == 'male'
            return self.male_count
        else
            return self.female_count
        end
    end

    private
    def calculate_avg_age
        m_av_age =  male_count == 0 ? 0 : User.where(gender: 'male').average(:age).to_f
        f_av_age =  male_count == 0 ? 0 : User.where(gender: 'female').average(:age).to_f
        update(male_avg_age: m_av_age, female_avg_age: f_av_age)
    end
end
