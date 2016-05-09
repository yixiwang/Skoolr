class School < ActiveRecord::Base
  require 'open-uri'

  has_many :favorite_schools
  has_many :favorited_by, through: :favorite_schools, source: :user
  has_many :ratings, dependent: :destroy
  has_many :grades, dependent: :destroy
  has_one :survey, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  
  geocoded_by :address
  after_validation :geocode

  def self.import(file)
    xls = Roo::Spreadsheet.open(file, extension: :xls)
    xls.each(name: 'SCHOOL_NAME', address: 'ADDRESS') do |hash|
      if valid?(hash)
        school = School.create(name: hash[:name].split(' ')[0...-1].join(' '), address: hash[:address] + " Vancouver")
		school.create_survey(school_id: school.id, many_or_all_responses: 0, at_no_time_responses: 0, few_times_responses: 0, some_times_responses: 0)
      end
    end
  end

  def self.fetch
    f = open("ftp://webftp.vancouver.ca/OpenData/xls/schools.xls")
    import(f)
  end
  
  def self.search(query)
	where('name LIKE ?', "%" + query + "%").all
  end
  
  def self.searchNearby(query)
	where('self.distance_to(query) < 5').all
  end

  private
  def self.valid?(hash)
    return !School.exists?(name: hash[:name].split(' ')[0...-1].join(' ')) && hash[:name] != "SCHOOL_NAME" && hash[:name].split.last.delete('.') == "Sec"
  end
end