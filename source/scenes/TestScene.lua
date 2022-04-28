TestScene = {}

class("TestScene").extends(NobleScene)

local background

function TestScene:init()
    TestScene.super.init(self)

    background = Graphics.image.new("assets/images/background1")
end

function TestScene:drawBackground()
    TestScene.super.drawBackground(self)

    background:draw(0,0)
end