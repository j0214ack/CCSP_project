class AddSlideorderToCourselist < ActiveRecord::Migration
  def change
    add_column :courselists, :slideorder, :string
  end
end
