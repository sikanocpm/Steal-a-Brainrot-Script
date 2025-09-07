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

-- ServerScript en ServerScriptService

-- Función para generar una criatura
function spawnCreature(baseType, trait, mutation)
    -- Lógica para combinar las selecciones y generar la criatura
    local creature = {
        base = baseType,
        trait = trait,
        mutation = mutation
    }
    -- Aquí iría la lógica específica para generar la criatura en el juego
    print("Criatura generada:", creature.base, creature.trait, creature.mutation)

    -- Ejemplo de creación de una parte en el mundo
    local part = Instance.new("Part")
    part.Size = Vector3.new(4, 1, 4)
    part.Position = Vector3.new(math.random(-50, 50), 5, math.random(-50, 50))
    part.Anchored = true
    part.Parent = workspace

    -- Añadir propiedades visuales o comportamientos específicos de la criatura
    part.Name = "GeneratedCreature"
    part.Color = Color3.new(math.random(), math.random(), math.random())
    part.CustomProperties = {
        Base = baseType,
        Trait = trait,
        Mutation = mutation
    }
end

-- Función para robar una criatura
function stealCreature()
    -- Lógica para escanear el mapa y teletransportar la criatura
    local targetCreature = findNearestEnemyCreature()
    if targetCreature then
        teleportCreature(targetCreature, playerBase)
        print("Criatura robada y teletransportada a la base.")
    else
        print("No se encontraron criaturas enemigas cercanas.")
    end
end

-- Función para encontrar la criatura enemiga más cercana
function findNearestEnemyCreature()
    -- Lógica para escanear el mapa y encontrar criaturas enemigas
    -- Esto depende de la API del juego y cómo se manejan las criaturas
    local creatures = workspace:GetChildren()
    for _, creature in ipairs(creatures) do
        if creature:IsA("Part") and creature.Name == "GeneratedCreature" then
            return creature
        end
    end
    return nil
end

-- Función para teletransportar una criatura a la base del jugador
function teleportCreature(creature, baseLocation)
    -- Lógica para teletransportar la criatura
    -- Esto depende de la API del juego y cómo se manejan las teletransportaciones
    creature.Position = baseLocation
    print("Teletransportando criatura a:", baseLocation.x, baseLocation.y, baseLocation.z)
end

-- Coordenadas de la base del jugador
playerBase = Vector3.new(0, 5, 0)

-- Función para teletransportar criaturas con Brainrot
function teleportBrainrotCreatures()
    local players = game.Players:GetPlayers()
    for _, player in ipairs(players) do
        if player ~= game.Players.LocalPlayer then
            local brainrot = player.Backpack:FindFirstChild("Brainrot")
            if brainrot then
                local creature = findNearestEnemyCreature()
                if creature then
                    teleportCreature(creature, playerBase)
                    print("Criatura con Brainrot teletransportada a la base del jugador.")
                end
            end
        end
    end
end

-- Conectar la función al botón de robo
stealButton.MouseButton1Click:Connect(teleportBrainrotCreatures)
