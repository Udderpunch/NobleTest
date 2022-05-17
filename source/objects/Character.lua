Character = {}

class("Character").extends(NobleSprite)

function Character:init()

    -- Character.super.init(self, "assets/images/Character-table-16-16")
    -- self.animation:addState("idle", 1, 1)
    -- self.animation:addState("run",2, 5)
    -- self.animation.addState("jump", 6, 6)

    self.animation = Noble.Animation.new("assets/images/Character-table-16-16")
    self.animation:addState("idle", 1, 1)

    
end