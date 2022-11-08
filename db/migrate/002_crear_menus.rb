Sequel.migration do
  up do
    create_table(:menus) do
      primary_key :id
      String :nombre
      Integer :precio
      Date :created_on
      Date :updated_on
    end
  end

  down do
    drop_table(:menus)
  end
end
