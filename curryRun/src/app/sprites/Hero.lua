-- 英雄类
local Hero = class("Hero",function()
	return display.newSprite()
end)

local BaseRole = require('app.sprites.BaseRole')

-- 初始生命值
local HP = 1

function Hero:ctor()
	local  sp = display.newSprite("curyRun_1.png")

	-- 动画
	display.addSpriteFrames("hero.plist","hero.pvr.ccz")
	local frame = display.newFrames("curyRun_%1d.png",1,4)
	local animation = display.newAnimation(frame,0.2)
	local animate = cc.Animate:create(animation)

	sp:pos(0,0)
		:scale(0.5,0.5)
		:addTo(self)
		--:runAction(animate) --播放一次
		:playAnimationForever(animation) -- 循环播放动作

end

function Hero:changePos(sprite,xPosition)
	local x,y = sprite:getPosition()
	sprite:pos(xPosition,y)
end

return Hero