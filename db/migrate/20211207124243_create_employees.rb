class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :second_name
      t.string :email
      t.string :phone
      t.string :vk

      t.timestamps
    end
  end
end
