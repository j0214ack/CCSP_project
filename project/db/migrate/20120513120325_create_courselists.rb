class CreateCourselists < ActiveRecord::Migration
  def change
    create_table :courselists do |t|
      t.string :coursename
      t.string :author
      t.string :image
      t.string :description
      t.float :ranking
      t.string :ispublic

      t.timestamps
    end
  end
end
