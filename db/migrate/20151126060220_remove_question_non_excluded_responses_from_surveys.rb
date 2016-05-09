class RemoveQuestionNonExcludedResponsesFromSurveys < ActiveRecord::Migration
  def change
    remove_column :surveys, :question, :string
    remove_column :surveys, :non_excluded_responses, :integer
  end
end
