Sequel.migration do
  up do
    add_column :repartidores, :esta_libre, TrueClass, default: true
  end

  down do
    drop_column :repartidores, :esta_libre
  end
end
