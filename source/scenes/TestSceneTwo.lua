TestSceneTwo = {}

import "libraries/noble/libraries/AnimatedSprite.lua"
import "objects/Character.lua"

local geo <const> = playdate.geometry

class("TestSceneTwo").extends(NobleScene)

local _spriteSheet
local _sheetStates

local _bunny

function TestSceneTwo:init()
    TestSceneTwo.super.init(self)
    print("TestSceneTwo")
    
    _sheetStates = AnimatedSprite.loadStates("assets/images/bunny.json")
    _spriteSheet = Graphics.imagetable.new("assets/images/bunny")

    _bunny = Bunny.new(_spriteSheet, _sheetStates, true)

    --local character = Character.new(_spriteSheet, _sheetStates, true)
    local character = Character.new()
    character:moveTo(200,200)

    --bunny = AnimatedSprite.new(bunnyTable, bunnyStates, true)
    --bunny:addState("idle",1,5, {tickStep = 2}).asDefault()
    --bunny:playAnimation()

    print("working?")
    --character:Test()

    _bunny:changeState("carrot", true)

    _bunny:moveTo(100,100)

    self.inputHandler = 
    {
        upButtonHold = function()
			_bunny.Direction.y = -1;
		end,
		downButtonHold = function()
			_bunny.Direction.y = 1;
		end,
        rightButtonHold = function()
            _bunny.Direction.x = 1;
        end,
        leftButtonHold = function()
            _bunny.Direction.x = -1;
        end,
        AButtonDown = function()
            bunny:changeState("carrot")
        end
    }
end

function TestSceneTwo:update()
    TestSceneTwo.super.update(self)

    _bunny:update()
end

class("Bunny").extends(AnimatedSprite)

function Bunny:init(table, states, animate)
    Bunny.super.init(self, table, states, animate)
    self.Direction = geo.vector2D.new(0,0)
    print("created bunny")
end

function Bunny:update()
    self:moveBy( Direction.x, Direction.y )
end