class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :content
      t.string :title 
    
      

      t.timestamps
    end
  end
end
