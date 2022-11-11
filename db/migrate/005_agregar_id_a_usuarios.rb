Sequel.migration do
  up do
    add_column :usuarios, :id, String
  end

  down do
    drop_column :usuarios, :id
  end
end
