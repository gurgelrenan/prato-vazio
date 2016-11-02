class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.references :congressman, foreign_key: true
      t.string :supplier
      t.string :cnpj_cpf
      t.string :document_id
      t.datetime :issue_date
      t.numeric :document_value
      t.numeric :remark_value
      t.numeric :net_value
      t.string :month
      t.string :year
      t.string :applicant_id

      t.timestamps
    end
  end
end
