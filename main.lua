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
