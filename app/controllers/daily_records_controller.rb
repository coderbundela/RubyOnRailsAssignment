class DailyRecordsController < ApplicationController
    def index
        @daily_records = DailyRecord.all.as_json
        @total_daily_records = DailyRecord.count
        liquid_template = Liquid::Template.parse(File.read(Rails.root.join('app', 'views', 'daily_records', 'index.liquid')))
        @rendered_content = liquid_template.render('daily_records' => @daily_records,'daily_records_count' => @total_daily_records)
    end
end
