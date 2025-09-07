-- LocalScript en StarterGui

-- Crear el panel principal
local mainPanel = Instance.new("ScreenGui")
mainPanel.Name = "CreatureControlPanel"
mainPanel.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear el módulo de generación de criaturas
local generationModule = Instance.new("Frame")
generationModule.Size = UDim2.new(0, 200, 0, 200)
generationModule.Position = UDim2.new(0, 10, 0, 10)
generationModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Color de fondo blanco
generationModule.BorderSizePixel = 2
generationModule.Parent = mainPanel

-- Menú desplegable para la base
local baseDropdown = Instance.new("Dropdown")
baseDropdown.Size = UDim2.new(0, 180, 0, 30)
baseDropdown.Position = UDim2.new(0, 10, 0, 10)
baseDropdown.Parent = generationModule

-- Añadir opciones al menú desplegable
baseDropdown:AddOption("Strawberry Elephant")
baseDropdown:AddOption("Dragon Cannelloni")
baseDropdown:AddOption("Cyber Dragon")
baseDropdown:AddOption("Mystic Phoenix")

-- Menú desplegable para traits
local traitDropdown = Instance.new("Dropdown")
traitDropdown.Size = UDim2.new(0, 180, 0, 30)
traitDropdown.Position = UDim2.new(0, 10, 0, 50)
traitDropdown.Parent = generationModule

-- Añadir opciones al menú desplegable
traitDropdown:AddOption("10B")
traitDropdown:AddOption("Brazil")
traitDropdown:AddOption("Bubblegum")
traitDropdown:AddOption("Quantum")

-- Menú desplegable para mutations
local mutationDropdown = Instance.new("Dropdown")
mutationDropdown.Size = UDim2.new(0, 180, 0, 30)
mutationDropdown.Position = UDim2.new(0, 10, 0, 90)
mutationDropdown.Parent = generationModule

-- Añadir opciones al menú desplegable
mutationDropdown:AddOption("Candy")
mutationDropdown:AddOption("Diamond")
mutationDropdown:AddOption("Galaxy")
mutationDropdown:AddOption("Nebula")

-- Botón de generación
local spawnButton = Instance.new("TextButton")
spawnButton.Size = UDim2.new(0, 180, 0, 30)
spawnButton.Position = UDim2.new(0, 10, 0, 130)
spawnButton.Text = "Generar Criatura"
spawnButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Color de fondo verde
spawnButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Color del texto negro
spawnButton.Parent = generationModule

-- Crear el módulo de robo de criaturas
local stealModule = Instance.new("Frame")
stealModule.Size = UDim2.new(0, 200, 0, 50)
stealModule.Position = UDim2.new(0, 10, 0, 220)
stealModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Color de fondo blanco
stealModule.BorderSizePixel = 2
stealModule.Parent = mainPanel

-- Botón de robo rápido
local stealButton = Instance.new("TextButton")
stealButton.Size = UDim2.new(0, 180, 0, 30)
stealButton.Position = UDim2.new(0, 10, 0, 10)
stealButton.Text = "Steal Brainrot"
stealButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Color de fondo rojo
stealButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Color del texto negro
stealButton.Parent = stealModule

-- Eventos para los botones
spawnButton.MouseButton1Click:Connect(function()
    local baseType = baseDropdown.SelectedOption
    local trait = traitDropdown.SelectedOption
    local mutation = mutationDropdown.SelectedOption
    spawnCreature(baseType, trait, mutation)
end)

stealButton.MouseButton1Click:Connect(function()
    stealCreature()
end)
