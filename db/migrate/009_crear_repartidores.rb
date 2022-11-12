Sequel.migration do
  up do
    create_table(:repartidores) do
      String :nombre_usuario, primary_key: true
      String :nombre
      Date :created_on
      Date :updated_on
    end
  end

  down do
    drop_table(:repartidores)
  end
end
