class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :languages
      t.string :link

      t.timestamps
    end
  end
end
