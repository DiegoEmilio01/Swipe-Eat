class RemoveReferenceOwnerComentario < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comentarios, :owner
    add_reference :comentarios, :restaurante, foreign_key: true
    add_reference :comentarios, :swiper, foreign_key: true
  end
end
