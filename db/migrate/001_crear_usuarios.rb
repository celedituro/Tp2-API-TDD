Sequel.migration do
  up do
    create_table(:usuarios) do
      String :telefono, primary_key: true
      String :nombre
      String :direccion
      Date :created_on
      Date :updated_on
    end
  end

  down do
    drop_table(:usuarios)
  end
end
