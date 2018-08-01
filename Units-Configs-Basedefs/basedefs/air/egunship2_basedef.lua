unitDef                    = {
	acceleration                 = 0.5,
	airStrafe                    = true,
	airHoverFactor				 = 0,
	brakeRate                    = 0.7,
	buildCostEnergy              = 0,
	buildCostMetal               = 38,
	buildTime                    = 2.5,
	buildpic					 = "egunship2.png",
	canAttack                    = true,
	canDropFlare                 = false,
	canFly                       = true,
	canGuard                     = true,
	canLoopbackAttack            = true,
	canMove                      = true,
	canPatrol                    = true,
	canstop                      = true,
	category                     = "LIGHT VTOL",
	collide                      = true,
	cruiseAlt                    = 75,
	description                  = [[Anti-Armor Drone • Uses +]] .. supply .. [[ Supply]],
	energyMake                   = 0,
	energyStorage                = 0,
	energyUse                    = 0,
	explodeAs                    = "mediumExplosionGenericRed",
	flareDelay                   = 0.1,
	flareDropVector              = "0 0 -1",
	flareefficieny               = "0.3",
	flareReload                  = 3,
	floater                      = true,
	footprintX                   = 4,
	footprintZ                   = 4,
	hoverAttack                  = true,
	iconType                     = "air_arm",
	idleAutoHeal                 = .5,
	idleTime                     = 2200,
	maxDamage                    = 930,
	maxSlope                     = 90,
	maxVelocity                  = 9,
	--verticalSpeed		         = 15,
	maxWaterDepth                = 0,
	metalStorage                 = 0,
	moverate1                    = "8",
	name                         = humanName,
	objectName                   = objectName,
	script			             = script,
	radarDistance                = 0,
	repairable		             = false,
	selfDestructAs               = "mediumExplosionGenericRed",
	side                         = "CORE",
	sightDistance                = 800,
	smoothAnim                   = true,
	transportbyenemy             = false;
	turnRate                     = 5000,
	unitname                     = unitName,
	upright						 = true,
	sfxtypes                     = { 
		pieceExplosionGenerators = { 
			"deathceg3", 
			"deathceg4", 
		}, 

		explosiongenerators      = {
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
			def                  = "gunshipweapon",
			mainDir              = "0 0 1",
			maxAngleDif          = 180,
			BadTargetCategory    = "LIGHT BUILDING WALL",
			noChaseCategory      = "VTOL",
		},
	},
	customParams                 = {
		unittype				  = "mobile",
		--    needed_cover       = 2,
		isupgraded               = isUpgraded,
		canareaattack            ="1",
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

	gunshipweapon             = {
		AreaOfEffect             = 25,
		avoidFeature             = false,
		avoidFriendly            = false,
		collideFeature           = false,
		collideFriendly          = false,
		coreThickness            = 0.5,
		beamTime                 = 0.1,
		beamTTL					 = 10,
		beamDecay				 = 1,
		burnblow		         = true,
		largeBeamLaser           = true,
		laserflaresize 	         = 7,
		minIntensity			 = 1,
		--cegTag                   = "railgun",
		duration                 = 0.6,
		edgeeffectiveness		 = 1,
		energypershot            = 0,
		explosionGenerator       = "custom:genericshellexplosion-small-sparks-burn",
		fallOffRate              = 0.1,
		fireStarter              = 50,
		impulseFactor            = 0,
		fallOffRate				 = 0,
		interceptedByShieldType  = 4,
		minintensity             = 1,
		name                     = unitName .. "Weapon",
		range                    = 200,
		reloadtime               = 1,
		WeaponType               = "BeamLaser",
		waterweapon				 = true,
		rgbColor                 = "1 0.5 0",
		rgbColor2                = "1 1 1",
		soundTrigger             = true,
		soundstart               = "weapons/egunship2laser.wav",
		--soundHit                 = "explosions/artyhit.wav",
		texture1                  = "lightning",
		texture2                  = "laserend",
		thickness                = 9,
		tolerance                = 10000,
		turret                   = true,
		weaponVelocity           = 750,
		customparams             = {
			isupgraded           = isUpgraded,
			damagetype		     = "egunship2",  
		},      
		damage                   = {
			default              = 150,
		},
	},
}
