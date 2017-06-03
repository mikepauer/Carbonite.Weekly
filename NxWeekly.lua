---------------------------------------------------------------------------------------
-- Carbonite - Addon for World of Warcraft(tm)
-- NxWeekly - Weekly Objective Tracker
-- Copyright 2013-2014 Rytal
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
---------------------------------------------------------------------------------------

local _G = getfenv(0)

CarboniteWeekly = LibStub("AceAddon-3.0"):NewAddon("CarboniteWeekly","AceEvent-3.0","AceComm-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("Carbonite.Weekly", true)

Nx.VERSIONWeek			= .1				-- Warehouse data

local defaults = {
	profile = {
		Weekly = {
			ResetDate = 1,
			SecondsToReset = 0,
		},
		Track = {
			Mob = {
				Sha = true,
				Galleon = true,
				Nalak = true,
				Oondasta = true,
				Celestials = true,
				Ordos = true,
				Tarlna = true,
				Drov = true,
				Rukhmar = true,
			},
			Loot = {
			},
			Quest = {
				Chamberlain = true,
				TemperedFateSeals = true,
				GarrisonInvasion = true,
			},
			Raids = {
				MSV = true,
				HoF = true,
				TeS = true,
				ToTS = true,
				SoO = true,
				Highmaul = true,
				BRF = true,
			},
			RaidLevels = {
				LFR = true,
				Norm = true,
				Heroic = true,
				Mythic = true,
			},
		},
	},
}

Nx.Weekly = {}

local weeklyopts
local function WeeklyOptions()
	if not weeklyopts then
		weeklyopts = {
			type = "group",
			name = L["Weekly Status Options"],
			childGroups	= "tab",
			args = {
				general = {
					order = 1,
					type = "group",
					name = L["General"],
					args = {
						dateset = {
							order = 1,
							type = "select",
							name = L["Day Reset Occurs"],
							get = function()
								local num = Nx.wkdb.profile.Weekly.ResetDate
								return num
							end,
							set = function(info,name)
								Nx.wkdb.profile.Weekly.ResetDate = name
							end,
							values = function()
								return {L["Tuesday"],L["Wednesday"],L["Thursday"]}
							end,
						},
					},
				},
				Mobs = {
					order = 2,
					type = "group",
					name = L["Mobs"],
					args = {
						WodMobs = {
							order = 1,
							type = "group",
							name = L["WoD"],
							args = {
								mdesc = {
									order = 1,
									type = "description",
									name = L["Place check boxes in the mobs you wish to track weekly kills."],
									-- Tarlna the Ageless
									-- Drov the Ruiner
									-- Rukhmar
								},
								tarlna = {
									order = 2,
									type = "toggle",
									width = "full",
									name = L["Tarlna the Ageless"],
									get = function()
										return Nx.wkdb.profile.Track.Mob.Tarlna
									end,
									set = function()
										Nx.wkdb.profile.Track.Mob.Tarlna = not Nx.wkdb.profile.Track.Mob.Tarlna
									end,
								},
								drov = {
									order = 3,
									type = "toggle",
									width = "full",
									name = L["Drov the Ruiner"],
									get = function()
										return Nx.wkdb.profile.Track.Mob.Drov
									end,
									set = function()
										Nx.wkdb.profile.Track.Mob.Drov = not Nx.wkdb.profile.Track.Mob.Drov
									end,
								},
								ruk = {
									order = 4,
									type = "toggle",
									width = "full",
									name = L["Rukhmar"],
									get = function()
										return Nx.wkdb.profile.Track.Mob.Rukhmar
									end,
									set = function()
										Nx.wkdb.profile.Track.Mob.Rukhmar = not Nx.wkdb.profile.Track.Mob.Rukhmar
									end,
								},
							},
						},
						MopMobs = {
							order = 2,
							type = "group",
							name = L["MoP"],
							args = {
								mdesc = {
									order = 1,
									type = "description",
									name = L["Place check boxes in the mobs you wish to track weekly kills."],
								},
								sha = {
									order = 2,
									type = "toggle",
									width = "full",
									name = L["Sha of Anger"],
									get = function()
										return Nx.wkdb.profile.Track.Mob.Sha
									end,
									set = function()
										Nx.wkdb.profile.Track.Mob.Sha = not Nx.wkdb.profile.Track.Mob.Sha
									end,
								},
								galleon = {
									order = 3,
									type = "toggle",
									width = "full",
									name = L["Galleon"],
									get = function()
										return Nx.wkdb.profile.Track.Mob.Galleon
									end,
									set = function()
										Nx.wkdb.profile.Track.Mob.Galleon = not Nx.wkdb.profile.Track.Mob.Galleon
									end,
								},
								nalak = {
									order = 4,
									type = "toggle",
									width = "full",
									name = L["Nalak, The Storm Lord"],
									get = function()
										return Nx.wkdb.profile.Track.Mob.Nalak
									end,
									set = function()
										Nx.wkdb.profile.Track.Mob.Nalak = not Nx.wkdb.profile.Track.Mob.Nalak
									end,
								},
								oondasta = {
									order = 5,
									type = "toggle",
									width = "full",
									name = L["Oondasta"],
									get = function()
										return Nx.wkdb.profile.Track.Mob.Oondasta
									end,
									set = function()
										Nx.wkdb.profile.Track.Mob.Oondasta = not Nx.wkdb.profile.Track.Mob.Oondasta
									end,
								},
								celestials = {
									order = 6,
									type = "toggle",
									width = "full",
									name = L["Celestials"],
									get = function()
										return Nx.wkdb.profile.Track.Mob.Celestials
									end,
									set = function()
										Nx.wkdb.profile.Track.Mob.Celestials = not Nx.wkdb.profile.Track.Mob.Celestials
									end,
								},
								ordos = {
									order = 7,
									type = "toggle",
									width = "full",
									name = L["Ordos"],
									get = function()
										return Nx.wkdb.profile.Track.Mob.Ordos
									end,
									set = function()
										Nx.wkdb.profile.Track.Mob.Ordos = not Nx.wkdb.profile.Track.Mob.Ordos
									end,
								},
							},
						},
					},
				},
				Loot = {
					order = 3,
					type = "group",
					name = L["Lootables"],
					args = {
						WodLoot = {
							order = 1,
							type = "group",
							name = "WoD",
							args = {
								ldesc = {
									order = 1,
									type = "description",
									name = L["Place check boxes in the weekly drops you wish to track."],
								},
							},
						},
						MopLoot = {
							order = 2,
							type = "group",
							name = "MoP",
							args = {
								ldesc = {
									order = 1,
									type = "description",
									name = L["Place check boxes in the weekly drops you wish to track."],
								},
								ritual = {
									order = 2,
									type = "toggle",
									width = "full",
									name = L["Shan'ze Ritual Stone"],
									get = function()
										return Nx.wkdb.profile.Track.Loot.Ritual
									end,
									set = function()
										Nx.wkdb.profile.Track.Loot.Ritual = not Nx.wkdb.profile.Track.Loot.Ritual
									end,
								},
								lootkey = {
									order = 3,
									type = "toggle",
									width = "full",
									name = L["Lei Shen Palace Key"],
									get = function()
										return Nx.wkdb.profile.Track.Loot.LootKey
									end,
									set = function()
										Nx.wkdb.profile.Track.Loot.LootKey = not Nx.wkdb.profile.Track.Loot.LootKey
									end,
								},
								ochest = {
									order = 4,
									type = "toggle",
									width = "full",
									name = L["Thunder King Trove"],
									get = function()
										return Nx.wkdb.profile.Track.Loot.OutdoorChest
									end,
									set = function()
										Nx.wkdb.profile.Track.Loot.OutdoorChest = not Nx.wkdb.profile.Track.Loot.OutdoorChest
									end,
								},
							},
						},
					},
				},
				Quests = {
					order = 4,
					type = "group",
					name = L["Quests"],
					args = {
						WodQuests = {
							order = 1,
							type = "group",
							name = L["WoD"],
							args = {
								qdesc = {
									order = 1,
									type = "description",
									name = L["Place check boxes in the weekly quests you want to track."],
								},
								temperedfate = {
									order = 2,
									type = "toggle",
									width = "full",
									name = L["Tempered Fate Seals"],
									get = function()
										return Nx.wkdb.profile.Track.Quest.TemperedFateSeals
									end,
									set = function()
										Nx.wkdb.profile.Track.Quest.TemperedFateSeals = not Nx.wkdb.profile.Track.Quest.TemperedFateSeals
									end,
								},
								garrinv = {
									order = 3,
									type = "toggle",
									width = "full",
									name = L["Garrison Invasion"],
									get = function()
										return Nx.wkdb.profile.Track.Quest.GarrisonInvasion
									end,
									set = function()
										Nx.wkdb.profile.Track.Quest.GarrisonInvasion = not Nx.wkdb.profile.Track.Quest.GarrisonInvasion
									end,
								},
							},
						},
						MopQuests = {
							order = 2,
							type = "group",
							name = "MoP",
							args = {
								qdesc = {
									order = 1,
									type = "description",
									name = L["Place check boxes in the weekly quests you want to track."],
								},
								chamberlain = {
									order = 2,
									type = "toggle",
									width = "full",
									name = L["The Crumbled Chamberlain"],
									get = function()
										return Nx.wkdb.profile.Track.Quest.Chamberlain
									end,
									set = function()
										Nx.wkdb.profile.Track.Quest.Chamberlain = not Nx.wkdb.profile.Track.Quest.Chamberlain
									end,
								},
							},
						},
					},
				},
				Raids = {
					order = 5,
					type = "group",
					name = "Raids",
					args = {
						Difficulties = {
							order = 1,
							type = "group",
							name = "Difficulties",
							args = {
								rdesc = {
									order = 1,
									type = "description",
									name = L["Place check boxes in the difficulties you want to track."],
								},
								LFR = {
									order = 2,
									type = "toggle",
									width = "full",
									name = L["LFR"],
									get = function()
										return Nx.wkdb.profile.Track.RaidLevels.LFR
									end,
									set = function()
										Nx.wkdb.profile.Track.RaidLevels.LFR = not Nx.wkdb.profile.Track.RaidLevels.LFR
									end,
								},
								Normal = {
									order = 3,
									type = "toggle",
									width = "full",
									name = L["Normal"],
									get = function()
										return Nx.wkdb.profile.Track.RaidLevels.Norm
									end,
									set = function()
										Nx.wkdb.profile.Track.RaidLevels.Norm = not Nx.wkdb.profile.Track.RaidLevels.Norm
									end,
								},
								Heroic = {
									order = 4,
									type = "toggle",
									width = "full",
									name = L["Heroic"],
									get = function()
										return Nx.wkdb.profile.Track.RaidLevels.Heroic
									end,
									set = function()
										Nx.wkdb.profile.Track.RaidLevels.Heroic = not Nx.wkdb.profile.Track.RaidLevels.Heroic
									end,
								},
								Mythic = {
									order = 5,
									type = "toggle",
									width = "full",
									name = L["Mythic"],
									get = function()
										return Nx.wkdb.profile.Track.RaidLevels.Mythic
									end,
									set = function()
										Nx.wkdb.profile.Track.RaidLevels.Mythic = not Nx.wkdb.profile.Track.RaidLevels.Mythic
									end,
								},
							},
						},
						MopRaids = {
							order = 2,
							type = "group",
							name = "MoP",
							args = {
								rdesc = {
									order = 1,
									type = "description",
									name = L["Place check boxes in the raid progress you want to track."],
								},
								MSV = {
									order = 2,
									type = "toggle",
									width = "full",
									name = L["Mogu'shan Vaults"],
									get = function()
										return Nx.wkdb.profile.Track.Raids.MSV
									end,
									set = function()
										Nx.wkdb.profile.Track.Raids.MSV = not Nx.wkdb.profile.Track.Raids.MSV
									end,
								},
								HoF = {
									order = 3,
									type = "toggle",
									width = "full",
									name = L["Heart of Fear"],
									get = function()
										return Nx.wkdb.profile.Track.Raids.HoF
									end,
									set = function()
										Nx.wkdb.profile.Track.Raids.HoF = not Nx.wkdb.profile.Track.Raids.HoF
									end,
								},
								TeS = {
									order = 4,
									type = "toggle",
									width = "full",
									name = L["Terrace of Endless Spring"],
									get = function()
										return Nx.wkdb.profile.Track.Raids.TeS
									end,
									set = function()
										Nx.wkdb.profile.Track.Raids.TeS = not Nx.wkdb.profile.Track.Raids.TeS
									end,
								},
								ToTS = {
									order = 5,
									type = "toggle",
									width = "full",
									name = L["Throne of Thunder"],
									get = function()
										return Nx.wkdb.profile.Track.Raids.ToTS
									end,
									set = function()
										Nx.wkdb.profile.Track.Raids.ToTS = not Nx.wkdb.profile.Track.Raids.ToTS
									end,
								},
								SoO = {
									order = 6,
									type = "toggle",
									width = "full",
									name = L["Siege of Orgrimmar"],
									get = function()
										return Nx.wkdb.profile.Track.Raids.SoO
									end,
									set = function()
										Nx.wkdb.profile.Track.Raids.SoO = not Nx.wkdb.profile.Track.Raids.SoO
									end,
								},
							},
						},
						WodRaids = {
							order = 3,
							type = "group",
							name = "WoD",
							args = {
								rdesc = {
									order = 1,
									type = "description",
									name = L["Place check boxes in the raid progress you want to track."],
								},
								Highmaul = {
									order = 2,
									type = "toggle",
									width = "full",
									name = L["Highmaul"],
									get = function()
										return Nx.wkdb.profile.Track.Raids.Highmaul
									end,
									set = function()
										Nx.wkdb.profile.Track.Raids.Highmaul = not Nx.wkdb.profile.Track.Raids.Highmaul
									end,
								},
								BRF = {
									order = 3,
									type = "toggle",
									width = "full",
									name = L["Blackrock Foundry"],
									get = function()
										return Nx.wkdb.profile.Track.Raids.BRF
									end,
									set = function()
										Nx.wkdb.profile.Track.Raids.BRF = not Nx.wkdb.profile.Track.Raids.BRF
									end,
								},
							},
						},
					},
				},
			},
		}
	end
	Nx.Opts:AddToProfileMenu(L["Weekly"],6,Nx.wkdb)
	return weeklyopts
end

function CarboniteWeekly:OnInitialize()
	if not Nx.Initialized then
		CarbWeeklyInit = Nx:ScheduleTimer(CarboniteWeekly.OnInitialize,1)
		return
	end
	Nx.wkdb = LibStub("AceDB-3.0"):New("NXWeek",defaults, true)
	Nx.Weekly:ConvertData()
	Nx.Weekly:Init()
	Nx.Weekly:Login()
	local function func ()
		Nx.Weekly:ToggleShow()
	end
	Nx.NXMiniMapBut.Menu:AddItem(0, L["Show Weekly Objectives"], func, Nx.NXMiniMapBut)

	CarboniteWeekly:RegisterEvent("PLAYER_LOGIN", "EventHandler")
	CarboniteWeekly:RegisterEvent("PLAYER_LOGOUT", "EventHandler")
	Nx.Button.TypeData["MapWeekly"] = {
		Up = "$Achievement_Faction_craftsman",
		SizeUp = 22,
		SizeDn = 22,
	}

	tinsert (Nx.BarData,{"MapWeekly", L["-Weekly Tracker-"], Nx.Weekly.OnButToggleWeekly, false })
	Nx.Map.Maps[1]:CreateToolBar()
	local resettime = Nx.Weekly:CalcEpoch()
	if resettime > Nx.wkdb.profile.Weekly.SecondsToReset then
		Nx.wkdb.profile.Weekly.SecondsToReset = resettime + Nx.Weekly:CalcReset()
		Nx.Weekly:Reset()
	end
	Nx:AddToConfig("Weekly Status Module",WeeklyOptions(),L["Weekly Status Module"])
	tinsert(Nx.BrokerMenuTemplate,{ text = L["Toggle Weekly List"], func = function() Nx.Weekly:ToggleShow() end })
	Nx.Weekly.WhichExpansion = 1
end

function CarboniteWeekly:EventHandler(event, arg1, arg2, arg3)
	if event == "PLAYER_LOGIN" or event == "PLAYER_LOGOUT" then
		Nx.Weekly:Login(event,arg1)
	else
		Nx.prt("ERROR: Event " .. event .. " triggered without function.")
	end
end

function Nx.Weekly:Init()
	local week = Nx.wkdb.profile.WeeklyData
	if not week or week.Version < Nx.VERSIONWeek then
		if week then
			Nx.prt ("Reset old weekly data %f", week.Version)
		end
		week = {}
		Nx.wkdb.profile.WeeklyData = week
		week.Version = Nx.VERSIONWeek
	end
	self.ClassIcons = {
		["Druid"] = "Ability_Druid_Maul",
		["Hunter"] = "INV_Weapon_Bow_07",
		["Mage"] = "INV_Staff_13",
		["Paladin"] = "INV_Hammer_01",
		["Priest"] = "INV_Staff_30",
		["Rogue"] = "INV_ThrowingKnife_04",
		["Shaman"] = "Spell_Nature_BloodLust",
		["Warlock"] = "Spell_Nature_FaerieFire",
		["Warrior"] = "INV_Sword_27",
		["Death Knight"] = "Spell_Deathknight_ClassIcon",
		["Monk"] = "class_monk",
	}
end

---------------------------------------------------------------------------------------
-- Debug print
---------------------------------------------------------------------------------------

function Nx.Weekly:Login(event, arg1)
	local ch = Nx.CurCharacter
	Nx.Weekly:CharRecord(ch)
end

function Nx.Weekly:ConvertData()
	if not Nx.wkdb.global then
		Nx.wkdb.global = {}
	end
	if not Nx.wkdb.global.Characters then
		Nx.wkdb.global.Characters = {}
	end
	for ch,data in pairs(Nx.db.global.Characters) do
		if Nx.db.global.Characters[ch].Weekly then
			if not Nx.wkdb.global.Characters[ch] then
				Nx.wkdb.global.Characters[ch] = {}
			end
			Nx.wkdb.global.Characters[ch].Weekly = Nx.db.global.Characters[ch].Weekly
			Nx.db.global.Characters[ch].Weekly = nil
		else
			Nx.wkdb.global.Characters[ch] = {}
			Nx.Weekly:ResetChar(Nx.wkdb.global.Characters[ch])
		end
	end
end

function Nx.Weekly:ResetChar(ch)
	if not ch.Weekly then
		ch.Weekly = {}
	end
	ch.Weekly.Sha = false
	ch.Weekly.Galleon = false
	ch.Weekly.Nalak = false
	ch.Weekly.Oondasta = false
	ch.Weekly.Ritual = false
	ch.Weekly.LootKey = false
	ch.Weekly.OutdoorChest = false
	ch.Weekly.Chamberlain = false
	ch.Weekly.Celestials = false
	ch.Weekly.Ordos = false
	ch.Weekly.TemperedFateSeals = 0
	ch.Weekly.GarrisonInvasion = false
	ch.Weekly.Tarlna = false
	ch.Weekly.Drov = false
	ch.Weekly.Rukhmar = false
	ch.Weekly.Raids = {}
end

function Nx.Weekly:Reset()
	for cnum, rc in ipairs (Nx.RealmChars) do
		local ch = Nx.wkdb.global.Characters[rc]
		if not ch then
			return
		end
		if ch.Weekly then
			Nx.Weekly:ResetChar(ch)
		end
	end
end

function Nx.Weekly:CharRecord(ch)
	if not ch.Weekly then
		ch.Weekly = {}
	end
	-- always set to zero, otherwise we increment the number on every check
	ch.Weekly.TemperedFateSeals = 0
	local qids = {36058,36054,37454,37455,36056,37456,37457,36057,37458,37459,36055,37452,37453}
	for a,b in pairs(qids) do
		if IsQuestFlaggedCompleted(b) then
			ch.Weekly.TemperedFateSeals = ch.Weekly.TemperedFateSeals + 1
		end
	end
	qids = {
		["Ordos"] = 33118,
		["Celestials"] = 33117,
		["Chamberlain"] = 32505,
		["OutdoorChest"] = 32609,
		["LootKey"] = 32626,
		["Ritual"] = 32610,
		["Oondasta"] = 32519,
		["Nalak"] = 32518,
		["Galleon"] = 32098,
		["Sha"] = 32099,
	}
	for a,b in pairs(qids) do
		ch.Weekly[a] = IsQuestFlaggedCompleted(b)
	end
	qids = {
		[L["Bronze"]] = 37638,
		[L["Silver"]] = 36739,
		[L["Gold"]] = 37640,
	}
	for a,b in pairs(qids) do
		if IsQuestFlaggedCompleted(b) then
			ch.Weekly.GarrisonInvasion = a
		end
	end

	qids = {
		["MSV"] = {
			[1] = {
				[527] = { num = 3, start = 1 },
				[528] = { num = 3, start = 4 },
			},
			[2] = {
				[830] = { num = 3, start = 1 },
				[831] = { num = 3, start = 4 },
			},
			[3] = {
				[532] = { num = 6, start = 1 },
			},
			[4] = {
				[533] = { num = 6, start = 1 },
			},
		},
		["HoF"] = {
			[1] = {
				[529] = { num = 3, start = 1 },
				[530] = { num = 3, start = 4 },
			},
			[2] = {
				[832] = { num = 3, start = 1 },
				[833] = { num = 3, start = 4 },
			},
			[3] = {
				[534] = { num = 6, start = 1 },
			},
			[4] = {
				[533] = { num = 6, start = 1 },
			},
		},
		["TeS"] = {
			[1] = {
				[526] = { num = 4, start = 1 },
			},
			[2] = {
				[834] = { num = 4, start = 1 },
			},
			[3] = {
				[536] = { num = 8, start = 1 },
			},
			[4] = {
				[535] = { num = 8, start = 1 },
			},
		},
		["ToTS"] = {
			[1] = {
				[610] = { num = 3, start = 1 },
				[611] = { num = 3, start = 4 },
				[612] = { num = 3, start = 7 },
				[613] = { num = 3, start = 10 },
			},
			[2] = {
				[835] = { num = 3, start = 1 },
				[836] = { num = 3, start = 4 },
				[837] = { num = 3, start = 7 },
				[838] = { num = 3, start = 10 },
			},
			[3] = {
				[634] = { num = 12, start = 1 },
			},
			[4] = {
				[633] = { num = 12, start = 1 },
			},
		},
		["SoO"] = {
			[1] = {
				[716] = { num = 4, start = 1 },
				[717] = { num = 4, start = 5 },
				[724] = { num = 4, start = 9 },
				[725] = { num = 4, start = 12 },
			},
			[2] = {
				[839] = { num = 4, start = 1 },
				[840] = { num = 4, start = 5 },
				[841] = { num = 3, start = 9 },
				[842] = { num = 3, start = 12 },
			},
			[3] = {
				[715] = { num = 14, start = 1 },
			},
			[4] = {
				[714] = { num = 14, start = 1 },
			},
			[5] = {
				[766] = { num = 14, start = 1 },
			},
		},
		["Highmaul"] = {
			[1] = {
				[849] = { num = 3, start = 1 },
				[850] = { num = 3, start = 4 },
				[851] = { num = 1, start = 7 },
			},
			[3] = {
				[895] = { num = 7, start = 1 },
			},
			[4] = {
				[896] = { num = 7, start = 1 },
			},
			[5] = {
				[897] = { num = 7, start = 1 },
			},
		},
		["BRF"] = {
			[1] = {
				[847] = { num = 3, start = 1 },
				[846] = { num = 3, start = 4 },
				[848] = { num = 3, start = 7 },
				[823] = { num = 1, start = 10 },
			},
			[3] = {
				[898] = { num = 10, start = 1 },
			},
			[4] = {
				[899] = { num = 10, start = 1 },
			},
			[5] = {
				[900] = { num = 10, start = 1 },
			},
		},
	}
	function checkEncounterKillStatus(instanceName, instanceDifficulty, bossName)
		for i = 1, GetNumSavedInstances() do
			local raidName, _, _, raidDifficulty, _, _, _, _, _, _, numEncounters = GetSavedInstanceInfo(i)
			if (raidName == instanceName and instanceDifficulty == raidDifficulty) then
				for j = 1, numEncounters do
					local iniBossName, _, iniBossKilled = GetSavedInstanceEncounterInfo(i, j)
					if (bossName == iniBossName) then
						return iniBossKilled
					end
				end
			end
		end
	end
	ch.Weekly.Raids = {}
	for a,b in pairs (qids) do
		ch.Weekly.Raids[a] = {}
		for c, d in pairs (b) do
			ch.Weekly.Raids[a][c] = {}
			for e, f in pairs (d) do
				for num = f.start,f.start+f.num-1 do
					local bossName,_,isKilled = GetLFGDungeonEncounterInfo(e,num)
					ch.Weekly.Raids[a][c][num] = isKilled
					-- not trackable via LFG API? find out anyway
					if (isKilled == false) then
						local instanceName, _, _, _, _, _, _, _, _, _, _, instanceDifficulty = GetLFGDungeonInfo(e)
						ch.Weekly.Raids[a][c][num] = checkEncounterKillStatus(instanceName, instanceDifficulty, bossName)
					end
				end
			end
		end
	end
end

---------------------------------------------------------------------------------------
-- Create weekly window
---------------------------------------------------------------------------------------

function Nx.Weekly:Create()
	self.SelectedChar = 1
	local win = Nx.Window:Create ("NxWeekly", nil, nil, nil, 1)
	self.Win = win
	win.Frm.NxInst = self
	win:CreateButtons (true, true)
	win:InitLayoutData (nil, -.25, -.15, -.5, -.6)
	win.Frm:SetToplevel (true)

	win:Show (false)

	tinsert (UISpecialFrames, win.Frm:GetName())
	-- Character List

	Nx.List:SetCreateFont ("Font.Medium", 16)

	local list = Nx.List:Create (false, 0, 0, 1, 1, win.Frm)
	self.List = list

	list:SetUser (self, self.OnListEvent)

	list:SetLineHeight (4)

	list:ColumnAdd ("", 1, 24)
	list:ColumnAdd ("Name", 2, 200)
	list:ColumnAdd ("Class", 3,250)
	win:Attach (list.Frm, 0, .5, 0, 1)

	-- Item List

	Nx.List:SetCreateFont ("Font.Medium", 16)

	local list = Nx.List:Create (false, 0, 0, 1, 1, win.Frm)
	self.WeeklyList = list
	list:ColumnAdd ("", 1, 250)
	list:ColumnAdd ("", 2, 250)
	win:Attach (list.Frm, .5, 1, 0, 1)
	local bw, bh = win:GetBorderSize()
	local but = Nx.Button:Create (win.Frm, "Txt64", "WoD", nil, bw + 444, -bh, "TOPLEFT", 40, 20, self.But_OnWoD, self)
	local but = Nx.Button:Create (win.Frm, "Txt64", "MoP", nil, bw + 488, -bh, "TOPLEFT", 40, 20, self.But_OnMoP, self)
	self:Update()
	self.List:Select (0)
	self.List:FullUpdate()
end

function Nx.Weekly:But_OnWoD()
	Nx.Weekly.WhichExpansion = 1
	Nx.Weekly:DisplayWeekly()
end

function Nx.Weekly:But_OnMoP()
	Nx.Weekly.WhichExpansion = 2
	Nx.Weekly:DisplayWeekly()
end

---------------------------------------------------------------------------------------
-- Show or hide window
---------------------------------------------------------------------------------------

function Nx.Weekly:ToggleShow()

	if not self.Win then
		self:Create()
	end

	self.Win:Show (not self.Win:IsShown())

	if self.Win:IsShown() then
		self:Update()
	end

end

---------------------------------------------------------------------------------------
-- On list events
---------------------------------------------------------------------------------------

function Nx.Weekly:OnListEvent (eventName, sel, val2, click)
	local data = self.List:ItemGetData (sel) or 0
	local id = data % 1000
	if (id >= 1 and id <= #Nx.RealmChars) or id == 99 then
		self.SelectedChar = id
	end

	if eventName == "select" or eventName == "mid" then
		self:Update()
	end
end

---------------------------------------------------------------------------------------
-- Update Weeklies
---------------------------------------------------------------------------------------

function Nx.Weekly:Update()
	local Nx = Nx
	if not Nx.CurCharacter then	-- Can even happen?
		return
	end
	if not self.Win then
		return
	end
	Nx.Weekly:CharRecord(Nx.CurCharacter)
	self.Win:SetTitle (format (L["Weekly Tracker: %d characters - Reset In %s"], #Nx.RealmChars,SecondsToTime(Nx.Weekly:CalcReset(), false, true, 3)))
	local myName = UnitName ("player")
	local totalChars = 0
	local hicol = "|cffcfcfcf"
	local list = self.List
	list:Empty()
	local allIndex = list:ItemGetNum()
	local rn = GetRealmName()
	for cnum, rc in ipairs (Nx.RealmChars) do
		local rname, cname = strsplit (".", rc)
		local cnameCol = "|cffafdfaf"
		if cname == myName then		-- Me?
			cnameCol = "|cffdfffdf"
		end
		local ch = Nx.db.global.Characters[rc]
		if ch then
			local cls = ch["Class"] or "?"
			local lvl = tonumber (ch["Level"] or 0)
			totalChars = totalChars + 1
			list:ItemAdd (cnum)
			local s = ch["Account"] and format ("%s (%s)", cname, ch["Account"]) or cname
			list:ItemSet (2, format ("%s%s", cnameCol, s))
			list:ItemSet (3, format ("|cffff0000[|cff00ffff%s %s|cffff0000]", lvl, cls))
			if self.ClassIcons[ch["Class"]] then
				list:ItemSetButton ("Warehouse", hide, "Interface\\Icons\\" .. self.ClassIcons[ch["Class"]])
			end
		end
	end

	list:Update()
	self:DisplayWeekly()
end

function Nx.Weekly:DisplayWeekly()
	local list = self.WeeklyList
	local strng = ""
	list:Empty()
	local rc = Nx.RealmChars[self.SelectedChar]
	local rname, cname = strsplit (".", rc)
	local curline = 1
	local spacer = false
	list:ColumnSetName (1, format ("  %s's Weekly Status", cname))
	local ch = Nx.wkdb.global.Characters[rc]
	if Nx.Weekly.WhichExpansion == 1 then
		if Nx.wkdb.profile.Track.Mob.Tarlna then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Tarlna the Ageless"])
			if ch.Weekly and ch.Weekly.Tarlna then
				strng = "|cff00ff00" .. L["Killed"]
			elseif ch.Weekly and not ch.Weekly.Tarlna then
				strng = "|cffff0000" .. L["Not Killed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Mob.Drov then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Drov the Ruiner"])
			if ch.Weekly and ch.Weekly.Drov then
				strng = "|cff00ff00" .. L["Killed"]
			elseif ch.Weekly and not ch.Weekly.Drov then
				strng = "|cffff0000" .. L["Not Killed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Mob.Rukhmar then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Rukhmar"])
			if ch.Weekly and ch.Weekly.Rukhmar then
				strng = "|cff00ff00" .. L["Killed"]
			elseif ch.Weekly and not ch.Weekly.Rukhmar then
				strng = "|cffff0000" .. L["Not Killed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
			curline = curline + 1
		end
		spacer = false
		if Nx.wkdb.profile.Track.Quest.TemperedFateSeals then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Tempered Fate Seals"])
			if ch.Weekly and ch.Weekly.TemperedFateSeals then
				strng = "|cff00ff00" .. ch.Weekly.TemperedFateSeals
			elseif not ch.Weekly or not ch.Weekly.TemperedFateSeals then
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Quest.GarrisonInvasion then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Garrison Invasion"])
			if ch.Weekly and ch.Weekly.GarrisonInvasion then
				if ch.Weekly.GarrisonInvasion == 0 then
					strng = "|cff00ff00" .. L["Not Completed"]
				else
					strng = "|cff00ff00" .. ch.Weekly.GarrisonInvasion
				end
			elseif not ch.Weekly or not ch.Weekly.TemperedFateSeals then
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
			curline = curline + 1
		end
		spacer = false
		strng = "                    "
		local strng2 = "                    "
		list:ItemAdd(curline)
		list:ItemSet(1,"")
		curline = curline + 1
		list:ItemAdd(curline + 1)
		list:ItemSet(1, "                    ")
		list:ItemSet(2, format("|cffffff00%s%s%s%s|r",
			Nx.wkdb.profile.Track.RaidLevels.LFR and ' LFR  ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Norm and ' NHC  ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Heroic and ' HC   ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Mythic and ' Mythic ' or ''))
		list:ItemAdd(curline + 2)
		list:ItemSet(1, "                    ")
		list:ItemSet(2, format("|cff00ffff%s%s%s%s|r",
			Nx.wkdb.profile.Track.RaidLevels.LFR and '------ ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Norm and '------- ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Heroic and '------ ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Mythic and '--------- ' or ''))
		curline = curline + 2
		strng = ""
		strng2 = ""
		if Nx.wkdb.profile.Track.Raids.Highmaul then
			spacer = true
			for i = 1,7 do
				strng = GetLFGDungeonEncounterInfo(895,i)
				strng2 = ""
				if Nx.wkdb.profile.Track.RaidLevels.LFR then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["Highmaul"] and ch.Weekly.Raids["Highmaul"][1] and
						ch.Weekly.Raids["Highmaul"][1][i]) and "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Norm then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["Highmaul"] and ch.Weekly.Raids["Highmaul"][3] and
						ch.Weekly.Raids["Highmaul"][3][i]) and "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Heroic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["Highmaul"] and ch.Weekly.Raids["Highmaul"][4] and
						ch.Weekly.Raids["Highmaul"][4][i]) and "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Mythic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["Highmaul"] and ch.Weekly.Raids["Highmaul"][5] and
						ch.Weekly.Raids["Highmaul"][5][i]) and "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				list:ItemAdd(curline + 1)
				list:ItemSet(1, strng)
				list:ItemSet(2, strng2)
				curline = curline + 1
			end
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
			curline = curline + 1
		end
		spacer = false
		if Nx.wkdb.profile.Track.Raids.BRF then
			spacer = true
			for i = 1,10 do
				strng = GetLFGDungeonEncounterInfo(898,i)
				strng2 = ""
				if Nx.wkdb.profile.Track.RaidLevels.LFR then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["BRF"] and ch.Weekly.Raids["BRF"][1] and
						ch.Weekly.Raids["BRF"][1][i]) and "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Norm then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["BRF"] and ch.Weekly.Raids["BRF"][3] and
						ch.Weekly.Raids["BRF"][3][i]) and "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Heroic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["BRF"] and ch.Weekly.Raids["BRF"][4] and
						ch.Weekly.Raids["BRF"][4][i]) and "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Mythic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["BRF"] and ch.Weekly.Raids["BRF"][5] and
						ch.Weekly.Raids["BRF"][5][i]) and "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				list:ItemAdd(curline + 1)
				list:ItemSet(1, strng)
				list:ItemSet(2, strng2)
				curline = curline + 1
			end
		end
	end
	if Nx.Weekly.WhichExpansion == 2 then
		if Nx.wkdb.profile.Track.Mob.Sha then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Sha of Anger"])
			if ch.Weekly and ch.Weekly.Sha then
				strng = "|cff00ff00" .. L["Killed"]
			elseif ch.Weekly and not ch.Weekly.Sha then
				strng = "|cffff0000" .. L["Not Killed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Mob.Galleon then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Galleon"])
			if ch.Weekly and ch.Weekly.Galleon then
				strng = "|cff00ff00" .. L["Killed"]
			elseif ch.Weekly and not ch.Weekly.Galleon then
				strng = "|cffff0000" .. L["Not Killed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Mob.Nalak then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Nalak, The Storm Lord"])
			if ch.Weekly and ch.Weekly.Nalak then
				strng = "|cff00ff00" .. L["Killed"]
			elseif ch.Weekly and not ch.Weekly.Nalak then
				strng = "|cffff0000" .. L["Not Killed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Mob.Oondasta then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Oondasta"])
			if ch.Weekly and ch.Weekly.Oondasta then
				strng = "|cff00ff00" .. L["Killed"]
			elseif ch.Weekly and not ch.Weekly.Oondasta then
				strng = "|cffff0000" .. L["Not Killed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Mob.Celestials then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Celestials"])
			if ch.Weekly and ch.Weekly.Celestials then
				strng = "|cff00ff00" .. L["Killed"]
			elseif ch.Weekly and not ch.Weekly.Celestials then
				strng = "|cffff0000" .. L["Not Killed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Mob.Ordos then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Ordos"])
			if ch.Weekly and ch.Weekly.Ordos then
				strng = "|cff00ff00" .. L["Killed"]
			elseif ch.Weekly and not ch.Weekly.Ordos then
				strng = "|cffff0000" .. L["Not Killed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
			curline = curline + 1
		end
		spacer = false
		if Nx.wkdb.profile.Track.Loot.Ritual then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Shan'ze Ritual Stone"])
			if ch.Weekly and ch.Weekly.Ritual then
				strng = "|cff00ff00" .. L["Looted"]
			elseif ch.Weekly and not ch.Weekly.Ritual then
				strng = "|cffff0000" .. L["Not Looted"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Loot.LootKey then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Palace Key"])
			if ch.Weekly and ch.Weekly.LootKey then
				strng = "|cff00ff00" .. L["Looted"]
			elseif ch.Weekly and not ch.Weekly.LootKey then
				strng = "|cffff0000" .. L["Not Looted"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if Nx.wkdb.profile.Track.Loot.OutdoorChest then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["Thunder King Trove"])
			if ch.Weekly and ch.Weekly.OutdoorChest then
				strng = "|cff00ff00" .. L["Looted"]
			elseif ch.Weekly and not ch.Weekly.OutdoorChest then
				strng = "|cffff0000" .. L["Not Looted"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
		end
		spacer = false
		if Nx.wkdb.profile.Track.Quest.Chamberlain then
			list:ItemAdd(curline)
			list:ItemSet(1, "|cffffff00  " .. L["The Crumbled Chamberlain"])
			if ch.Weekly and ch.Weekly.Chamberlain then
				strng = "|cff00ff00" .. L["Completed"]
			elseif ch.Weekly and not ch.Weekly.Chamberlain then
				strng = "|cffff0000" .. L["Not Completed"]
			else
				strng = "|cffffffff" .. L["Unknown"]
			end
			list:ItemSet(2, strng)
			curline = curline + 1
			spacer = true
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
		end
		spacer = false
		strng = "                    "
		local strng2 = "                    "
		list:ItemAdd(curline)
		list:ItemSet(1,"")
		curline = curline + 1
		list:ItemAdd(curline + 1)
		list:ItemSet(1, "                    ")
		list:ItemSet(2, format("|cffffff00%s%s%s%s|r",
			Nx.wkdb.profile.Track.RaidLevels.LFR and ' LFR  ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Norm and ' NHC  ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Heroic and ' HC   ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Mythic and ' Mythic ' or ''))
		list:ItemAdd(curline + 2)
		list:ItemSet(1, "                    ")
		list:ItemSet(2, format("|cff00ffff%s%s%s%s|r",
			Nx.wkdb.profile.Track.RaidLevels.LFR and '------ ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Norm and '------- ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Heroic and '------ ' or '',
			Nx.wkdb.profile.Track.RaidLevels.Mythic and '--------- ' or ''))
		curline = curline + 2
		strng = ""
		strng2 = ""
		if Nx.wkdb.profile.Track.Raids.MSV then
			spacer = true
			for i = 1,6 do
				strng = GetLFGDungeonEncounterInfo(532,i)
				strng2 = ""
				if Nx.wkdb.profile.Track.RaidLevels.LFR then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["MSV"] and ((ch.Weekly.Raids["MSV"][1] and
						ch.Weekly.Raids["MSV"][1][i]) or (ch.Weekly.Raids["MSV"][2] and ch.Weekly.Raids["MSV"][2][i]))) and
							"   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Norm then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["MSV"] and ch.Weekly.Raids["MSV"][3] and
						ch.Weekly.Raids["MSV"][3][i]) and "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Heroic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["MSV"] and ch.Weekly.Raids["MSV"][4] and
						ch.Weekly.Raids["MSV"][4][i]) and "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Mythic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["MSV"] and ch.Weekly.Raids["MSV"][5] and
						ch.Weekly.Raids["MSV"][5][i]) and "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				list:ItemAdd(curline + 1)
				list:ItemSet(1, strng)
				list:ItemSet(2, strng2)
				curline = curline + 1
			end
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
		end
		if Nx.wkdb.profile.Track.Raids.HoF then
			spacer = true
			for i = 1,6 do
				strng = GetLFGDungeonEncounterInfo(534,i)
				strng2 = ""
				if Nx.wkdb.profile.Track.RaidLevels.LFR then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["HoF"] and ((ch.Weekly.Raids["HoF"][1] and
						ch.Weekly.Raids["HoF"][1][i]) or (ch.Weekly.Raids["HoF"][2] and ch.Weekly.Raids["HoF"][2][i]))) and
							"   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Norm then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["HoF"] and ch.Weekly.Raids["HoF"][3] and
						ch.Weekly.Raids["HoF"][3][i]) and "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Heroic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["HoF"] and ch.Weekly.Raids["HoF"][4] and
						ch.Weekly.Raids["HoF"][4][i]) and "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Mythic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["HoF"] and ch.Weekly.Raids["HoF"][5] and
						ch.Weekly.Raids["HoF"][5][i]) and "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				list:ItemAdd(curline + 1)
				list:ItemSet(1, strng)
				list:ItemSet(2, strng2)
				curline = curline + 1
			end
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
		end
		if Nx.wkdb.profile.Track.Raids.TeS then
			spacer = true
			for i = 1,4 do
				strng = GetLFGDungeonEncounterInfo(536,i)
				strng2 = ""
				if Nx.wkdb.profile.Track.RaidLevels.LFR then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["TeS"] and ((ch.Weekly.Raids["TeS"][1] and
						ch.Weekly.Raids["TeS"][1][i]) or (ch.Weekly.Raids["TeS"][2] and ch.Weekly.Raids["TeS"][2][i]))) and
							"   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Norm then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["TeS"] and ch.Weekly.Raids["TeS"][3] and
						ch.Weekly.Raids["TeS"][3][i]) and "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Heroic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["TeS"] and ch.Weekly.Raids["TeS"][4] and
						ch.Weekly.Raids["TeS"][4][i]) and "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Mythic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["TeS"] and ch.Weekly.Raids["TeS"][5] and
						ch.Weekly.Raids["TeS"][5][i]) and "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				list:ItemAdd(curline + 1)
				list:ItemSet(1, strng)
				list:ItemSet(2, strng2)
				curline = curline + 1
			end
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
		end
		if Nx.wkdb.profile.Track.Raids.ToTS then
			spacer = true
			for i = 1,12 do
				strng = GetLFGDungeonEncounterInfo(634,i)
				strng2 = ""
				if Nx.wkdb.profile.Track.RaidLevels.LFR then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["ToTS"] and ((ch.Weekly.Raids["ToTS"][1] and
						ch.Weekly.Raids["ToTS"][1][i]) or (ch.Weekly.Raids["ToTS"][2] and ch.Weekly.Raids["ToTS"][2][i]))) and
							"   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Norm then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["ToTS"] and ch.Weekly.Raids["ToTS"][3] and
						ch.Weekly.Raids["ToTS"][3][i]) and "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Heroic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["ToTS"] and ch.Weekly.Raids["ToTS"][4] and
						ch.Weekly.Raids["ToTS"][4][i]) and "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Mythic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["ToTS"] and ch.Weekly.Raids["ToTS"][5] and
						ch.Weekly.Raids["ToTS"][5][i]) and "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				list:ItemAdd(curline + 1)
				list:ItemSet(1, strng)
				list:ItemSet(2, strng2)
				curline = curline + 1
			end
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
		end
		if Nx.wkdb.profile.Track.Raids.SoO then
			spacer = true
			for i = 1,14 do
				strng = GetLFGDungeonEncounterInfo(715,i)
				strng2 = ""
				strng = format("%-30s",string.sub(strng,1,22))
				if Nx.wkdb.profile.Track.RaidLevels.LFR then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["SoO"] and ((ch.Weekly.Raids["SoO"][1] and
						ch.Weekly.Raids["SoO"][1][i]) or (ch.Weekly.Raids["SoO"][2] and ch.Weekly.Raids["SoO"][2][i]))) and
							"   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Norm then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["SoO"] and ch.Weekly.Raids["SoO"][3] and
						ch.Weekly.Raids["SoO"][3][i]) and "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "    |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Heroic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["SoO"] and ch.Weekly.Raids["SoO"][4] and
						ch.Weekly.Raids["SoO"][4][i]) and "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "   |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				if Nx.wkdb.profile.Track.RaidLevels.Mythic then
					strng2 = strng2 .. ((ch.Weekly.Raids and ch.Weekly.Raids["SoO"] and ch.Weekly.Raids["SoO"][5] and
						ch.Weekly.Raids["SoO"][5][i]) and "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8:12|t   " or "     |TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:12|t   ")
				end
				list:ItemAdd(curline + 1)
				list:ItemSet(1, strng)
				list:ItemSet(2, strng2)
				curline = curline + 1
			end
		end
		if spacer then
			list:ItemAdd(curline)
			list:ItemSet(1,"|cff00ffff  -----------------------------")
		end
	end
