class RemoveFieldsFromSurveys < ActiveRecord::Migration
  def change
    remove_column :surveys, :school_year, :string
    remove_column :surveys, :grade_group, :string
    remove_column :surveys, :many_or_all_pct, :integer
    remove_column :surveys, :at_no_time_pct, :integer
    remove_column :surveys, :few_times_pct, :integer
    remove_column :surveys, :some_times_pct, :integer
  end
end
