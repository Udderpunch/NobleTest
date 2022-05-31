import "libraries/noble/libraries/AnimatedSprite.lua"

class("Character").extends(AnimatedSprite)

--function Character:init(table, states, animate)
function Character:init()
    print("character created")
    --Character.super.init(self, table, states, animate)
    
end

function Character:Test()
    print("test called")
end