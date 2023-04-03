local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local AceLocale = LibStub("AceLocale-3.0")
local ControlPanel_Options = AceAddon:GetAddon("ControlPanel_Options")
local L = AceLocale:GetLocale("ControlPanel_Options")
local SetCVar = SetCVar

local create_bool_config = ControlPanel_Options.create_bool_config
local create_bool_config_not = ControlPanel_Options.create_bool_config_not
local create_range_config = ControlPanel_Options.create_range_config


local NameplateMakeLarger_config
local NameplateScale_config

if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then

NameplateMakeLarger_config = {
	name = UNIT_NAMEPLATES_MAKE_LARGER,
	desc = OPTION_TOOLTIP_UNIT_NAMEPLATES_MAKE_LARGER,
	type = "toggle",
	set = function(info,val)
		if val then
			SetCVar("NamePlateHorizontalScale", 1.4)
			SetCVar("NamePlateVerticalScale", 2.7)
			SetCVar("NamePlateClassificationScale", 1.25)
		else
			SetCVar("NamePlateHorizontalScale", 1)
			SetCVar("NamePlateVerticalScale", 1)
			SetCVar("NamePlateClassificationScale", 1)
		end
	end,
	get = function(info)
		local horizontalscale = GetCVar("NamePlateHorizontalScale")
		local verticalscale = GetCVar("NamePlateVerticalScale")
		local classificationscale = GetCVar("NamePlateClassificationScale")
		local ApproximatelyEqual = ApproximatelyEqual
		if ApproximatelyEqual(horizontalscale,1.4) and
			ApproximatelyEqual(verticalscale,2.7) and
			ApproximatelyEqual(classificationscale,1.25) then
			return true
		elseif ApproximatelyEqual(horizontalscale,1) and
			ApproximatelyEqual(verticalscale,1) and
			ApproximatelyEqual(classificationscale,1) then
			return false
		end
	end,
	width = "full",
	tristate = true,
}

local NameplateMakeLarger_config2 = ControlPanel_Options.clone_table(NameplateMakeLarger_config)

NameplateMakeLarger_config2.order = -1

NameplateScale_config =
{
	name = L.Scale,
	desc = L.NamePlateScale_desc,
	type = "group",
	args =
	{
		MakeLarger = NameplateMakeLarger_config2,
		NamePlateHorizontalScale =
		create_range_config(L.Horizontal,nil,1,nil),
		NamePlateVerticalScale =
		create_range_config(L.Vertical,nil,1,nil),
		NamePlateClassificationScale =
		create_range_config(L.Classification,L.NamePlateClassificationScale_desc,1,nil)
	}
}

end

