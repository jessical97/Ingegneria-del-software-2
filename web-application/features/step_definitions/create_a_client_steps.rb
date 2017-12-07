Then('I must find client in list') do
  visit '/clients'
  table = find('table')
  table_rows = table.all('tr')
  found = false
  unless @insert.nil?
    table_rows.each do |row|
      contain_all = true
      @insert.each_value do |value|
        inside = row.has_text?(value)
        if inside == false
          contain_all = false
          break
        end
      end
      found = true if contain_all == true
    end
  end
  found = table_rows.count > 1 if @insert.nil?
  expect(found).to eq(true)
end
