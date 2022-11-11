Sequel.migration do
  up do
    drop_column :pedidos, :id_usuario
  end
end
