-- 游戏主场景
local Hero = require("app.sprites.Hero")
local James = require("app.sprites.James")
local BackGroundLayer = require("app.layers.BackGroundLayer")

local MainScene = class("MainScene", function()
	return display.newPhysicsScene('MainScene')
    -- return display.newScene("MainScene")
end)

function MainScene:ctor()
	self.world = self:getPhysicsWorld()
	self.world:setGravity(cc.p(0, -98.0))

	-- 物理世界的调试
	-- self.world:setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)
	
    local width = display.width
    local height1 = display.height * 9 / 10
    local height2 = display.height * 2 / 16

	 -- 设置物理天空与物理地面
	local sky = display.newNode()
    local bodyTop = cc.PhysicsBody:createEdgeSegment(cc.p(0, height1), cc.p(width, height1))
    sky:setPhysicsBody(bodyTop)
    self:addChild(sky)

    local ground = display.newNode()
    local bodyBottom = cc.PhysicsBody:createEdgeSegment(cc.p(0, height2), cc.p(width, height2))
    ground:setPhysicsBody(bodyBottom)
    self:addChild(ground)
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

	-- 初始化一个英雄
	local hero = Hero.new()
	local james = James.new()

	james:addTo(self,1)
		:pos(display.right-80,display.top - 70)
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
