local ControlPanel = LibStub("AceAddon-3.0"):NewAddon("ControlPanel","AceEvent-3.0","AceConsole-3.0")

if C_AddOns == nil then
ControlPanel.C_AddOns =
{
LoadAddOn = LoadAddOn,
GetNumAddOns = GetNumAddOns,
GetAddOnMetadata = GetAddOnMetadata,
IsAddOnLoaded = IsAddOnLoaded,
GetAddOnInfo = GetAddOnInfo,
GetAddOnDependencies = GetAddOnDependencies
}
else
	ControlPanel.C_AddOns = C_AddOns
end

local C_AddOns = ControlPanel.C_AddOns
local LoadAddOn = C_AddOns.LoadAddOn
local GetNumAddOns = C_AddOns.GetNumAddOns
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata
local IsAddOnLoaded = C_AddOns.IsAddOnLoaded
local GetAddOnInfo = C_AddOns.GetAddOnInfo

function ControlPanel:OnInitialize()
	SetCVar("RAIDSettingsEnabled",false)
	self.db = LibStub("AceDB-3.0"):New("ControlPanelDB",{profile = {}},true)
	self:RegisterChatCommand("ControlPanel", "ChatCommand")
	self:RegisterChatCommand("CP", "ChatCommand")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_UPDATE_RESTING","PLAYER_ENTERING_WORLD")
end

function ControlPanel:ChatCommand(input)
	if IsAddOnLoaded("ControlPanel_Options") == false then
		local loaded , reason = LoadAddOn("ControlPanel_Options")
		if loaded == false then
			self:Print("ControlPanel_Options: "..reason)
			return
		end
	end
	self:SendMessage("CONTROL_PANEL_CHAT_COMMAND",input)
end