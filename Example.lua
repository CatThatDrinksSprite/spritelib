local SpriteLib = loadstring(game:HttpGet("https://github.com/CatThatDrinksSprite/spritelib/blob/main/Source.lua", true))

local Window = SpriteLib:CreateWindow({
    Title = "Example",
    ToggleKey = Enum.KeyCode.Q
})

local 1c = Window:CreateCategory({
    CategoryName = "1"
})

1c:CreateButton({
    ButtonName = "1",
    Callback = function() print("1") end
})

local 2c = Window:CreateCategory({
    CategoryName = "2"
})

2c:CreateButton({
    ButtonName = "2",
    Callback = function() print("2") end
})
