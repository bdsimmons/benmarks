class CreateBenmarks < ActiveRecord::Migration
  def change
    create_table :benmarks do |t|
      t.string :url
      t.references :user, index: true

      t.timestamps
    end
  end
end
