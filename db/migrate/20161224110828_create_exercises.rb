class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :link
      t.string :notes
      t.string :reps
      t.string :tempo
      t.string :kit
      t.references :programme, foreign_key: true

      t.timestamps
    end
  end
end
