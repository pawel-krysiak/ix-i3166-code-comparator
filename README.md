#### ix-i3166-code-comparator

#### Dependencies:
* gem 'pdf-reader'
[https://github.com/yob/pdf-reader](https://github.com/yob/pdf-reader)

#### Usage:
1. copy current `def self.country_codes` method with hash from `tax_country.rb` to `CurrentCountryCodes` class and replace it with existing one
2. go to [https://www.e-financas.gov.pt/ajuda/DGCI/PAIS%203_2007.pdf](https://www.e-financas.gov.pt/ajuda/DGCI/PAIS%203_2007.pdf) and download pdf **and make sure that it is the current one**
3. paste it to the program catalogue.
4. run `ruby iso3166_checker.rb filename.pdf`

