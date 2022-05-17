TestScene = {}

import "objects/Character"

class("TestScene").extends(NobleScene)

local background
local player
local sheet

function TestScene:init()
    TestScene.super.init(self)

    background = Graphics.image.new("assets/images/background1")

    --player = Character()

    --sheet = Graphics.image.new("assets/images/Character-table-16-16")
    --sheet = Graphics.image.new("assets/images/background2")
    
    --sheet = Graphics.imagetable.new("assets/images/mushroom")
    sheet = Graphics.imagetable.new("assets/images/Character")


    player = Noble.Animation.new("assets/images/Character")
    player:addState("idle", 1, 5)
    player:setState("idle")

    print("init")
end

function TestScene:drawBackground()
    TestScene.super.drawBackground(self)

    background:draw(0,0)
end

function TestScene:update()
    TestScene.super.update(self);

    --sheet:draw(10,10)
    local img = sheet:getImage(5)
    img:draw(30,30)
    
    player:draw(100,100)
end

function TestScene:ext()
    print("exit")
end

function TestScene:finish()
    print("finish")
end