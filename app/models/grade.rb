class Grade < ActiveRecord::Base
  belongs_to :school
  validates :subject, presence: true
  validates :average_mark, presence: true

  def self.import
    book = Roo::Spreadsheet.open('./grades.xlsx')

    book.each(name: 'name', subject: 'subject', average_mark: 'average_mark') do |hash|
      if School.exists?(:name => hash[:name])
        school = School.find_by_name(hash[:name])
        if Grade.exists?(:school_id => school.id, :subject => hash[:subject])
          grade = Grade.where(:subject => hash[:subject], :school_id => school.id).first
          grade.average_mark = hash[:average_mark]
          grade.save
        else
          grade = school.grades.new(subject: hash[:subject], average_mark: hash[:average_mark])
          grade.save
        end
      end
    end
  end
end