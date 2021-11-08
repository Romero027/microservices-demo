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

local function index()
  local method = "GET"
  local path = "http://localhost/"

  local headers = {}
  return wrk.format(method, path, headers, nil)

local function set_currency()
  local currencies = {'EUR', 'USD', 'JPY', 'CAD'}
  local method = "POST"
  local body = "currency_code=" .. currencies[math.random(#currencies)]
  local path = "http://localhost/setCurrency/"

  local headers = {}
  return wrk.format(method, path, headers, body)

local function browse_product()
  local method = "GET"
  local body = products[math.random(#products)]
  local path = "http://localhost/product/"

  local headers = {}
  return wrk.format(method, path, headers, body)

local function view_cart()
  local method = "GET"
  local path = "http://localhost/cart"

  local headers = {}
  return wrk.format(method, path, headers, nil)

local function checkout()
  local currencies = {'EUR', 'USD', 'JPY', 'CAD'}
  local method = "POST"
  local body = "currency_code=" .. currencies[math.random(#currencies)]
  local path = "http://localhost/setCurrency/"

  local headers = {}
  return wrk.format(method, path, headers, body)

local function user_login()
  local user_name, password = get_user()
  local method = "GET"
  local path = "http://localhost:5000/user?username=" .. user_name .. "&password=" .. password
  local headers = {}
  -- headers["Content-Type"] = "application/x-www-form-urlencoded"
  return wrk.format(method, path, headers, nil)
end

request = function()
  cur_time = math.floor(socket.gettime())
  local search_ratio      = 0.6
  local recommend_ratio   = 0.39
  local user_ratio        = 0.005
  local reserve_ratio     = 0.005

  local coin = math.random()
  if coin < search_ratio then
    return search_hotel()
  elseif coin < search_ratio + recommend_ratio then
    return recommend()
  elseif coin < search_ratio + recommend_ratio + user_ratio then
    return user_login()
  else 
    return reserve()
  end
end