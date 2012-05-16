class CreateCoursecontents < ActiveRecord::Migration
  def change
    create_table :coursecontents do |t|
      t.integer :courseid
      t.integer :slideorder
      t.string :slidesource
      t.string :recordsource
      t.string :canvassource

      t.timestamps
    end
  end
end
