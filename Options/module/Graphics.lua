local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local AceLocale = LibStub("AceLocale-3.0")
local ControlPanel = AceAddon:GetAddon("ControlPanel")
local ControlPanel_Options = AceAddon:GetAddon("ControlPanel_Options")
local L = AceLocale:GetLocale("ControlPanel_Options")
local string_format = string.format

local post_process_anti_aliasings = {VIDEO_OPTIONS_NONE,ANTIALIASING_FXAA_LOW,ANTIALIASING_FXAA_HIGH,ANTIALIASING_CMAA}
local resample_qualities = {RESAMPLE_QUALITY_BILINEAR,RESAMPLE_QUALITY_BICUBIC}
local screenshot_formats = { jpg = "jpg", jpeg = "jpeg", tga = "tga"}
local MSAA_qualities = { ["0"] = VIDEO_OPTIONS_NONE, 
				["1,0"]=string_format(ADVANCED_ANTIALIASING_MSAA_FORMAT,2,2),
				["2,0"]=string_format(ADVANCED_ANTIALIASING_MSAA_FORMAT,4,4),
				["2,1"]=string_format(ADVANCED_ANTIALIASING_MSAA_FORMAT,4,8),["2,2"]=string_format(ADVANCED_ANTIALIASING_MSAA_FORMAT,4,16),
				["3,0"]=string_format(ADVANCED_ANTIALIASING_MSAA_FORMAT,8,8)}

local create_range_config_instance = ControlPanel_Options.create_range_config_instance
local create_range_config_instance_width = ControlPanel_Options.create_range_config_instance_width
local create_bool_config_instance = ControlPanel_Options.create_bool_config_instance
local create_select_config_instance_width = ControlPanel_Options.create_select_config_instance_width
local Graphics

