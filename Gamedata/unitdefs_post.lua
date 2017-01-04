--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local modOptions
if (Spring.GetModOptions) then
  modOptions = Spring.GetModOptions()
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Utility
--

local function tobool(val)
  local t = type(val)
  if (t == 'nil') then
    return false
  elseif (t == 'boolean') then
    return val
  elseif (t == 'number') then
    return (val ~= 0)
  elseif (t == 'string') then
    return ((val ~= '0') and (val ~= 'false'))
  end
  return false
end


local function disableunits(unitlist)
  for name, ud in pairs(UnitDefs) do
    if (ud.buildoptions) then
      for _, toremovename in ipairs(unitlist) do
        for index, unitname in pairs(ud.buildoptions) do
          if (unitname == toremovename) then
            table.remove(ud.buildoptions, index)
          end
        end
      end
    end
  end
end

--------------------------------------------------------------------------------
-- Gameplay Speed (Classic RTS Mode) --
--------------------------------------------------------------------------------

local gamePlaySpeed = modOptions.gameplayspeed or "veryslow"

Spring.Echo("[Gameplay Speed] Set to " .. gamePlaySpeed)

for id,unitDef in pairs(UnitDefs) do
	unitDef.buildtime = unitDef.buildcostmetal / 4
end

if gamePlaySpeed == "veryslow" then
	for id,unitDef in pairs(UnitDefs) do
		if unitDef.maxvelocity then
			unitDef.maxvelocity = unitDef.maxvelocity * 0.5
		end
		if unitDef.buildcostmetal then
			unitDef.buildcostmetal = unitDef.buildcostmetal * 1.5
		end
	end
end

if gamePlaySpeed == "slow" then
	for id,unitDef in pairs(UnitDefs) do
		if unitDef.maxvelocity then
			unitDef.maxvelocity = unitDef.maxvelocity * 0.75
		end
		if unitDef.buildcostmetal then
			unitDef.buildcostmetal = unitDef.buildcostmetal * 1.25
		end
	end
end

if gamePlaySpeed == "fast" then
	for id,unitDef in pairs(UnitDefs) do
--	Spring.Echo(unitDef.buildcostmetal)
		unitDef.buildtime = 5
	end
end

--Set reverse velocity automatically
for id,unitDef in pairs(UnitDefs) do
	if unitDef.maxreversevelocity then
		unitDef.maxreversevelocity = unitDef.maxvelocity * 0.8
	end
end

--Override groundplate used
for id,unitDef in pairs(UnitDefs) do
	if unitDef.usegrounddecal == true then
		unitDef.buildinggrounddecaltype = "groundplate.dds"
	end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 3dbuildrange for all none plane builders
--
--[[
for name, ud in pairs(UnitDefs) do
  if (tobool(ud.isBuilder) and not tobool(ud.canfly)) then
    ud.buildrange3d = true
  end
end
--]]

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- turn off unit collision check for planes
--

for name, ud in pairs(UnitDefs) do
  if (tobool(ud.canfly) and not tobool(ud.istransport)) then
    ud.collide = false
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Calculate mincloakdistance based on unit footprint size
--

local sqrt = math.sqrt

for name, ud in pairs(UnitDefs) do
  if (not ud.mincloakdistance) then
    local fx = ud.footprintx and tonumber(ud.footprintx) or 1
    local fz = ud.footprintz and tonumber(ud.footprintz) or 1
    local radius = 8 * sqrt((fx * fx) + (fz * fz))
    ud.mincloakdistance = (radius + 48)
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Spring Kludge Removal
-- 
for name, ud in pairs(UnitDefs) do
	ud.activateWhenBuilt  = true 
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Festive units mod option (CarRepairer's WIP)
-- 
--[[
if modOptions and tobool(modOptions.xmasunits) then
	for name, ud in pairs(UnitDefs) do
		local unitname = ud.unitname
		if unitname == "armcom" or unitname == "armcomlite" then
			--ud.object = 
		elseif unitname == "armdrag" or unitname == "cordrag" then
			ud.objectname = "christmastree_dt.S3O"
			ud.featuredefs.dead.object = "christmastree_dt.S3O"
			
		elseif unitname == "armthund" or unitname == "corshad" then
			ud.weapondefs.armbomb.model = "present_bomb1.s3o"
		elseif unitname == "armpnix" then
			ud.weapondefs.armadvbomb.model = "present_bomb2.s3o"
		elseif unitname == "armcybr" then
			ud.weapondefs.arm_pidr.model = "present_bomb3.s3o"
		elseif unitname == "corhurc" then
			ud.weapondefs.coradvbomb.model = "present_bomb2.s3o"
		elseif unitname == "corclog" then
			ud.objectname = "core_christmas_clogger.s3o"
			ud.featuredefs.dead.object = "christmastree_dt.S3O"
		end

	end --for
end
--]]


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- fix customParams table
--
--[[
for name, ud in pairs(UnitDefs) do
  if (ud.customparams and not ud.customParams) then
    ud.customParams = ud.customparams
    ud.customparams = nil
  end
end
--]]

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--Recursive Table Reader

	-- local function recursiveTableReader(currTable, dashes)
		-- dashes = dashes .. "   "
		-- if type(currTable) == 'table' then
			-- for k,v in pairs(currTable) do
				-- if (v ~= nil) then
					-- Spring.Echo(dashes .. "[" .. k .. "]")
					-- recursiveTableReader(v, dashes)
				-- end
			-- end
		-- else
			-- if (currTable ~= nil) then
				-- Spring.Echo(dashes .. tostring(currTable) )
			-- end
		-- end
	-- end
	-- recursiveTableReader(UnitDefs, "DEF ")