-- UNITDEF -- ELIGHTTURRET2 --
--------------------------------------------------------------------------------

local unitName                    = "elightturret2"

--------------------------------------------------------------------------------

local armortype					 = [[building]]
--local supply					 = [[2]]

local techrequired				 = [[tech1]]

local weapon1Damage               = 100
local weapon1AOE				  = 1
local energycosttofire			 = weapon1Damage / 10 * ((weapon1AOE / 1000) + 1)

local function roundToFirstDecimal(energycosttofire)
    return math.floor(energycosttofire*10 + 0.5)*0.1
end

local buildCostMetal 			  = 100
local maxDamage					  = buildCostMetal * 12.5

local unitDef                     = {

	buildAngle                    = 2048,
	buildCostEnergy               = 0,
	buildCostMetal                = buildCostMetal,
	builder                       = false,
	buildTime                     = 5,
	canAttack                     = true,
	canstop                       = "1",
	category                      = "BUILDING NOTAIR",
	collisionVolumeTest           = "1",
	corpse                        = "ammobox",
	description                   = [[Anti-Raid Defense Platform (Anti-Light)]],
	energyStorage                 = 0,
	energyUse                     = 0,
	explodeAs                     = "mediumBuildingExplosionGeneric",
	footprintX                    = 4,
	footprintZ                    = 4,
	floater			              = true,
	idleAutoHeal                  = .5,
	idleTime                      = 2200,
	iconType                      = "turret_lit",
	maxDamage                     = maxDamage,
	maxSlope                      = 60,
	maxWaterDepth                 = 999999,
	metalStorage                  = 0,
	name                          = "Lightning Rod",
	objectName                    = "elightturret3.s3o",
	onlytargetcategory2           = "NOTAIR",
	onlytargetcategory3           = "NOTAIR",
	onlytargetcategory4           = "NOTAIR",
	onlytargetcategory5           = "NOTAIR",
	onlytargetcategory6           = "NOTAIR",
	radarDistance                 = 0,
	repairable		              = false,
	-- script			          = "elightturret2-script.lua",
	selfDestructAs                = "mediumBuildingExplosionGeneric",
	side                          = "CORE",
	sightDistance                 = 1000,
	smoothAnim                    = true,
	unitname                      = "elightturret2",
	workerTime                    = 0,
	yardMap                       = "oooo oooo oooo oooo",

	sfxtypes                      = { 
		pieceExplosionGenerators  = { 
			"deathceg3", 
			"deathceg4", 
		}, 

		explosiongenerators       = {
			"custom:electricity",
			"custom:needspower",
			"custom:blacksmoke",
		},
	},
	sounds                        = {
		underattack               = "other/unitsunderattack1",
		select                    = {
			"other/turretselect",
		},
	},
	weapons                       = {
		[1]                       = {
			def                   = "lighteweapon",
			badTargetCategory     = "VTOL ARMORED",
			onlyTargetCategory    = "BIO LIGHT VTOL ARMORED",
		},
	},
	customParams                  = {
		unittype				  = "turret",
		RequireTech				  = techrequired,
		needed_cover              = 2,
		--supply_cost               = supply,
		death_sounds              = "generic",
		armortype                 = armortype,
		normaltex                 = "unittextures/lego2skin_explorernormal.dds", 
		buckettex                 = "unittextures/lego2skin_explorerbucket.dds",
		factionname	              = "outer_colonies",  
		helptext                  = [[Armortype: ]] ..armortype.. [[ 

Energy cost to fire: ]] .. roundToFirstDecimal(energycosttofire),
	},
	useGroundDecal                = true,
	BuildingGroundDecalType       = "factorygroundplate.dds",
	BuildingGroundDecalSizeX      = 6,
	BuildingGroundDecalSizeY      = 6,
	BuildingGroundDecalDecaySpeed = 0.9,
}


--------------------------------------------------------------------------------
-- Energy Per Shot Calculation is: dmg / 20 * ((aoe / 1000) + 1)

local weaponDefs                  = {
	lighteweapon                  = {
		AreaOfEffect              = weapon1AOE,
		avoidFeature              = false,
		avoidFriendly             = false,
		collideFeature            = false,
		collideFriendly           = false,
		craterBoost               = 0,
		craterMult                = 0,
		beamTTL					  = 10,
		explosionGenerator        = "custom:genericshellexplosion-medium-lightning",
		energypershot             = energycosttofire,
		impulseBoost              = 0,
		impulseFactor             = 0,
		interceptedByShieldType   = 4,
		
		noSelfDamage              = true,
		range                     = 1000,
		reloadtime                = 1,
		WeaponType                = "LightningCannon",
		rgbColor                  = "0.1 0.2 0.5",
		rgbColor2                 = "0 0 1",
		soundStart                = "weapons/jacobs.wav",
		
		texture1                  = "lightning",
		thickness                 = 10,
		turret                    = true,
		weaponVelocity            = 400,
		customparams              = {
			damagetype		      = "elightturret2",  
		},      
		damage                    = {
			default               = weapon1Damage,
		},
	},
}
unitDef.weaponDefs                = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName]     = unitDef })

--------------------------------------------------------------------------------
