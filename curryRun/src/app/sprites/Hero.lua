-- 英雄类
local Hero = class("Hero",function()
	return display.newSprite()
end)

local BaseRole = require('app.sprites.BaseRole')

-- 初始生命值
local HP = 1
local HERO_MASS = 200
function Hero:ctor()
	-- 动画
	display.addSpriteFrames("hero.plist","hero.pvr.ccz")
	local  sp = display.newSprite("#curyRun_1.png")
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
	heroBody:setMass(HERO_MASS)
		-- :setIsSensor(true)
		:setTag(2)
		:setCategoryBitmask(0x0111)
    	:setContactTestBitmask(0x1111)
		:setCollisionBitmask(0x1001)
		-- :setCollisionType(2)

	sp:setPhysicsBody(heroBody)

end

function Hero:changePos(sprite,xPosition)
	local x,y = sprite:getPosition()
	sprite:pos(xPosition,y)
end

return Hero