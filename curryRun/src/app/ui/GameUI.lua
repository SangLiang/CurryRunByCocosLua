--  游戏Ui显示，积分栏
local GameUI = class("GameUI",function ()
	return display.newLayer()
end)

local score = 0

function GameUI:ctor()
	self:refreshUI()
end

function GameUI:refreshUI()
	-- print(display.getContentSize.height()*0.1)
	cc.ui.UILabel.new({
            UILabelType = 2, text = "Score:"..score, size = 30})
        :align(display.CENTER, display.cx, display.top - display.height*0.03)
        :addTo(self)
end

return GameUI