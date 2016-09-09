-- 游戏主场景
local Hero = require("app.sprites.Hero")
local BackGroundLayer = require("app.layers.BackGroundLayer")


local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "Hello, World", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self,2)

end

function MainScene:onEnter()
	


	-- 初始化一个英雄
	local hero = Hero.new()

	hero:addTo(self,1)
		:pos(50,display.cy-130)
		
	

	-- local sp2 = display.newSprite("#curyRun_1.png")
	-- 	:center()
	-- 	:addTo(self,1)
	-- 	:playAnimationForever(animation)
	-- cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()
	-- 	sp2:runAction(animate)
	-- end,0.2,false)

	-- 初始化一个背景层
	local bg = BackGroundLayer.new()
	bg:addTo(self,0)
		:setTouchEnabled(true)
		:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)
		:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event) 
			hero:changePos(hero,event.x)
		end)
end

function MainScene:onExit()
end

return MainScene
