class CreateGoogleParseResults < ActiveRecord::Migration[5.0]
  def change
    create_table :google_parse_results do |t|
      t.integer :blurb_id
      t.jsonb :result

      t.timestamps
    end
  end
end
