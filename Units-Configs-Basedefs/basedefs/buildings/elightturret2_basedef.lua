unitDef                     = {
	buildAngle                    = 2048,
	buildCostEnergy               = 0,
	buildCostMetal                = 55,
	builder                       = false,
	buildTime                     = 5,
	buildpic					  = "elightturret2.png",
	canAttack                     = true,
	canstop                       = "1",
	category                      = "BUILDING NOTAIR",
	collisionVolumeTest           = "1",
	description                   = [[Anti-Raid Defense Platform (Anti-Light) • Uses +]] .. supply .. [[ Supply]],
	energyStorage                 = 0,
	energyUse                     = 0,
	explodeAs                     = "mediumBuildingExplosionGeneric",
	footprintX                    = 4,
	footprintZ                    = 4,
	floater			              = true,
	idleAutoHeal                  = .5,
	idleTime                      = 2200,
	iconType                      = "turret_lit",
	maxDamage                     = 1250,
	maxSlope                      = 60,
	maxWaterDepth                 = 999999,
	metalStorage                  = 0,
	name                          = humanName,
	objectName                    = objectName,
	script						  = script,
	onlytargetcategory2           = "NOTAIR",
	onlytargetcategory3           = "NOTAIR",
	onlytargetcategory4           = "NOTAIR",
	onlytargetcategory5           = "NOTAIR",
	onlytargetcategory6           = "NOTAIR",
	radarDistance                 = 0,
	repairable		              = false,
	selfDestructAs                = "mediumBuildingExplosionGeneric",
	side                          = "CORE",
	sightDistance                 = 1000,
	smoothAnim                    = true,
	unitname                      = unitName,
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
		isupgraded			  	  = isUpgraded,
		unittype				  = "turret",
		RequireTech				  = tech,
		needed_cover              = 2,
		--supply_cost               = supply,
		death_sounds              = "generic",
		armortype                 = armortype,
		normaltex                 = "unittextures/lego2skin_explorernormal.dds", 
		buckettex                 = "unittextures/lego2skin_explorerbucket.dds",
		factionname	              = "outer_colonies",
		corpse                   = "energycore",
	},
	useGroundDecal                = true,
	BuildingGroundDecalType       = "factorygroundplate.dds",
	BuildingGroundDecalSizeX      = 6,
	BuildingGroundDecalSizeY      = 6,
	BuildingGroundDecalDecaySpeed = 0.9,
}

weaponDefs                  = {
	lighteweapon                  = {
		AreaOfEffect              = 25,
		avoidFeature              = false,
		avoidFriendly             = false,
		collideFeature            = false,
		collideFriendly           = false,
		craterBoost               = 0,
		craterMult                = 0,
		beamTTL					  = 10,
		explosionGenerator        = "custom:genericshellexplosion-medium-lightning",
		energypershot             = 0,
		edgeeffectiveness		  = 1,
		impulseBoost              = 0,
		impulseFactor             = 0,
		interceptedByShieldType   = 4,
		
		noSelfDamage              = true,
		range                     = 550,
		reloadtime                = 0.5,
		WeaponType                = "LightningCannon",
		rgbColor                  = "0.1 0.2 0.5",
		rgbColor2                 = "0 0 1",
		soundStart                = "weapons/lightning-metal-hit.wav",
		
		texture1                  = "lightning",
		thickness                 = 10,
		turret                    = true,
		weaponVelocity            = 400,
		customparams              = {
			isupgraded		  	 = isUpgraded,
			damagetype		      = "elightturret2",  
		},      
		damage                    = {
			default               = 25,
		},
	},
}