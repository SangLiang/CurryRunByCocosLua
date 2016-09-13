-- 游戏主场景
local Hero = require("app.sprites.Hero")
local James = require("app.sprites.James")
local  BasketBall = require("app.sprites.BasketBall")
local bg  = nil;
local BackGroundLayer = require("app.layers.BackGroundLayer")

local MainScene = class("MainScene", function()
	return display.newPhysicsScene('MainScene')
    -- return display.newScene("MainScene")
end)

function MainScene:ctor()
	self.world = self:getPhysicsWorld()
	self.world:setGravity(cc.p(0, -98.0))

	-- 物理世界的调试
	self.world:setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)
	
    local width = display.width
    local height1 = display.height * 9 / 10
    local height2 = display.height * 2 / 16

	 -- 设置物理天空与物理地面
	local sky = display.newNode()
    local bodyTop = cc.PhysicsBody:createEdgeSegment(cc.p(0, height1),cc.PhysicsMaterial(0, 0, 0), cc.p(width, height1))
    sky:setPhysicsBody(bodyTop)
    -- self:addChild(sky)

    local ground = display.newNode()
    local bodyBottom = cc.PhysicsBody:createEdgeSegment(cc.p(0, height2), cc.p(width, height2))
    -- local bodyBottom = cc.PhysicsBody:createBox(cc.p(0, height2), cc.PhysicsMaterial(0, 1, 0),cc.p(width, height2))
    ground:setPhysicsBody(bodyBottom)
    self:addChild(ground)

    self:addCollision()
    -- self.world:EventListenerPhysicsContactWithGroup()

		-- :setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "Hello, World", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self,2)
end

function MainScene:onEnter()
	--创建一个物理世界
	-- local  physicWorld = display.newPhysicsScene('physicWorld')
	-- physicWorld:getPhysicsWorld()

	-- local edgeBody = cc.PhysicsBody:createBox( self:getContentSize(), cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(0,0))
	-- local edgeNode = display.newSprite()
	-- edgeNode:pos(display.left,display.button)
	-- 	:setPhysicsBody(edgeBody)
	-- dump(edgeNode)
    GAME_RESULT = true
	-- 初始化一个英雄
	local hero = Hero.new()
	local james = James.new()
	local timer 


	james:addTo(self,1)
		:pos(display.right-80,display.top - 70)
	hero:addTo(self,1)
		:pos(50,display.cy-130)
	

	local function buildBasketBall()
        if(GAME_RESULT == false) then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(timer)
            return
        end
		local basketBall = BasketBall.new()
		basketBall:addTo(self,1)
			:pos(display.right-80,display.top-70)
	end

    if(GAME_RESULT == true) then
    	timer  = cc.Director:getInstance():getScheduler():scheduleScriptFunc(buildBasketBall,2,false)
    end
	-- local sp2 = display.newSprite("#curyRun_1.png")
	-- 	:center()
	-- 	:addTo(self,1)
	-- 	:playAnimationForever(animation)
	-- cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()
	-- 	sp2:runAction(animate)
	-- end,0.2,false)

	-- 初始化一个背景层
	bg = BackGroundLayer.new()
	bg:addTo(self,-1)
		:setTouchEnabled(true)
		:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)
		:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event) 
			hero:changePos(hero,event.x)
		end)

    -- 创建一个得分UI层
    local ui = require("app.ui.GameUI").new()
    ui:addTo(self,2)
        :setTouchEnabled(false)
end

function MainScene:onExit()
end

function MainScene:addCollision()

    local function contactLogic(node)
        -- if node:getTag() == HEART_TAG then
        --     local emitter = cc.ParticleSystemQuad:create("particles/stars.plist")
        --     emitter:setBlendAdditive(false)
        --     emitter:setPosition(node:getPosition())
        --     self.backgroundLayer.map:addChild(emitter)
        --     if self.player.blood < 100 then

        --         self.player.blood = self.player.blood + 2
        --         self.player:setProPercentage(self.player.blood)
        --     end
        --     audio.playSound("sound/heart.mp3")

        --     node:removeFromParent()

        -- elseif node:getTag() == GROUND_TAG then
        --     self.player:hit()
        --     self.player.blood = self.player.blood - 20
        --     self.player:setProPercentage(self.player.blood)
        --     audio.playSound("sound/ground.mp3")
        -- elseif node:getTag() == AIRSHIP_TAG then
        --     self.player:hit()
        --     self.player.blood = self.player.blood - 10
        --     self.player:setProPercentage(self.player.blood)
        --     audio.playSound("sound/hit.mp3")
        -- elseif node:getTag() == BIRD_TAG then
        --     self.player:hit()
        --     self.player.blood = self.player.blood - 5
        --     self.player:setProPercentage(self.player.blood)
        --     audio.playSound("sound/hit.mp3")
        -- end
    end

    local function onContactBegin(contact)
    	-- print(contact)
        GAME_RESULT = false
        -- cc.Director:getInstance():getScheduler():unscheduleAllSelectors()

        -- cc.Director:getInstance():getScheduler():unscheduleScriptEntry(timer)
		-- self:removeChild(bg)
    	local  s =  require('app.scenes.StartScene').new()
		display.replaceScene(s,"fade",0.6,display.COLOR_BLACK)
        -- local a = contact:getShapeA():getBody():getNode()
        -- local b = contact:getShapeB():getBody():getNode()
        -- contactLogic(a)
        -- contactLogic(b)

        -- return true
    end

    local function onContactSeperate(contact)
        -- if self.player.blood <= 0 then 
        --     self.backgroundLayer:unscheduleUpdate()
        --     self.player:die()

        --     local over = display.newSprite("image/over.png")
        --         :pos(display.cx, display.cy)
        --         :addTo(self)

        --         cc.Director:getInstance():getEventDispatcher():removeAllEventListeners()
        -- end
    end
    
    local contactListener = cc.EventListenerPhysicsContact:create()
    contactListener:registerScriptHandler(onContactBegin, cc.Handler.EVENT_PHYSICS_CONTACT_BEGIN)
    contactListener:registerScriptHandler(onContactSeperate, cc.Handler.EVENT_PHYSICS_CONTACT_SEPERATE)
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    eventDispatcher:addEventListenerWithFixedPriority(contactListener, 1)
end

return MainScene
