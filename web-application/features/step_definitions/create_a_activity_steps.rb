Then('I must find activity in list') do
    visit '/activities'
    table = find('table')
    table_rows = table.all('tr')
    found = false
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
    expect(found).to eq(true)
  end
  