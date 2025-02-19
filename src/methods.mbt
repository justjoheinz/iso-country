

fn find_country_by(pred : (Country) -> Bool) -> Country? {
  countries
  .search_by(pred)
  .map(fn(index) { countries[index] })
}
///| find by alpha 2 code
pub fn find_by_alpha_2(alpha_2 : String) -> Country? {
  find_country_by(fn(country) { country.alpha_2 == alpha_2 })
}

test "find_by_alpha_2/basic" {
  let us = find_by_alpha_2("US")
  let fr = find_by_alpha_2("FR")
  let cn = find_by_alpha_2("CN")
  inspect!(us.unwrap().alpha_2, content="US")
  inspect!(fr.unwrap().alpha_2, content="FR")
  inspect!(cn.unwrap().alpha_2, content="CN")
}

test "find_by_alpha_2/case_sensitive" {
  let lowercase_us = find_by_alpha_2("us")
  let lowercase_fr = find_by_alpha_2("fr")
  let gb = find_by_alpha_2("GB")
  inspect!(lowercase_us, content="None")
  inspect!(lowercase_fr, content="None")
  inspect!(gb.unwrap().alpha_2, content="GB")
}

test "find_by_alpha_2/not_found" {
  let empty = find_by_alpha_2("")
  let invalid = find_by_alpha_2("XXX")
  let non_existent = find_by_alpha_2("AA")
  inspect!(empty, content="None")
  inspect!(invalid, content="None")
  inspect!(non_existent, content="None")
}

///| find by alpha 3 code
pub fn find_by_alpha_3(alpha_3 : String) -> Country? {
  find_country_by(fn(country) { country.alpha_3 == alpha_3 })
}

///| find by country code
pub fn find_by_country_code(country_code : String) -> Country? {
  find_country_by(fn(country) { country.country_code == country_code })
}