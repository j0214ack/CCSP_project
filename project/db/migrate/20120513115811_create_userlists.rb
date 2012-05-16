class CreateUserlists < ActiveRecord::Migration
  def change
    create_table :userlists do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
