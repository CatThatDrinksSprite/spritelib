local SpriteLib = loadstring(game:HttpGet("https://github.com/CatThatDrinksSprite/spritelib/blob/main/Source.lua", true))

local Window = SpriteLib:CreateWindow({
    Title = "Example",
    ToggleKey = Enum.KeyCode.Q
})

local c1 = Window:CreateCategory({
    CategoryName = "1"
})

c1:CreateButton({
    ButtonName = "1",
    Callback = function() print("1") end
})

local c2 = Window:CreateCategory({
    CategoryName = "2"
})

c2:CreateButton({
    ButtonName = "2",
    Callback = function() print("2") end
})
