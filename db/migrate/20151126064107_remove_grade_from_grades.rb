class RemoveGradeFromGrades < ActiveRecord::Migration
  def change
    remove_column :grades, :grade, :integer
  end
end
