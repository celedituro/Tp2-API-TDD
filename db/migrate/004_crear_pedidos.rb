Sequel.migration do
  up do
    create_table(:pedidos) do
      primary_key :id
      Integer :id_usuario
      Integer :id_menu
      Date :created_on
      Date :updated_on
    end
  end

  down do
    drop_table(:pedidos)
  end
end
