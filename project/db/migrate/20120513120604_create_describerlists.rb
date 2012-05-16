class CreateDescriberlists < ActiveRecord::Migration
  def change
    create_table :describerlists do |t|
      t.integer :courseid
      t.integer :userid

      t.timestamps
    end
  end
end
