class CreateReportGeneratorTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :report_generator_tasks do |t|
      t.integer :view_count, default: 0
      t.datetime :generation_started_at
      t.datetime :generation_finished_at

      t.timestamps
    end
  end
end
