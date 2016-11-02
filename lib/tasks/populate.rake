task :populate  => :environment do
  page = 1
  years = ["2015", "2016"]

  years.each do |year|
    puts "------------------------"
    puts "Iniciando ano #{year}"
    puts "------------------------"
    next_url = "http://jarbas.datasciencebr.com/api/document/?format=json&state=CE&subquota_number=13&year=#{year}"
    while next_url.present?
      puts "#{next_url}"
      response = HTTParty.get(next_url)

      response["results"].each do |result|
        deputy = Deputy.find_or_create_by(congressperson_id: result["congressperson_id"],
                                                    congressperson_name: result["congressperson_name"],
                                                    state: result["state"],
                                                    party: result["party"])

        deputy.expenses.create( supplier: result["supplier"],
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
    end
  end
end
