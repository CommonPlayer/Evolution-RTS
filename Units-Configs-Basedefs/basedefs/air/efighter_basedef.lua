unitDef                    = {
	acceleration                 = 0.5,
	airStrafe                    = false,
	airHoverFactor				 = 0,
	bankscale                    = "1",
	brakeRate                    = 1,
	buildCostEnergy              = 0,
	buildCostMetal               = 70,
	buildTime                    = 2.5,
	buildpic					 = "efighter.png",
	canAttack                    = true,
	canFly                       = true,
	canGuard                     = true,
	canLoopbackAttack            = true,
	canMove                      = true,
	canPatrol                    = true,
	canstop                      = "1",
	category                     = "LIGHT VTOL",
	collide                      = true,
	cruiseAlt                    = 75,
	description                  = [[Light Gunship • Uses +]] .. supply .. [[ Supply]],
	energyMake                   = 0,
	energyStorage                = 0,
	energyUse                    = 0,
	explodeAs                    = "mediumExplosionGenericWhite",
	footprintX                   = 5,
	footprintZ                   = 5,
	hoverAttack                  = true,
	floater                      = true,
	iconType                     = "air_lit",
	idleAutoHeal                 = .5,
	idleTime                     = 2200,
	maxAcc                       = 0.25,
	maxBank			             = 5,
	maxDamage                    = 406,
	maxSlope                     = 90,
	maxVelocity                  = 9,
	verticalSpeed		         = 15,
	maxWaterDepth                = 255,
	metalStorage                 = 0,
	moverate1                    = "8",
	name                         = humanName,
	objectName                   = objectName,
	script			             = script,
	radarDistance                = 0,
	repairable		             = false,
	selfDestructAs               = "mediumExplosionGenericWhite",
	side                         = "ARM",
	sightDistance                = 500,
	smoothAnim                   = true,
	sonarDistance                = 0,
	transportbyenemy             = false;
	turnRate                     = 5000,
	unitname                     = unitName,
	upright						 = true,
	workerTime                   = 0,
	sfxtypes                     = { 
		pieceExplosionGenerators = { 
			"deathceg3", 
			"deathceg4", 
		}, 

		explosiongenerators      = {
			"custom:gdhcannon",
			"custom:jethtrail",
			"custom:blacksmoke",
		},
	},
	sounds                       = {
		underattack              = "other/unitsunderattack1",
		ok                       = {
			"ack",
		},
		select                   = {
			"unitselect",
		},
	},
	weapons                      = {
		[1]                      = {
			def                  = "aircannon",
			badTargetCategory    = "ARMORED BUILDING VTOL",
		},
	},
	customParams                 = {
		unittype				 = "mobile",
		--    needed_cover       = 2,
		isupgraded               = isUpgraded,
		death_sounds             = "generic",
		RequireTech              = tech,
		armortype                = armortype,
		nofriendlyfire	         = "1",
		supply_cost              = supply,
		normaltex               = "unittextures/lego2skin_explorernormal.dds", 
		buckettex                = "unittextures/lego2skin_explorerbucket.dds",
		factionname	             = "outer_colonies",
		corpse                   = "energycore",
	},
}

weaponDefs                 = {
	aircannon   	             = {
		AreaOfEffect             = 25,
		avoidFriendly            = false,
		avoidFeature             = false,
		collideFriendly          = false,
		collideFeature           = false,	
		cegTag                   = "bruisercannon",
		explosionGenerator       = "custom:genericshellexplosion-small",
		energypershot            = 0,
		impulseFactor            = 0,
		interceptedByShieldType  = 4,
		name                     = unitName .. "Weapon",
		range                    = 400,
		reloadtime               = 0.5,
		size					 = 8,
		weaponType		         = "Cannon",
		soundstart               = "weapons/18379_inferno_hilas.wav",
		soundStart               = "weapons/triotfire.wav",
		tolerance                = 2000,
		turret                   = true,
		weaponVelocity           = 2000,
		customparams             = {
			damagetype		     = "efighter",
			isupgraded           = isUpgraded,
		}, 
		damage                   = {
			default              = 100,
		},
	},  
}
