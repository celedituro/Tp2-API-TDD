Sequel.migration do
  up do
    add_column :pedidos, :id_usuario, String
  end

  down do
    drop_column :pedidos, :id
  end
end
