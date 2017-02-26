require 'rubygems'
require 'json'
require "pp"

json = File.read("./seedjson/goods_attr.json")
obj = JSON.parse(json)

count = obj["RECORDS"].count
puts "goods_attr.json 节点数量：#{count}"

for i in 0...count do
  puts "idx :#{i} #{obj["RECORDS"][i]["goods_id"]} #{obj["RECORDS"][i]["attr_name"]} #{obj["RECORDS"][i]["attr_value"]}"
end
