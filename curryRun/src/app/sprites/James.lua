-- 投放障碍物的詹姆斯
local James = class("James",function()
	return display.newSprite()
end)

function James:ctor()
	local  sp = display.newSprite("James_1.png")

	-- 动画
	display.addSpriteFrames("hero.plist","hero.pvr.ccz")
	local frame = display.newFrames("James_%1d.png",1,3)
	local animation = display.newAnimation(frame,0.2)
	local animate = cc.Animate:create(animation)

	sp:pos(0,0)
		:scale(0.4,0.4)
		:addTo(self)
		--:runAction(animate) --播放一次
		:playAnimationForever(animation) -- 循环播放动作

end

return James