local Interface =
{
	name = UIOPTIONS_MENU,
	desc = L["ControlPanel won't manage these options."],
	type = "group",
	args =
	{

		movieSubtitle =
		create_bool_config(CINEMATIC_SUBTITLES,OPTION_TOOLTIP_CINEMATIC_SUBTITLES),
		enableMovePad =
		create_bool_config(MOVE_PAD,OPTION_TOOLTIP_MOVE_PAD),
		showTutorials =
		create_bool_config(SHOW_TUTORIALS,OPTION_TOOLTIP_SHOW_TUTORIALS),
		Controls = 
		{
			name = CONTROLS_LABEL,
			desc = CONTROLS_SUBTEXT,
			type = "group",
			args =
			{
				deselectOnClick =
				create_bool_config_not(GAMEFIELD_DESELECT_TEXT,OPTION_TOOLTIP_GAMEFIELD_DESELECT),
				autoDismountFlying = 
				create_bool_config(AUTO_DISMOUNT_FLYING_TEXT,OPTION_TOOLTIP_AUTO_DISMOUNT_FLYING),
				autoClearAFK =
				create_bool_config(CLEAR_AFK,OPTION_TOOLTIP_CLEAR_AFK),
				autoLootDefault =
				create_bool_config(AUTO_LOOT_DEFAULT_TEXT,OPTION_TOOLTIP_AUTO_LOOT_DEFAULT),
				interactOnLeftClick =
				create_bool_config(INTERACT_ON_LEFT_CLICK_TEXT,OPTION_TOOLTIP_INTERACT_ON_LEFT_CLICK),
				lootUnderMouse =
				create_bool_config(LOOT_UNDER_MOUSE_TEXT,OPTION_TOOLTIP_LOOT_UNDER_MOUSE),
			}
		},
		Combat =
		{
			name = COMBAT_LABEL,
			desc = COMBAT_SUBTEXT,
			type = "group",
			args =
			{
				autoSelfCast =
				create_bool_config(AUTO_SELF_CAST_TEXT,OPTION_TOOLTIP_AUTO_SELF_CAST),
				showTargetOfTarget =
				create_bool_config(SHOW_TARGET_OF_TARGET_TEXT,OPTION_TOOLTIP_SHOW_TARGET_OF_TARGET),
				spellActivationOverlayOpacity =
				create_range_config(SPELL_ALERT_OPACITY,OPTION_TOOLTIP_SPELL_ALERT_OPACITY,0,1),
				doNotFlashLowHealthWarning =
				create_bool_config(FLASH_LOW_HEALTH_WARNING,OPTION_TOOLTIP_FLASH_LOW_HEALTH_WARNING),
				lossOfControl =
				create_bool_config(LOSS_OF_CONTROL,OPTION_TOOLTIP_LOSS_OF_CONTROL),
				enableFloatingCombatText =
				create_bool_config(SHOW_COMBAT_TEXT_TEXT,OPTION_TOOLTIP_SHOW_COMBAT),
			}
		},
		Camera =
		{
			name = CAMERA_LABEL,
			desc = CAMERA_SUBTEXT,
			type = "group",
			args =
			{
				cameraWaterCollision =
				create_bool_config(WATER_COLLISION,OPTION_TOOLTIP_WATER_COLLISION),
				cameraYawSmoothSpeed =
				create_range_config(AUTO_FOLLOW_SPEED,OPTION_TOOLTIP_AUTO_FOLLOW_SPEED,0,300),
				cameraDistanceMaxZoomFactor =
				create_range_config(L["Distance Max Zoom Factor"],nil,1,2.6)
			}
		},
		SocialPanelOptions =
		{
			name = SOCIAL_LABEL,
			desc = SOCIAL_SUBTEXT,
			type = "group",
			args =
			{
				profanityFilter =
				create_bool_config(PROFANITY_FILTER,OPTION_TOOLTIP_PROFANITY_FILTER),
				spamFilter =
				create_bool_config(SPAM_FILTER,OPTION_TOOLTIP_SPAM_FILTER),
				guildMemberNotify =
				create_bool_config(GUILDMEMBER_ALERT,OPTION_TOOLTIP_GUILDMEMBER_ALERT),
				blockTrades =
				create_bool_config(BLOCK_TRADES,OPTION_TOOLTIP_BLOCK_TRADES),
				blockChannelInvites =
				create_bool_config(BLOCK_CHAT_CHANNEL_INVITE,OPTION_TOOLTIP_BLOCK_CHAT_CHANNEL_INVITE),
				showToastOnline =
				create_bool_config(SHOW_TOAST_ONLINE_TEXT,OPTION_TOOLTIP_SHOW_TOAST_ONLINE),
				showToastOffline =
				create_bool_config(SHOW_TOAST_OFFLINE_TEXT,OPTION_TOOLTIP_SHOW_TOAST_OFFLINE),
				showToastBroadcast =
				create_bool_config(SHOW_TOAST_BROADCAST_TEXT,OPTION_TOOLTIP_SHOW_TOAST_BROADCAST),
				showToastFriendRequest =
				create_bool_config(SHOW_TOAST_FRIEND_REQUEST_TEXT,OPTION_TOOLTIP_SHOW_TOAST_FRIEND_REQUEST),
				showToastWindow =
				create_bool_config(SHOW_TOAST_WINDOW_TEXT,OPTION_TOOLTIP_SHOW_TOAST_WINDOW),
				enableTwitter =
				create_bool_config(SOCIAL_ENABLE_TWITTER_FUNCTIONALITY,OPTION_TOOLTIP_SOCIAL_ENABLE_TWITTER_FUNCTIONALITY),
			}
		},
		Display =
		{
			name = DISPLAY_LABEL,
			desc = DISPLAY_SUBTEXT,
			type = "group",
			args =
			{
				rotateMinimap =
				create_bool_config(ROTATE_MINIMAP,OPTION_TOOLTIP_ROTATE_MINIMAP),
				hideAdventureJournalAlerts =
				create_bool_config(HIDE_ADVENTURE_JOURNAL_ALERTS,OPTION_TOOLTIP_HIDE_ADVENTURE_JOURNAL_ALERTS),
				showTutorials =
				create_bool_config(SHOW_TUTORIALS,OPTION_TOOLTIP_SHOW_TUTORIALS),
			}
		},
		Mouse =
		{
			name = MOUSE_LABEL,
			desc = MOUSE_SUBTEXT,
			type = "group",
			args =
			{
				enableMouseSpeed =
				create_bool_config(ENABLE_MOUSE_SPEED,OPTION_TOOLTIP_MOUSE_SPEED),
				mouseInvertPitch =
				create_bool_config(INVERT_MOUSE,OPTION_TOOLTIP_INVERT_MOUSE),
				autointeract =
				create_bool_config(CLICK_TO_MOVE,OPTION_TOOLTIP_CLICK_TO_MOVE),
				mouseSpeed =
				create_range_config(MOUSE_SENSITIVITY,OPTION_TOOLTIP_MOUSE_SENSITIVITY,0,1.5),
				cameraYawMoveSpeed =
				create_range_config(MOUSE_LOOK_SPEED,OPTION_TOOLTIP_MOUSE_LOOK_SPEED,0,270),
			}
		},
		Namesplates =
		{
			name = NAMEPLATES_LABEL or L.Nameplates_name,
			type = "group",
			args =
			{
				minion = 
				{
					name = L.Minion,
					type = "group",
					args =
					{
						nameplateShowFriendlyMinions =
						create_bool_config(FRIENDLY,OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_FRIENDLY_MINIONS),
						nameplateShowEnemyMinions =
						create_bool_config(ENEMY,OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_ENEMY_MINIONS),
					}
				},
				scale = NameplateScale_config,
				classcolor =
				{
					name = CLASS_COLORS,
					desc = SHOW_CLASS_COLOR_IN_V_KEY,
					type = "group",
					args =
					{
						ShowClassColorInNameplate =
						create_bool_config(FACTION_STANDING_LABEL3),
						ShowClassColorInFriendlyNameplate =
						create_bool_config(FRIENDLY)
					}
				},
				show =
				{
					name = SHOW,
					type = "group",
					args =
					{
						nameplateShowFriends =
						create_bool_config(UNIT_NAMEPLATES_SHOW_FRIENDS,OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_FRIENDS),
						nameplateShowEnemies =
						create_bool_config(UNIT_NAMEPLATES_SHOW_ENEMIES,OPTION_TOOLTIP_UNIT_UNIT_NAMEPLATES_SHOW_ENEMIES),
						nameplateShowEnemyMinus =
						create_bool_config(UNIT_NAMEPLATES_SHOW_ENEMY_MINUS,OPTION_TOOLTIP_UNIT_NAMEPLATES_SHOW_ENEMY_MINUS),
						nameplateShowAll =
						create_bool_config(UNIT_NAMEPLATES_AUTOMODE,OPTION_TOOLTIP_UNIT_NAMEPLATES_AUTOMODE),	
					}
				},
				nameplateShowDebuffsOnFriendly =
				create_bool_config(L.nameplateShowDebuffsOnFriendly_name,L.nameplateShowDebuffsOnFriendly_desc),
				ShowNamePlateLoseAggroFlash =
				create_bool_config(SHOW_NAMEPLATE_LOSE_AGGRO_FLASH,OPTION_TOOLTIP_SHOW_NAMEPLATE_LOSE_AGGRO_FLASH),
				nameplateResourceOnTarget =
				create_bool_config(DISPLAY_PERSONAL_RESOURCE_ON_ENEMY,OPTION_TOOLTIP_DISPLAY_PERSONAL_RESOURCE_ON_ENEMY),
				nameplateMaxDistance =
				create_range_config(nameplateMaxDistance_name,nameplateMaxDistance_desc),
				MakeLarger = NameplateMakeLarger_config,
			}

		},
		Names =
		{
			name = NAMES_LABEL,
			desc = NAMES_SUBTEXT,
			type = "group",
			args =
			{
				minion = 
				{
					name = L.Minion,
					type = "group",
					args =
					{
						UnitNameFriendlyMinionName =
						create_bool_config(FRIENDLY,OPTION_TOOLTIP_UNIT_NAME_FRIENDLY_MINIONS),
						UnitNameEnemyMinionName =
						create_bool_config(ENEMY,OPTION_TOOLTIP_UNIT_NAME_ENEMY_MINIONS),
					}
				},
				UnitNameOwn =
				create_bool_config(UNIT_NAME_OWN,OPTION_TOOLTIP_UNIT_NAME_OWN),
				UnitNameNPC =
				create_bool_config(UNIT_NAME_NPC,OPTION_TOOLTIP_UNIT_NAME_NPC),
				UnitNameNonCombatCreatureName =
				create_bool_config(UNIT_NAME_NONCOMBAT_CREATURE,OPTION_TOOLTIP_UNIT_NAME_NONCOMBAT_CREATURE),
				UnitNameFriendlyPlayerName =
				create_bool_config(UNIT_NAME_FRIENDLY,OPTION_TOOLTIP_UNIT_NAME_FRIENDLY),
				UnitNameEnemyPlayerName =
				create_bool_config(UNIT_NAME_ENEMY,OPTION_TOOLTIP_UNIT_NAME_ENEMY),
				nameplateShowSelf =
				create_bool_config(DISPLAY_PERSONAL_RESOURCE,OPTION_TOOLTIP_DISPLAY_PERSONAL_RESOURCE)	
			}
		},
		RaidFrames =
		{
			name = RAID_FRAMES_LABEL,
			desc = RAID_FRAMES_LABEL,
			type = "group",
			args =
			{
				raidFramesDisplayDebuffs =
				create_bool_config(COMPACT_UNIT_FRAME_PROFILE_DISPLAYNONBOSSDEBUFFS,OPTION_TOOLTIP_COMPACT_UNIT_FRAME_PROFILE_DISPLAYNONBOSSDEBUFFS),
				raidFramesDisplayOnlyDispellableDebuffs =
				create_bool_config(COMPACT_UNIT_FRAME_PROFILE_DISPLAYONLYDISPELLABLEDEBUFFS,OPTION_TOOLTIP_COMPACT_UNIT_FRAME_PROFILE_DISPLAYONLYDISPELLABLEDEBUFFS),
			}
		},
		Privacy =
		{
			name = L["Privacy"],
			type = "group",
			args =
			{
				accountAchievements = AreAccountAchievementsHidden and
				{
					name = SHOW_ACCOUNT_ACHIEVEMENTS,
					desc = OPTION_TOOLTIP_SHOW_ACCOUNT_ACHIEVEMENTS,
					type = "toggle",
					set = function(info,val)
						ShowAccountAchievements(val)
					end,
					get = function(info)
						return AreAccountAchievementsHidden()
					end,
					width = "full"
				} or nil
			}
		},
		Synchronize =
		{
			name = L["Synchronize"],
			desc = L["Whether client settings should be stored on the server"],
			type = "group",
			args =
			{
				synchronizeSettings = 
				create_bool_config(SETTINGS),
				synchronizeConfig = 
				create_bool_config(L["Config"]),
				synchronizeBindings =
				create_bool_config(KEY_BINDINGS_MAC),
				synchronizeMacros =
				create_bool_config(MACROS),
				synchronizeChatFrames = 
				create_bool_config(L["Chat Frames"]),
				forceEnglishNames =
				create_bool_config(L["Force English Names"])
			}
		}
	}
}

ControlPanel_Options:push("Interface",Interface)
