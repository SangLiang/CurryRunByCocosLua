-- EndScene.lua
-- 游戏结算场景

local EndScene = class('EndScene',function ()
	return display.newScene('EndScene')
end)

function EndScene:ctor()
	print ('this is EndScene')
end

return EndScene