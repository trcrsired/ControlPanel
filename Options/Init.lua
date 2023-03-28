local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")
local ControlPanel = AceAddon:GetAddon("ControlPanel")
local ControlPanel_Options = AceAddon:NewAddon("ControlPanel_Options")

ControlPanel_Options.option_table =
{
	type = "group",
	name = "ControlPanel",
	args = {}
}

local order = 0
local function get_order()
	local temp = order
	order = order +1
	return temp
end

function ControlPanel_Options : push(key,val)
	val.order = get_order()
	self.option_table.args[key] = val
end

function ControlPanel_Options : get_table()
	return self.option_table
end

local GetCVarBool = GetCVarBool
local tonumber = tonumber
local GetCVar = GetCVar

function ControlPanel_Options.get_cvar_bool(c)
	if GetCVarBool(c) then
		return true
	else
		return false
	end
end

function ControlPanel_Options.get_cvar_number(c)
	return tonumber(GetCVar(c))
end

function ControlPanel_Options.set_function_common(info,val)
	SetCVar(info[#info],val)
end

function ControlPanel_Options.set_function_number_common(info,val)
	SetCVar(info[#info],tostring(val))
end

function ControlPanel_Options.get_bool_function_common(info)
	return GetCVarBool(info[#info])
end

function ControlPanel_Options.get_bool_function_common_not(info)
	return not GetCVarBool(info[#info])
end

function ControlPanel_Options.get_function_common(info)
	return GetCVar(info[#info])
end

function ControlPanel_Options.get_function_number_common(info)
	local val = GetCVar(info[#info])
	local tp = type(val)
	if tp=="string" then
		return tonumber(val)
	elseif tp == "number" then
		return val
	end
	return 0
end

function ControlPanel_Options.create_bool_config(nm,des)
	if nm == nil then
		return
	end
	return {
		name = nm,
		desc = des,
		type = "toggle",
		set = ControlPanel_Options.set_function_common,
		get = ControlPanel_Options.get_bool_function_common,
		width = "full",
	}
end

function ControlPanel_Options.create_bool_config_not(nm,des)
	if nm == nil then
		return
	end
	return {
		name = nm,
		desc = des,
		type = "toggle",
		set = ControlPanel_Options.set_function_common,
		get = ControlPanel_Options.get_bool_function_common_not,
		width = "full",
	}
end

function ControlPanel_Options.create_range_config(nm,dsc,minval,maxval,stepval)
	if nm == nil then
		return
	end
	if minval == nil or maxval == nil then
		return
		{
			name = nm,
			desc = dsc,
			type = "input",
			set = function(info,val)
				local t = tonumber(val)
				if t then
					if minval ~= nil then
						if t < minval then
							return
						end
					end
					if maxval ~= nil then
						if maxval < t then
							return
						end
					end
					SetCVar(info[#info],t)
				end
			end,
			get = ControlPanel_Options.get_function_common,
			width = "full",
		}
	end
	return {
		name = nm,
		desc = dsc,
		type = "range",
		min = minval,
		max = maxval,
		set = ControlPanel_Options.set_function_common,
		get = ControlPanel_Options.get_function_number_common,
		width = "full",
		step = stepval
	}
end

function ControlPanel_Options.clone_table(t1)
	local t = {}
	for k,v in pairs(t1) do
		t[k] = v
	end
	return t
end

function ControlPanel_Options.get_bool_function_instance(info)
	return ControlPanel:GetCVarBoolInstance(info[1],info[#info])
end

function ControlPanel_Options.set_function_instance(info,val)
	ControlPanel:SetCVarInstance(info[1],info[#info],val)
end

function ControlPanel_Options.create_bool_config_instance_width(nm,des,wdh)
	if nm == nil then
		return
	end
	return {
		name = nm,
		desc = des,
		type = "toggle",
		set = ControlPanel_Options.set_function_instance,
		get = ControlPanel_Options.get_bool_function_instance,
		width = wdh,
	}
end

function ControlPanel_Options.create_bool_config_instance(nm,des)
	return ControlPanel_Options.create_bool_config_instance_width(nm,des,"full")
end

function ControlPanel_Options.get_function_number_instance(info)
	local val = ControlPanel:GetCVarInstance(info[1],info[#info])
	local tp = type(val)
	if tp=="string" then
		return tonumber(val)
	elseif tp == "number" then
		return val
	end
	return 0
end

function ControlPanel_Options.get_function_instance(info)
	return ControlPanel:GetCVarInstance(info[1],info[#info])
end

function ControlPanel_Options.create_range_config_instance_width(nm,dsc,minval,maxval,stepval,wdt)
	if nm == nil then
		return
	end
	if minval == nil or maxval == nil then
		return
		{
			name = nm,
			desc = dsc,
			type = "input",
			set = function(info,val)
				local t = tonumber(val)
				if t then
					if minval ~= nil then
						if t < minval then
							return
						end
					end
					if maxval ~= nil then
						if maxval < t then
							return
						end
					end
					ControlPanel:SetCVarInstance(info[1],info[#info],t)
				end
			end,
			get = ControlPanel_Options.get_function_number_instance,
			width = wdt,
		}
	end
	return {
		name = nm,
		desc = dsc,
		type = "range",
		min = minval,
		max = maxval,
		set = ControlPanel_Options.set_function_instance,
		get = ControlPanel_Options.get_function_number_instance,
		width = wdt,
		step = stepval
	}
end

function ControlPanel_Options.create_range_config_instance(nm,dsc,minval,maxval,stepval)
	return ControlPanel_Options.create_range_config_instance_width(nm,dsc,minval,maxval,stepval,"full")
end

function ControlPanel_Options.create_select_config_instance_width(nm,dsc,vls,wdt)
	if nm == nil then
		return
	end
	return {
		name = nm,
		desc = dsc,
		type = "select",
		set = ControlPanel_Options.set_function_instance,
		get = ControlPanel_Options.get_function_instance,
		width = wdt,
		values = vls
	}
end

function ControlPanel_Options.create_select_config_instance(nm,dsc,vls)
	return ControlPanel_Options.create_select_config_instance_width(nm,dsc,vls,"full")
end

local function setzerostartcvarinstance(info,val)
	ControlPanel:SetCVarInstance(info[1],info[#info],val-1)
end

local function getzerostartcvarinstance(info,val)
	return ControlPanel:GetCVarInstance(info[1],info[#info])+1
end

function ControlPanel_Options.create_select_config_instance_width_zero_start(nm,dsc,vls,wdt)
	if nm == nil then
		return
	end
	return {
		name = nm,
		desc = dsc,
		type = "select",
		set = setzerostartcvarinstance,
		get = getzerostartcvarinstance,
		width = wdt,
		values = vls
	}
end
