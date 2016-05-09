class FixGradeVariableName < ActiveRecord::Migration
  def change
	rename_column :grades, :Grade, :grade
	rename_column :grades, :AverageMark, :average_mark
  end
end
