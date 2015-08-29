class AddChildToWaiverForms < ActiveRecord::Migration
  def change
    add_column :waiver_forms, :childname, :string
  end
end
