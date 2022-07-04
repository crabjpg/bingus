local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local PlayerService = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")

local LocalPlayer = PlayerService.LocalPlayer
local Ping = Stats.Network.ServerStatsItem["Data Ping"]
local Aimbot,SilentAim = false,nil

local Window = Parvus.Utilities.UI:Window({
    Name = "Roblox Gamesense — "..Parvus.Current,
    Position = UDim2.new(0.05,0,0.5,-248)
    }) do Window:Watermark({Enabled = true})

    local SettingsTab = Window:Tab({Name = "Watermark"}) do
            MenuSection:Toggle({Name = "Watermark",Flag = "UI/Watermark",Value = true,
            Callback = function(Bool) Window.Watermark:Toggle(Bool) end})
        end
        local CreditsSection = SettingsTab:Section({Name = "Credits",Side = "Right"}) do
            CreditsSection:Label({Text = "Watermark Script, original by AlexR32"})
        end
    end
end

Window:LoadDefaultConfig()
Window:SetValue("UI/Toggle",
Window.Flags["UI/OOL"])

local GetFPS = Parvus.Utilities.Misc:SetupFPS()
Parvus.Utilities.Drawing:Cursor(Window.Flags)
Parvus.Utilities.Drawing:FoVCircle("Aimbot",Window.Flags)
Parvus.Utilities.Drawing:FoVCircle("Trigger",Window.Flags)
Parvus.Utilities.Drawing:FoVCircle("SilentAim",Window.Flags)

--[[local DefaultLighting = {
    Ambient = Lighting.Ambient,
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    ColorShift_Bottom = Lighting.ColorShift_Bottom,
    ColorShift_Top = Lighting.ColorShift_Top,
    EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
    EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
    ExposureCompensation = Lighting.ExposureCompensation,
    FogColor = Lighting.FogColor,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart,
    GeographicLatitude = Lighting.GeographicLatitude,
    GlobalShadows = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    ShadowSoftness = Lighting.ShadowSoftness
}]]

    if Window.Flags["UI/Watermark"] then
        Window.Watermark:SetTitle(string.format(
            "gamesense      %s    %i FPS    %i MS",
            os.date("%X"),GetFPS(),math.round(Ping:GetValue())
        ))
    end
    --[[for Property,Value in pairs(DefaultLighting) do
        Lighting[Property] = Window.Flags["Lighting/Enabled"] and
        Parvus.Utilities.UI:TableToColor(Window.Flags["Lighting/"..Property])
        or Value
    end]]
end)