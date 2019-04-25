class FixTemplateToTemplateList < ActiveRecord::Migration[5.0]
  def change
    rename_column :template_lists, :tempalte_name, :template_name
  end
end
