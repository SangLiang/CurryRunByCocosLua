
require("config")
require("cocos.init")
require("framework.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    -- 游戏进入场景
    self:enterScene("StartScene")
    -- 游戏主场景
    -- self:enterScene("MainScene")
    --游戏结束场景
    -- self:enterScene("EndScene")
    
end

return MyApp
