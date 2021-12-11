require "socket"
math.randomseed(socket.gettime()*1000)
math.random(); math.random(); math.random()

products = {
    '0PUK6V6EV0',
    '1YMWWN1N4O',
    '2ZYFJ3GM2N',
    '66VCHSJNUP',
    '6E92ZMYYFZ',
    '9SIQT8TOJO',
    'L9ECAV7KIM',
    'LS4PSXUNUM',
    'OLJCESPC7Z'}
-- curl -d "product_id=0PUK6V6EV0&quantity=2" -X POST http://10.111.134.111/cart -v
local function index()
  local method = "GET"
  local path = "http://localhost/"

  local headers = {}
  return wrk.format(method, path, headers, nil)
end

request = function()
    return index()
end
