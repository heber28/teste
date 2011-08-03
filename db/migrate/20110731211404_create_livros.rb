class CreateLivros < ActiveRecord::Migration
  def self.up
    create_table :livros do |t|
      t.string :titulo
      t.string :autor
      t.string :isbn
      t.string :descricao
      t.timestamps
    end
  end

  def self.down
    drop_table :livros
  end
end
