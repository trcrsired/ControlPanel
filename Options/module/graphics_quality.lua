local AceAddon = LibStub("AceAddon-3.0")
local ControlPanel = AceAddon:GetAddon("ControlPanel")
local ControlPanel_Options = AceAddon:GetAddon("ControlPanel_Options")

function ControlPanel_Options:set_graphics_quality(t,val)
	local setcvar = ControlPanel.SetCVarInstance
	if GetGraphicsCVarValueForQualityLevel then
		for _,v in pairs(ControlPanel_Options.Graphics.args) do
			if v.type == "group" then
				for k1,_ in pairs(v.args) do
					if k1:find("graphics") then
						setcvar(ControlPanel,t,k1,GetGraphicsCVarValueForQualityLevel(k1,val))
					end
				end
			end
		end
	else
		if val == 1 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",1)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",1)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",1)
			setcvar(ControlPanel,t,"graphicsViewDistance",1)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",1)
			setcvar(ControlPanel,t,"graphicsGroundClutter",1)
			setcvar(ControlPanel,t,"graphicsShadowQuality",0)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",1)
			setcvar(ControlPanel,t,"graphicsSunshafts",1)
			setcvar(ControlPanel,t,"graphicsParticleDensity",1)
			setcvar(ControlPanel,t,"graphicsSSAO",1)
			setcvar(ControlPanel,t,"graphicsDepthEffects",1)
			setcvar(ControlPanel,t,"graphicsLightingQuality",1)
			setcvar(ControlPanel,t,"graphicsOutlineMode",1)
		elseif val == 2 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",2)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",2)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",1)
			setcvar(ControlPanel,t,"graphicsViewDistance",2)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",2)
			setcvar(ControlPanel,t,"graphicsGroundClutter",2)
			setcvar(ControlPanel,t,"graphicsShadowQuality",1)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",1)
			setcvar(ControlPanel,t,"graphicsSunshafts",1)
			setcvar(ControlPanel,t,"graphicsParticleDensity",1)
			setcvar(ControlPanel,t,"graphicsSSAO",1)
			setcvar(ControlPanel,t,"graphicsDepthEffects",1)
			setcvar(ControlPanel,t,"graphicsLightingQuality",1)
			setcvar(ControlPanel,t,"graphicsOutlineMode",1)
		elseif val == 3 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",3)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",3)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",1)
			setcvar(ControlPanel,t,"graphicsViewDistance",3)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",3)
			setcvar(ControlPanel,t,"graphicsGroundClutter",3)
			setcvar(ControlPanel,t,"graphicsShadowQuality",1)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",2)
			setcvar(ControlPanel,t,"graphicsSunshafts",1)
			setcvar(ControlPanel,t,"graphicsParticleDensity",1)
			setcvar(ControlPanel,t,"graphicsSSAO",1)
			setcvar(ControlPanel,t,"graphicsDepthEffects",1)
			setcvar(ControlPanel,t,"graphicsLightingQuality",1)
			setcvar(ControlPanel,t,"graphicsOutlineMode",1)
		elseif val == 4 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",3)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",4)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",1)
			setcvar(ControlPanel,t,"graphicsViewDistance",4)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",4)
			setcvar(ControlPanel,t,"graphicsGroundClutter",4)
			setcvar(ControlPanel,t,"graphicsShadowQuality",2)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",2)
			setcvar(ControlPanel,t,"graphicsSunshafts",1)
			setcvar(ControlPanel,t,"graphicsParticleDensity",2)
			setcvar(ControlPanel,t,"graphicsSSAO",1)
			setcvar(ControlPanel,t,"graphicsDepthEffects",2)
			setcvar(ControlPanel,t,"graphicsLightingQuality",2)
			setcvar(ControlPanel,t,"graphicsOutlineMode",2)
		elseif val == 5 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",3)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",5)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",2)
			setcvar(ControlPanel,t,"graphicsViewDistance",5)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",5)
			setcvar(ControlPanel,t,"graphicsGroundClutter",5)
			setcvar(ControlPanel,t,"graphicsShadowQuality",3)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",2)
			setcvar(ControlPanel,t,"graphicsSunshafts",2)
			setcvar(ControlPanel,t,"graphicsParticleDensity",2)
			setcvar(ControlPanel,t,"graphicsSSAO",2)
			setcvar(ControlPanel,t,"graphicsDepthEffects",3)
			setcvar(ControlPanel,t,"graphicsLightingQuality",3)
			setcvar(ControlPanel,t,"graphicsOutlineMode",2)
		elseif val == 6 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",3)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",6)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",2)
			setcvar(ControlPanel,t,"graphicsViewDistance",6)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",6)
			setcvar(ControlPanel,t,"graphicsGroundClutter",6)
			setcvar(ControlPanel,t,"graphicsShadowQuality",4)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",3)
			setcvar(ControlPanel,t,"graphicsSunshafts",3)
			setcvar(ControlPanel,t,"graphicsParticleDensity",2)
			setcvar(ControlPanel,t,"graphicsSSAO",3)
			setcvar(ControlPanel,t,"graphicsDepthEffects",4)
			setcvar(ControlPanel,t,"graphicsLightingQuality",3)
			setcvar(ControlPanel,t,"graphicsOutlineMode",3)
		elseif val == 7 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",3)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",6)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",2)
			setcvar(ControlPanel,t,"graphicsViewDistance",7)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",7)
			setcvar(ControlPanel,t,"graphicsGroundClutter",7)
			setcvar(ControlPanel,t,"graphicsShadowQuality",4)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",3)
			setcvar(ControlPanel,t,"graphicsSunshafts",3)
			setcvar(ControlPanel,t,"graphicsParticleDensity",2)
			setcvar(ControlPanel,t,"graphicsSSAO",4)
			setcvar(ControlPanel,t,"graphicsDepthEffects",4)
			setcvar(ControlPanel,t,"graphicsLightingQuality",3)
			setcvar(ControlPanel,t,"graphicsOutlineMode",3)
		elseif val == 8 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",3)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",6)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",2)
			setcvar(ControlPanel,t,"graphicsViewDistance",8)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",8)
			setcvar(ControlPanel,t,"graphicsGroundClutter",8)
			setcvar(ControlPanel,t,"graphicsShadowQuality",5)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",4)
			setcvar(ControlPanel,t,"graphicsSunshafts",3)
			setcvar(ControlPanel,t,"graphicsParticleDensity",4)
			setcvar(ControlPanel,t,"graphicsSSAO",4)
			setcvar(ControlPanel,t,"graphicsDepthEffects",4)
			setcvar(ControlPanel,t,"graphicsLightingQuality",3)
			setcvar(ControlPanel,t,"graphicsOutlineMode",3)
		elseif val == 9 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",3)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",6)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",2)
			setcvar(ControlPanel,t,"graphicsViewDistance",9)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",9)
			setcvar(ControlPanel,t,"graphicsGroundClutter",9)
			setcvar(ControlPanel,t,"graphicsShadowQuality",6)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",4)
			setcvar(ControlPanel,t,"graphicsSunshafts",3)
			setcvar(ControlPanel,t,"graphicsParticleDensity",4)
			setcvar(ControlPanel,t,"graphicsSSAO",4)
			setcvar(ControlPanel,t,"graphicsDepthEffects",4)
			setcvar(ControlPanel,t,"graphicsLightingQuality",3)
			setcvar(ControlPanel,t,"graphicsOutlineMode",3)
		elseif val == 10 then
			setcvar(ControlPanel,t,"graphicsTextureResolution",3)
			setcvar(ControlPanel,t,"graphicsTextureFiltering",6)
			setcvar(ControlPanel,t,"graphicsProjectedTextures",2)
			setcvar(ControlPanel,t,"graphicsViewDistance",10)
			setcvar(ControlPanel,t,"graphicsEnvironmentDetail",10)
			setcvar(ControlPanel,t,"graphicsGroundClutter",10)
			setcvar(ControlPanel,t,"graphicsShadowQuality",6)
			setcvar(ControlPanel,t,"graphicsLiquidDetail",4)
			setcvar(ControlPanel,t,"graphicsSunshafts",3)
			setcvar(ControlPanel,t,"graphicsParticleDensity",4)
			setcvar(ControlPanel,t,"graphicsSSAO",4)
			setcvar(ControlPanel,t,"graphicsDepthEffects",4)
			setcvar(ControlPanel,t,"graphicsLightingQuality",3)
			setcvar(ControlPanel,t,"graphicsOutlineMode",3)
		end
	end

	if val < 4 then
		setcvar(ControlPanel,t,"weatherDensity",0)
	elseif val < 7 then
		setcvar(ControlPanel,t,"weatherDensity",1)
	elseif val < 10 then
		setcvar(ControlPanel,t,"weatherDensity",2)
	elseif val == 10 then
		setcvar(ControlPanel,t,"weatherDensity",3)
	end
end
