class CreateWaiverForms < ActiveRecord::Migration
  def change
    create_table :waiver_forms do |t|
      t.string :name
      t.string :email
      t.string :signature

      t.timestamps null: false
    end
  end
end
