wifi.setmode(wifi.STATION)
wifi.sta.config("ssid", "password")
print(wifi.sta.getip())

srv=net.createServer(net.TCP) 
srv:listen(80, function(conn) 
	conn:on("receive", function(conn, request) 
	conn:send((adc.read(0)*3300/1024-500)/10)
	conn:close()
	collectgarbage()
	end) 
end)
