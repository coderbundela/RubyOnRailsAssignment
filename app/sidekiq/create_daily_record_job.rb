class CreateDailyRecordJob
  include Sidekiq::Job

  def perform
    male_count = REDIS.get('male_count').to_i
    female_count = REDIS.get('female_count').to_i
    daily_record = DailyRecord.new(date: Date.today,male_count: male_count,female_count:female_count)
    daily_record.save
    reset_redis_count()
  end

  private
  def reset_redis_count
    REDIS.flushdb
  end
end
