-- // Services
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- // Variables
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local SpriteLib = {}
local Utility = {}

-- // Utility Functions
do
    function Utility:Create(InstanceName, Properties, Children)
        local Object = Instance.new(InstanceName)
        local Properties = Properties or {}
        local Children = Children or {}

        for Index, Property in next, Properties do
            Object[Index] = Property
        end

        for _, Child in next, Children do
            Child.Parent = Object
        end

        return Object
    end
end

-- // Library Functions
do
    function SpriteLib:CreateWindow(Properties)
        local Properties = Properties or {}
        local Title = Properties.Title or "SpriteLib"
        local ToggleKey = Properties.ToggleKey or Enum.KeyCode.Q

        local SpriteLibParts = Utility:Create("Folder", {
            Parent = Workspace,
            Name = "SpriteLib Parts"
        }, {
            Utility:Create("Part", {
                Transparency = 1,
                Anchored = true,
                Size = Vector3.new(0, 0, 0),
                CanCollide = false
            }, {
                Utility:Create("SurfaceGui", {
                    AlwaysOnTop = true,
                    Face = Enum.NormalId.Back,
                    LightInfluence = 0,
                    MaxDistance = 0,
                    SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
                }, {
                    Utility:Create("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                        Name = "Container",
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        Size = UDim2.new(1, 0, 1, 0)
                    }, {
                        Utility:Create("UICorner"),
                        Utility:Create("Frame", {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundColor3 = Color3.fromRGB(255, 0, 0),
                            BackgroundTransparency = 1,
                            Name = "Categories",
                            Position = UDim2.new(0.1, 0, 0.55, 0),
                            Size = UDim2.new(0.2, 0, 0.9, 0)
                        }, {
                            Utility:Create("ScrollingFrame", {
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                BackgroundColor3 = Color3.fromRGB(255, 0 ,0),
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Position = UDim2.new(0.5, 0, 0.5, 0),
                                Size = UDim2.new(1, 0, 1, 0),
                                BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
                                ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                                ScrollBarThickness = 5,
                                CanvasSize = UDim2.new(0, 0, 2, 0),
                                TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                            }, {
                                Utility:Create("UIListLayout", {
                                    Padding = UDim.new(0, 4),
                                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                                }),
                                Utility:Create("UIPadding", {
                                    PaddingTop = UDim.new(0, 4)
                                }),
                            })
                        }),
                        Utility:Create("TextLabel", {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundColor3 = Color3.fromRGB(255, 0, 0),
                            BackgroundTransparency = 1,
                            Name = "Title",
                            Position = UDim2.new(0.5, 0, 0.05, 0),
                            Size = UDim2.new(1, 0, 0.1, 0),
                            Font = Enum.Font.Arial,
                            RichText = true,
                            Text = Title,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextSize = 1,
                            TextWrapped = true
                        }, {
                            Utility:Create("UITextSizeConstraint", {
                                MaxTextSize = 24,
                                MinTextSize = 14
                            })
                        })
                    })
                })
            })
        })

        local WindowFunctions = {}

        function WindowFunctions:CreateCategory(Properties)
            local Properties = Properties or {}
            local CategoryName = Properties.CategoryName or "Category"
            local Image = Properties.Image or "rbxassetid://8569322835"
            local Button = Utility:Create("ImageButton", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 0, 0),
                BackgroundTransparency = 1,
                Name = CategoryName,
                Parent = SpriteLibParts.Part.SurfaceGui.Container.Categories.ScrollingFrame,
                Size = UDim2.new(0.6, 0, 0.1, 0),
                Image = Image,
                ScaleType = Enum.ScaleType.Fit
            }, {
                Utility:Create("UICorner")
            })
            local RealCategory = Utility:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 0, 0),
                BackgroundTransparency = 1,
                Name = CategoryName,
                Parent = SpriteLibParts.Part.SurfaceGui.Container,
                Position = UDim2.new(0.6, 0, 0.55, 0),
                Size = UDim2.new(0.8, 0, 0.9, 0),
                Visible = false,
            }, {
                Utility:Create("ScrollingFrame", {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 0 ,0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(1, 0, 1, 0),
                    BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
                    CanvasSize = UDim2.new(0, 0, 10, 0),
                    ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                    ScrollBarThickness = 5,
                    TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                }, {
                    Utility:Create("UIListLayout", {
                        Padding = UDim.new(0, 4),
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }),
                    Utility:Create("UIPadding", {
                        PaddingTop = UDim.new(0, 4)
                    }),
                })
            })
            Button.MouseButton1Click:Connect(function()
                for _, Category in next, SpriteLibParts.Part.SurfaceGui.Container:GetChildren() do
                    if Category:IsA("Frame") and Category.Name ~= "Categories" then
                        Category.Visible = false
                        RealCategory.Visible = true
                    end
                end
            end)

            local CategoryFunctions = {}

            function CategoryFunctions:CreateButton(Properties)
                local Properties = Properties or {}
                local ButtonName = Properties.ButtonName or "Button"
                local Callback = Properties.Callback or function() print("No callback provided") end
                local Button = Utility:Create("TextButton", {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(20, 20, 20),
                    Name = ButtonName,
                    Parent = RealCategory.ScrollingFrame,
                    Size = UDim2.new(0.9, 0, 0.02, 0),
                    Font = Enum.Font.Arial,
                    RichText = true,
                    Text = ButtonName,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 1,
                    TextWrapped = true
                }, {
                    Utility:Create("UICorner"),
                    Utility:Create("UITextSizeConstraint", {
                        MaxTextSize = 24,
                        MinTextSize = 14
                    })
                })
                Button.MouseButton1Click:Connect(Callback)
            end

            return CategoryFunctions
        end

        RunService.RenderStepped:Connect(function()
            SpriteLibParts.Part.CFrame = Workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(0, math.rad((Mouse.X-Mouse.ViewSizeX/2) * 0.05), 0) * CFrame.Angles(math.rad((Mouse.Y-Mouse.ViewSizeY/2) * 0.05), 0, 0)
        end)

        return WindowFunctions
    end
end

return SpriteLib