import 'libraries/noble/Noble'

import 'utilities/Utilities'

import 'scenes/ExampleScene'
import 'scenes/ExampleScene2'
import 'scenes/TestScene'
import 'scenes/TestSceneTwo'

Noble.Settings.setup({
	Difficulty = "Medium"
})

Noble.GameData.setup({
	Score = 0
})

Noble.showFPS = true

--Noble.new(ExampleScene, 1.5, Noble.TransitionType.CROSS_DISSOLVE)

--Noble.new(TestScene, 1.5, Noble.TransitionType.CROSS_DISSOLVE)

Noble.new(TestSceneTwo, 1.5, Noble.TransitionType.CROSS_DISSOLVE)