Sequel.migration do
  up do
    add_column :repartidores, :capacidad_mochila, Integer
  end

  down do
    drop_column :repartidores, :capacidad_mochila
  end
end
