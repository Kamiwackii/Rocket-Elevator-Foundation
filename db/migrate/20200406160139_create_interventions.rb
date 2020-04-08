class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :author
      t.date :date_started, :null => true, :default => nil
      t.date :date_ended, :null => true, :default => nil
      t.string :result, :default => "Incomplete"
      t.string :report
      t.string :status, :default => "Pending"
    end
  end
end
