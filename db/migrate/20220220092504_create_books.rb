class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    # このマイグレーションファイルに必要なカラムを記述し、ターミナルでrails db:migrateを実行する事で、schema.rbに
    create_table :books do |t|
      # 以下の2行を追加
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
