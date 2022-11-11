Sequel.migration do
  up do
    drop_column :usuarios, :id
  end
end
