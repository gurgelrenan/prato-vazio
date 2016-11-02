# == Schema Information
#
# Table name: expenses
#
#  id             :integer          not null, primary key
#  deputy_id      :integer
#  supplier       :string
#  cnpj_cpf       :string
#  document_id    :string
#  issue_date     :datetime
#  document_value :decimal(, )
#  remark_value   :decimal(, )
#  net_value      :decimal(, )
#  month          :string
#  year           :string
#  applicant_id   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Expense < ApplicationRecord
  belongs_to :deputy

  def document_url
    "http://www.camara.gov.br/cota-parlamentar//documentos/publ/#{applicant_id}/#{year}/#{document_id}.pdf"
  end
end
