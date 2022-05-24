class CreateFctWorkers < ActiveRecord::Migration
  def change
    create_table :fct_workers do |t|
      t.integer :factory_id
      t.integer :worker_id

      t.timestamps null: false
    end
  end
end
