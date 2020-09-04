class CreateStopSmokingInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :stop_smoking_infos do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
