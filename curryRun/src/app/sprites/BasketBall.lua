-- 篮球类
local BasketBall = class("BasketBall",function ()
	return display.newSprite()
end)

local COIN_MASS       = 1
local COIN_RADIUS     = 46
local COIN_FRICTION   = 1.0
local COIN_ELASTICITY = 5000

function BasketBall:ctor()
	display.addSpriteFrames("hero.plist","hero.pvr.ccz")
	local  sp = display.newSprite("#BasketBall.png")
    local timer
	sp:scale(0.12,0.12)
	-- local coinBody = cc.PhysicsBody:createCircle(sp:getContentSize().width/14,cc.PhysicsMaterial(COIN_RADIUS, COIN_FRICTION, COIN_ELASTICITY))

	local coinBody = cc.PhysicsBody:createCircle(sp:getContentSize().width/14,cc.PhysicsMaterial(0, 1.5, 0))

	-- local coinBody = cc.PhysicsBody:createCircle(COIN_RADIUS,cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(0,0))
    coinBody:setMass(COIN_MASS)
    	:applyForce(cc.p(-30,0))
    	:setCollisionBitmask(0x0001)
    	:setCategoryBitmask(0x0010)
   		:setContactTestBitmask(0x0010)
    	:setTag(1)
    	-- :setCollisionType(1)
    sp:setPhysicsBody(coinBody)
    	:addTo(self)


    local function removeSelf()
        if(GAME_RESULT == false) then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(timer)
            return 
        end
        
        if(GAME_RESULT == true) then
            self:removeChild(sp)
        end
    end

    -- 每间隔10秒销毁掉自己
    if (GAME_RESULT == true) then
        timer =  cc.Director:getInstance():getScheduler():scheduleScriptFunc(removeSelf,10,false)
    end
end

return BasketBall