function ControlPanel_Options:CreateGraphics(o)
	if Graphics == nil then
		Graphics =
		{
			name = GRAPHICS_LABEL,
			type = "group",
			order = o,
			args =
			{
				hdPlayerModels = create_bool_config_instance(SHOW_HD_MODELS_TEXT,OPTION_TOOLTIP_SHOW_HD_MODELS),
				useUiScale = create_bool_config_instance(USE_UISCALE,OPTION_TOOLTIP_USE_UISCALE),
				uiScale = create_range_config_instance(UI_SCALE,OPTION_TOOLTIP_UI_SCALE,0,10,1),
				physicsLevel = create_range_config_instance(UI_SCALE,OPTION_TOOLTIP_UI_SCALE,0,2,1),
				restartgx =
				{
					name = L.restartgx_name,
					desc = L.restartgx_desc,
					type = "execute",
					confirm = true,
					func = function()
						RestartGx()
					end,
					width = "full"
				},
				Anti_Aliasing =
				{
					name = ANTIALIASING,
					desc = OPTION_TOOLTIP_ANTIALIASING,
					type = "group",
					args =
					{
						ffxAntiAliasingMode =
						ControlPanel_Options.create_select_config_instance(
							POSTPROCESS_ANTI_ALIASING,OPTION_TOOLTIP_ADVANCED_PPAA,post_process_anti_aliasings),
						MSAA =
						{
							name = "MSAA",
							desc = MULTISAMPLE_ANTIALIASING,
							type = "group",
							args =
							{
								MSAAQuality =
								ControlPanel_Options.create_select_config_instance(MULTISAMPLE_ANTIALIASING,OPTION_TOOLTIP_ADVANCED_MSAA,MSAA_qualities),
								MSAAAlphaTest =
								create_bool_config_instance(MULTISAMPLE_ALPHA_TEST,OPTION_TOOLTIP_MULTISAMPLE_ALPHA_TEST)
							}
						},
						SSAA =
						{
							name = "SSAA",
							desc = "Supersampling Anti-aliasing",
							type = "group",
							args =
							{
								RenderScale =
								create_range_config_instance(RENDER_SCALE,OPTION_TOOLTIP_RENDER_SCALE,0,2),
								ResampleQuality =
								ControlPanel_Options.create_select_config_instance_width_zero_start(
								RESAMPLE_QUALITY,OPTION_TOOLTIP_RESAMPLE_QUALITY,resample_qualities,"full")
							}
						},
					}
				},

				Textures =
				{
					name = TEXTURES_SUBHEADER,
					type = "group",
					args =
					{
						graphicsTextureResolution =
						create_range_config_instance(TEXTURE_DETAIL,OPTION_TOOLTIP_TEXTURE_DETAIL,1,3,1),
						graphicsTextureFiltering = WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE and
						create_range_config_instance(ANISOTROPIC,OPTION_TOOLTIP_ANISOTROPIC,1,6,1) or nil,
						textureFilteringMode = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and
						create_range_config_instance(ANISOTROPIC,OPTION_TOOLTIP_ANISOTROPIC,0,5,1) or nil,
						graphicsProjectedTextures = 
						{
							name = PROJECTED_TEXTURES,
							desc = OPTION_TOOLTIP_PROJECTED_TEXTURES,
							type = "toggle",
							set = function(info,val)
								if val == true then
									val = 2
								else
									val = 1
								end
								if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
									val = val - 1
								end
								ControlPanel:SetCVarInstance(info[1],info[#info],val)
							end,
							get = function(info)
								local c = 2
								if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
									c = 1
								end
								return ControlPanel:GetCVarNumberInstance(info[1],info[#info])==c
							end,
						}
					}
				},
				Environment =
				{
					name = ENVIRONMENT_SUBHEADER,
					type = "group",
					args = 
					{
						graphicsViewDistance = 
						create_range_config_instance_width(FARCLIP,OPTION_TOOLTIP_FARCLIP,
						WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and 0 or 1,
						WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and 9 or 10,
						1),
						graphicsEnvironmentDetail =
						create_range_config_instance_width(ENVIRONMENT_DETAIL,OPTION_TOOLTIP_ENVIRONMENT_DETAIL,1,10,1),
						graphicsGroundClutter =
						create_range_config_instance_width(GROUND_CLUTTER,OPTION_TOOLTIP_GROUND_CLUTTER,1,10,1),
					}
				},
				Effects =
				{
					name = EFFECTS_SUBHEADER,
					type = "group",
					args = 
					{
						Gamma =
						create_range_config_instance_width(GAMMA,OPTION_TOOLTIP_GAMMA,0,3),
						graphicsShadowQuality =
						create_range_config_instance_width(SHADOW_QUALITY,OPTION_TOOLTIP_SHADOW_QUALITY,0,6,1),
						graphicsLiquidDetail =
						create_range_config_instance_width(LIQUID_DETAIL,OPTION_TOOLTIP_LIQUID_DETAIL,1,4,1),
						graphicsSunshafts =
						create_range_config_instance_width(SUNSHAFTS,OPTION_TOOLTIP_SUNSHAFTS,1,3,1),
						graphicsParticleDensity =
						create_range_config_instance_width(PARTICLE_DENSITY,OPTION_TOOLTIP_PARTICLE_DENSITY,0,5,1),
						graphicsSSAO =
						create_range_config_instance_width(SSAO_LABEL,OPTION_TOOLTIP_SSAO,1,4,1),
						graphicsDepthEffects =
						create_range_config_instance_width(DEPTH_EFFECTS,OPTION_TOOLTIP_DEPTH_EFFECTS,1,4,1),
						graphicsLightingQuality =
						create_range_config_instance_width(LIGHTING_QUALITY,OPTION_TOOLTIP_LIGHTING_QUALITY,1,3,1),
						graphicsOutlineMode =
						create_range_config_instance_width(OUTLINE_MODE,OPTION_TOOLTIP_OUTLINE_MODE,1,3,1),
						weatherDensity =
						create_range_config_instance_width(WEATHER_DETAIL,OPTION_TOOLTIP_WEATHER_DETAIL,1,3,1),
					}
				},
				FPS =
				{
					name = "FPS",
					type = "group",
					args =
					{
						maxFPS =
						create_range_config_instance_width(MAXFPS,OPTION_MAXFPS,0,200),
						maxFPSBk =
						create_range_config_instance_width(MAXFPSBK,OPTION_MAXFPSBK,0,200),
					}
				},
				Screenshot =
				{
					name = L["Screenshot"],
					type = "group",
					args = 
					{
						screenshotFormat =
						create_select_config_instance_width(L.Format,nil,screenshot_formats),
						screenshotQuality =
						create_range_config_instance(QUALITY,L["Note this option only affects JPEG screenshots (TGA screenshots always use lossless quality)."],1,10,1),
					}
				}
			}
		}
	end
	return Graphics
end
