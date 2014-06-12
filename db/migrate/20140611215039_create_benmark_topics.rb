class CreateBenmarkTopics < ActiveRecord::Migration
  def change
    create_table :benmark_topics do |t|
      t.references :benmark, index: true
      t.references :topic, index: true

      t.timestamps
    end
  end
end
