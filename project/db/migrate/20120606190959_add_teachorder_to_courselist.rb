class AddTeachorderToCourselist < ActiveRecord::Migration
  def change
    add_column :courselists, :teachorder, :string
  end
end
