describe "root URL" do
  it "has a level one heading with the text 'Currency pairs'", points: 1 do
    visit "/"

    expect(page).to have_tag("h1", text: /Currency\s+pairs/i)
  end
end

describe "root URL" do
  it "lists each of the Currency Symbols from the API", points: 2 do
    visit "/"
    expect(page).to have_content("AED")
    expect(page).to have_content("AFN")
    expect(page).to have_content("ALL")
    expect(page).to have_content("AMD")
    expect(page).to have_content("ANG")
    expect(page).to have_content("AOA")
    expect(page).to have_content("TMT")
    expect(page).to_not have_content("BOB"),
      "Expected not to find the symbol 'BOB', hardcoded into the HTML but found it anyway."
  end
end

describe "root URL" do
  it "has a link to '/X', where 'X' is a currency symbol, for each currency symbol", points: 1 do
    visit "/"

    expect(page).to have_tag("a", :with => { :href => "/AED" })
    expect(page).to have_tag("a", :with => { :href => "/AFN" })
    expect(page).to have_tag("a", :with => { :href => "/ALL" })
    expect(page).to have_tag("a", :with => { :href => "/AMD" })
    expect(page).to have_tag("a", :with => { :href => "/ANG" })
    expect(page).to have_tag("a", :with => { :href => "/AOA" })
    expect(page).to have_tag("a", :with => { :href => "/TMT" })
  end
end

describe "/[CURRENCY SYMBOL]" do
  it "has a level one heading with the text 'Convert [CURRENCY SYMBOL]'", points: 1 do
    visit "/CUP"

    expect(page).to have_tag("h1", text: /Convert\s+CUP/i)
  end
end

describe "/[CURRENCY SYMBOL]" do
  it "has a level one heading with the text 'Convert [CURRENCY SYMBOL]'", points: 1 do
    visit "/SVC"

    expect(page).to have_tag("h1", text: /Convert\s+SVC/i)

    visit "/WST"

    expect(page).to have_tag("h1", text: /Convert\s+WST/i)
  end
end

describe "/[CURRENCY SYMBOL]" do
  it "has a link with the text 'back' to root URL", points: 1 do
    visit "/TMT"

    expect(page).to have_tag("a", :with => { :href => "/" }, :text => /back/i),
      "Expected to find <a> tag with the text 'back' and an href='/', but didnt' find one."
  end
end

describe "/[CURRENCY SYMBOL]" do
  it "has a link with the text, 'Convert 1 X to Y...', to '/X/Y', for each currency symbol", points: 1 do
    visit "/TMT"

    expect(page).to have_tag("a", :with => { :href => "/TMT/AMD" }, :text => /Convert\s+1\s+TMT\s+to\s+AMD/i),
      "Expected page to have a link with the text, 'Convert 1 TMT to AMD...', with an href='/TMT/AMD', but didnt' find one."

    expect(page).to have_tag("a", :with => { :href => "/TMT/AOA" }, :text => /Convert\s+1\s+TMT\s+to\s+AOA/i),
      "Expected page to have a link with the text, 'Convert 1 TMT to AOA...', with an href='/TMT/AOA', but didnt' find one."
  end
end

describe "/[CURRENCY SYMBOL]/[CURRENCY SYMBOL]" do
  it "has a level one heading with the text 'Convert [CURRENCY SYMBOL] to [CURRENCY SYMBOL]'", points: 1 do
    visit "/ANG/AOA"

    expect(page).to have_tag("h1", text: /Convert\s+ANG\s+to\s+AOA/i)
  end
end

describe "/[CURRENCY SYMBOL]/[CURRENCY SYMBOL]" do
  it "has the text '1 [CURRENCY SYMBOL] equals [CURRENCY SYMBOL]'", points: 1 do
    visit "/CUP/SVC"
    p page.text
    expect(page).to have_text(/1\s+CUP\s+equals\s+0.339787\s+SVC/i),
      "Expected page to have text that follows the pattern, '1 CUP equals 0.339787 SVC', but it didn't."
  end
end

describe "/[CURRENCY SYMBOL]/[CURRENCY SYMBOL]" do
  it "has a link with the text 'back' to '/[CURRENCY SYMBOL]'", points: 1 do
    visit "/CUP/SVC"

    expect(page).to have_tag("a", :with => { :href => "/CUP" }, :text => /back/i)
  end
end

describe "/[CURRENCY SYMBOL]/[CURRENCY SYMBOL]" do
  it "has a link with the text 'back' to '/[CURRENCY SYMBOL]'", points: 1 do
    visit "/ANG/AOA"

    expect(page).to have_tag("a", :with => { :href => "/ANG" }, :text => /back/i)
  end
end
