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

	--创建物理节点 
	local heroBody  = cc.PhysicsBody:createBox(cc.size(sp:getContentSize().width/2, sp:getContentSize().height/2),cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(0,0))
	-- heroBody:applyImpulse(cc.p(0,9.8))
	heroBody:setMass(100)
	sp:setPhysicsBody(heroBody)
end

function Hero:changePos(sprite,xPosition)
	local x,y = sprite:getPosition()
	sprite:pos(xPosition,y)
end

return Hero