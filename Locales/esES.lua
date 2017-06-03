if ( GetLocale() ~= "esES" ) then
	return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("Carbonite.Weekly", "esES")
if not L then return end

L["Weekly Status Module"] = true
L["Weekly Status Options"] = true
L["General"] = true
L["Day Reset Occurs"] = true
L["Monday"] = true
L["Tuesday"] = true
L["Wednesday"] = true
L["Thursday"] = true
L["Friday"] = true
L["Saturday"] = true
L["Sunday"] = true
L["Mobs"] = true
L["Place check boxes in the mobs you wish to track weekly kills."] = true
L["Lootables"] = true
L["Place check boxes in the weekly drops you wish to track."] = true
L["Place check boxes in the difficulties you want to track."] = true
L["Quests"] = true
L["Place check boxes in the weekly quests you want to track."] = true
L["Seal of Tempered Fate"] = true
L["Seals of Tempered Fate"] = true
L["Place check boxes in the raid progress you want to track."] = true
L["Show Weekly Objectives"] = true
L["-Weekly Tracker-"] = true
L["Toggle Weekly List"] = true
L["Weekly Tracker: %d characters - Reset In %s"] = true
L["Killed"] = true
L["Not Killed"] = true
L["Unknown"] = true
L["Looted"] = true
L["Not Looted"] = true
L["Completed"] = true
L["Not Completed"] = true

-- Bosses
-- MoP
L["Sha of Anger"] = true
L["Galleon"] = true
L["Nalak, The Storm Lord"] = true
L["Oondasta"] = true
L["Celestials"] = true
L["Ordos"] = true
--WoD
L["Rukhmar"] = true
L["Drov the Ruiner"] = true
L["Tarlna the Ageless"] = true

L["The Crumbled Chamberlain"] = true
L["Tempered Fate Seals"] = true
L["Garrison Invasion"] = true
L["Bronze"] = true
L["Silver"] = true
L["Gold"] = true
L["Palace Key"] = true
L["LFR"] = true
L["Normal"] = true
L["Heroic"] = true
L["Mythic"] = true
L["Mogu'shan Vaults"] = true
L["Heart of Fear"] = true
L["Terrace of Endless Spring"] = true
L["Throne of Thunder"] = true
L["Siege of Orgrimmar"] = true
L["Highmaul"] = true
L["Blackrock Foundry"] = true
L["Shan'ze Ritual Stone"] = true
L["Lei Shen Palace Key"] = true
L["Thunder King Trove"] = true
L["MoP"] = true
L["WoD"] = true
L["Weekly"] = true