function getVoltage()
    return adc.read(0) * 3300 / 1024
end

function getTemperatur(input)
    return 30 + (10.888 - math.sqrt(118.5485 + (0.01388 * (1777.3 - getVoltage())))) / -0.00694
end

wifi.setmode(wifi.STATION)
wifi.sta.config("ne000h", "")
print(wifi.sta.getip())

srv=net.createServer(net.TCP) 
srv:listen(80, function(conn) 
	conn:on("receive", function(conn, request)
    conn:send("HTTP/1.1 200 OK\n")
    conn:send("Content-Type: text/html; charset=UTF-8\n\n")
    conn:send("<html><body>" .. getTemperatur() .. "</body></html>")
	conn:close()
	collectgarbage()
	end) 
end)
