class CreateProjectStatusChanges < ActiveRecord::Migration[7.0]
  def change
    create_table :project_status_changes do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :from_status
      t.integer :to_status

      t.timestamps
    end
  end
end
