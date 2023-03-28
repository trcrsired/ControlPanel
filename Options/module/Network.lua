local ControlPanel_Options = LibStub("AceAddon-3.0"):GetAddon("ControlPanel_Options")

local create_bool_config_instance = ControlPanel_Options.create_bool_config_instance

local Network

function ControlPanel_Options:CreateNetwork(o)
	if Network == nil then
		Network =
		{
			name = NETWORK_LABEL,
			type = "group",
			order = o,
			args =
			{
				disableServerNagle = 
				create_bool_config_instance(OPTIMIZE_NETWORK_SPEED,OPTION_TOOLTIP_OPTIMIZE_NETWORK_SPEED),
				useIPv6 =
				create_bool_config_instance(USEIPV6,OPTION_TOOLTIP_USEIPV6),
				advancedCombatLogging =
				create_bool_config_instance(ADVANCED_COMBAT_LOGGING,OPTION_TOOLTIP_ADVANCED_COMBAT_LOGGING),
			}
		}
	end
	return Network
end
