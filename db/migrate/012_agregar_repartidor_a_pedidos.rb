Sequel.migration do
  up do
    add_column :pedidos, :nombre_repartidor, String
  end

  down do
    drop_column :pedidos, :nombre_repartidor
  end
end
