class CreateBlurbs < ActiveRecord::Migration[5.0]
  def change
    create_table :blurbs do |t|
      t.text :message
      t.jsonb :metadata, null: false, default: '{}'
      t.string :api_client_id
      t.string :source
      t.string :type

      t.timestamps
    end
  end
end
