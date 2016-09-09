--游戏开始场景

local StartScene = class("StartScene", function()
    return display.newScene("StartScene")
end)

function StartScene:ctor()
    
end

function StartScene:onEnter()
	--背景图片
	local defaultBg = display.newSprite("CurryRunP.jpg")
	defaultBg:pos(display.cx,display.cy)
		:scale(0.9,0.9)
		:addTo(self)

	-- 开始游戏按钮
	local startButton = cc.ui.UIPushButton.new({normal="start_button.png",pressed = "start_button.png"})
		:onButtonClicked(function()
			local  s =  require('app.scenes.MainScene').new()
			display.replaceScene(s,"fade",0.6,display.COLOR_BLACK)
			end)
		:pos(display.cx,display.cy -90)
		:addTo(self)

end

function StartScene:onExit()
end

return StartScene
