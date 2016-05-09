class Survey < ActiveRecord::Base
  belongs_to :school
  validates :many_or_all_responses, presence: true
  validates :at_no_time_responses, presence: true
  validates :few_times_responses, presence: true
  validates :some_times_responses, presence: true

  def self.import
    book = Roo::Spreadsheet.open('./surveys.xlsx')

    book.each(name: 'name', many: 'many_or_all', no: 'at_no_times', few: 'few_times', some: 'some_times') do |hash|
      unless hash[:name] == 'name'
        school = School.find_by_name(hash[:name])
        school.create_survey(school_id: school.id, many_or_all_responses: hash[:many], at_no_time_responses: hash[:no], few_times_responses: hash[:few], some_times_responses: hash[:some])
      end
    end
  end
end