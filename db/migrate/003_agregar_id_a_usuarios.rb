Sequel.migration do
  up do
    add_column :usuarios, :id, Integer
  end

  down do
    drop_column :usuarios, :id
  end
end
