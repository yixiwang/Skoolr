class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :school_year
      t.string :question
      t.string :grade_group
      t.integer :non_excluded_responses
      t.integer :many_or_all_responses
      t.integer :many_or_all_pct
      t.integer :at_no_time_responses
      t.integer :at_no_time_pct
      t.integer :few_times_responses
      t.integer :few_times_pct
      t.integer :some_times_responses
      t.integer :some_times_pct
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
