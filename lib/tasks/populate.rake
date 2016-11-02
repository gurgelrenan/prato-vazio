task :populate  => :environment do
  page = 1
  next_url = "http://jarbas.datasciencebr.com/api/document/?format=json&state=CE&subquota_number=13&year=2016"

  while next_url.present?
    puts "Comecou: #{next_url}"
    response = HTTParty.get(next_url)

    response["results"].each do |result|
      congressman = Congressman.find_or_create_by(congressperson_id: result["congressperson_id"],
                                                  name: result["congressperson_name"],
                                                  state: result["state"],
                                                  party: result["party"])

      congressman.expenses.create(supplier: result["supplier"],
                                  cnpj_cpf: result["cnpj_cpf"],
                                  document_id: result["document_id"],
                                  issue_date: result["issue_date"],
                                  document_value: result["document_value"],
                                  remark_value: result["remark_value"],
                                  net_value: result["net_value"],
                                  month: result["month"],
                                  year: result["year"],
                                  applicant_id: result["applicant_id"])

    end
    next_url = response["next"]
    puts next_url
  end
end
