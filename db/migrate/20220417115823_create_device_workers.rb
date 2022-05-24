class CreateDeviceWorkers < ActiveRecord::Migration
  def change
    create_table :device_workers do |t|
      t.integer :device_id
      t.integer :worker_id

      t.timestamps null: false
    end
  end
end
