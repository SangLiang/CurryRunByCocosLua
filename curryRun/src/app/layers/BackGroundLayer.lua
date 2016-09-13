-- 背景层
local BackGroundLayer = class("BackGroundLayer",function()
	return display.newLayer()
end)



function BackGroundLayer:ctor()
	local bg = display.newSprite("BasketBallGround.jpg")
        :pos(display.cx +300 , display.cy)
        :addTo(self)

    local bg2 = display.newSprite("BasketBallGround.jpg")
    	:pos(display.cx + 1500,display.cy)
        :addTo(self)

    self:moveBg(bg)
    self:moveBg(bg2)

end

--背景的移动
function BackGroundLayer:moveBg(backGround)
	local cMoveSpeed = 1/60;
	local timer
	-- print(backGround:getContentSize().width)
	-- print(backGround:getContentSize().height)
	-- 背景的移动
	local function move()
		-- print(GAME_RESULT)
		if(GAME_RESULT == false) then
			-- return
    		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(timer)
		end

		local x,y = backGround:getPosition()
			if(x<-600) then
				x = display.cx +1500
			end
			backGround:pos(x - 3,display.cy)

	end
	if(GAME_RESULT == true) then
		-- 初始化定时器
		timer = cc.Director:getInstance():getScheduler():scheduleScriptFunc(move,cMoveSpeed,false)
	end
	
	
	-- cc.Director:getInstance():getScheduler():pauseTarget(timer)
	-- cc.Director:getInstance():getScheduler():unscheduleUpdateForTarget(backGround)
end

return BackGroundLayer