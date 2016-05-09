class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :subject
      t.integer :Grade
      t.integer :AverageMark
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
