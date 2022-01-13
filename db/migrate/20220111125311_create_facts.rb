class CreateFacts < ActiveRecord::Migration[6.0]
  def change
    create_table :facts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :fact
      t.string :description

      t.timestamps
    end
  end
end
