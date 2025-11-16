# uni_rate_api.cr
Web-API for [unirateapi.com](https://unirateapi.com/) free Foreign Exchange &amp; Crypto Rates API

## Example
```cr
require "./uni_rate_api"

uni_rate = UniRateApi.new(api_key="")
currencies = uni_rate.get_currencies()
puts currencies
```
