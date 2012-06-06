class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.string :from
      t.string :channel

      t.timestamps
    end
  end
end
