class AddFailDatetimeToStopSmokingInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :stop_smoking_infos, :fail_datetime, :datetime
    add_column :stop_smoking_infos, :fail_flag, :boolean , default: false , null:false
    
  end
end