end

function Nx.Weekly:OnButToggleWeekly (but)
	Nx.Weekly:ToggleShow()
end

function Nx.Weekly:CalcEpoch()
	local anum,amonth,aday,ayear = CalendarGetDate()
	local ahour,amin = GetGameTime()
	return time({year = ayear, month = amonth, day = aday, hour = ahour, min = amin})
end

function Nx.Weekly:CalcReset()
	local seconds = GetQuestResetTime()
	local day = CalendarGetDate()
	local dailydate = Nx.wkdb.profile.Weekly.ResetDate
	if day - 2 == dailydate-1 then
		if seconds < 21600 then
			return seconds
		end
	end
	local tdays = 0
	if day - 2 == dailydate then tdays = 6 end
	if day - 2 == dailydate+1 then tdays = 5 end
	if day - 2 == dailydate+2 then tdays = 4 end
	if day - 2 == dailydate+3 then tdays = 3 end
	if day - 2 == dailydate+4 then tdays = 2 end
	if day - 2 == dailydate-1 then tdays = 1 end
	if day - 2 == dailydate-2 then tdays = 1 end
	if day - 2 == dailydate-3 then tdays = 2 end
	if day - 2 == dailydate-4 then tdays = 3 end
--	Nx.prt(day .. " " .. dailydate .. " " .. tdays)
	return seconds + tdays * 86400
end

-------------------------------------------------------------------------------
-- EOF
