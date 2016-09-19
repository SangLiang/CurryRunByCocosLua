--  游戏Ui显示，积分栏
local GameUI = class("GameUI",function ()
	return display.newLayer()
end)

local GameScore


function GameUI:ctor()
	-- self:refreshUI()
	GameScore = cc.ui.UILabel.new({
            UILabelType = 2, text = "Score:"..GAME_SCORE, size = 30})
        :align(display.CENTER, display.cx, display.top - display.height*0.03)
        :addTo(self)
end

function GameUI:refreshUI()
	-- print(display.getContentSize.height()*0.1)
	dump(GameScore.text)
	GameScore:setString("Score:"..GAME_SCORE)
	print("i m run".."  "..GAME_SCORE)
end

return GameUI