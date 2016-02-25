wifi.setmode(wifi.STATION)
wifi.sta.config("ssid", "password")
print(wifi.sta.getip())

function getVoltage()
    return adc.read(0)*3300/1024
end

function getTemperatur(input)
    return 30 + (10.888 - math.sqrt(118.5485 + (0.01388 * (1777.3 - getVoltage())))) / -0.00694
end

srv=net.createServer(net.TCP) 
srv:listen(80, function(conn) 
	conn:on("receive", function(conn, request)
    conn:send("HTTP/1.1 200 OK\r\n");
    conn:send("Content-type: text/json\r\n");
    conn:send("Connection: close\r\n\r\n");
	conn:send("{\"node\":\"cabinet\",\"temperature\":")
    conn:send(getTemperatur())
    conn:send("}")
	conn:close()
	collectgarbage()
	end) 
end)
