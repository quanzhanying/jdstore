class CreateConcernsTokenables < ActiveRecord::Migration[5.0]
  def change
    create_table :concerns_tokenables do |t|

      t.timestamps
    end
  end
end
