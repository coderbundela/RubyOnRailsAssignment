class User < ApplicationRecord
    before_destroy :update_daily_record

    private
    def update_daily_record
        daily_record = DailyRecord.find_by_date(created_at.to_date)
      
        if daily_record && daily_record.gender_count(gender) > 0
          gender == 'male' ? daily_record.male_count -= 1 : daily_record.female_count -= 1 
          daily_record.save
        elsif created_at.to_date == Date.today
          count_key = gender == 'male' ? 'male_count' : 'female_count'
          REDIS.set(count_key, REDIS.get(count_key).to_i - 1) if REDIS.get(count_key).to_i > 0
        end
      end
      
end
