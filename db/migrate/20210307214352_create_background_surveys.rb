class CreateBackgroundSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :background_surveys do |t|

      t.timestamps
    end
  end
end
