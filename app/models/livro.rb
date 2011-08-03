class Livro < ActiveRecord::Base
  attr_accessible :titulo, :autor, :isbn, :descricao
end
