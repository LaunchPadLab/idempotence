class CreateSideEffectCausingExpensiveTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :side_effect_causing_expensive_tasks do |t|
      t.integer :increasing_integer, default: 0
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
