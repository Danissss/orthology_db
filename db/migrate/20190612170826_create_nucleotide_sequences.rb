class CreateNucleotideSequences < ActiveRecord::Migration[5.1]
  def change
    create_table :nucleotide_sequences do |t|
      t.string   :header
      t.text     :chain
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      
      t.timestamps
    end
  end
end
