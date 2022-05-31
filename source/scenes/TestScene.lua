TestScene = {}

import "objects/Character"

class("TestScene").extends(NobleScene)

local geo<const> = playdate.geometry

local background
local player
local sheet

local bunny
local bunnyPos;
local bunnySpeed;
local lastBunnyPos;

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

    bunny = Noble.Animation.new("assets/images/bunny")
    bunny:addState("idle",1,1)
    bunny:addState("up",2,1)
    bunny:addState("down",3,1)
    bunny:addState("right",4,1)
    bunny:addState("left",5,1)
    bunny:setState("idle")

    print("init")

    bunnySpeed = 5;
    bunnyPos =  geo.point.new(150,150)
    lastBunnyPos = bunnyPos:copy()

    TestScene.inputHandler = {
        
		upButtonHold = function()
			bunnyPos.y -= bunnySpeed
            bunny:setState("up")
		end,
		downButtonHold = function()
			bunnyPos.y += bunnySpeed
            bunny:setState("down")
		end,
        rightButtonHold = function()
            bunnyPos.x += bunnySpeed
            bunny:setState("right")
        end,
        leftButtonHold = function()
            bunnyPos.x -= bunnySpeed
            bunny:setState("left")
        end,
		cranked = function(change, acceleratedChange)
			crankTick = crankTick + change
			if (crankTick > 30) then
				crankTick = 0
				menu:selectNext()
			elseif (crankTick < -30) then
				crankTick = 0
				menu:selectPrevious()
			end
		end,
		AButtonDown = function()
		end
	}
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

    --if( bunnyPos.x ~= 0 && )

    if lastBunnyPos == bunnyPos then
        bunny:setState("idle")
    end
    bunny:draw(bunnyPos.x, bunnyPos.y)
    lastBunnyPos = bunnyPos:copy(bunnyPos)
end

function TestScene:ext()
    print("exit")
end

function TestScene:finish()
    print("finish")
end