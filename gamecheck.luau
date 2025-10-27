if game.PlaceId == 16732694052 then
	loadstring(
		game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/refs/heads/main/Librarys/Dollarware/Example")
	)()
-- elseif game.PlaceId == 16732694052 then
-- 	loadstring(game:HttpGet("example.com"))()
-- elseif game.PlaceId == 16732694052 then
-- 	loadstring(game:HttpGet("example.com"))()
else
	game.Players.LocalPlayer:Kick("Game Not Supported")
end
