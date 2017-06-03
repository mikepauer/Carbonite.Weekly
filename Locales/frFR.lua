if ( GetLocale() ~= "frFR" ) then
	return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("Carbonite.Weekly", "frFR")
if not L then return end

L["Weekly Status Module"] = "Module du status des Qu\195\170tes hebdomadaires"
L["Weekly Status Options"] = "Options/Status des Qu\195\170tes hebdomadaires"
L["General"] = "G\195\169n\195\169ral"
L["Day Reset Occurs"] = "R\195\169initialisation du jour se produit"
L["Monday"] = "Lundi"
L["Tuesday"] = "Mardi"
L["Wednesday"] = "Mercredi"
L["Thursday"] = "Jeudi"
L["Friday"] = "Vendredi"
L["Saturday"] = "Samedi"
L["Sunday"] = "Dimanche"
L["Mobs"] = "Monstres"
L["Place check boxes in the mobs you wish to track weekly kills."] = "Cocher la case pour le Mob que vous d\195\169sirez suivre et tuer hebdomadairement"
L["Lootables"] = "Ramassable"
L["Place check boxes in the weekly drops you wish to track."] = "Cocher la case pour l'objet que vous d\195\169sirez suivre hebdomadairement"
L["Place check boxes in the difficulties you want to track."] = "Cocher la case pour le niveau de difficult\195\169s que vous voulez suivre"
L["Quests"] = "Qu\195\170tes"
L["Place check boxes in the weekly quests you want to track."] = "Cocher la case dans les Qu\195\170tes hebdomadaires que vous voulez suivre"
L["Seal of Tempered Fate"] = "Sceau du destin temp\195\169r\195\169"
L["Seals of Tempered Fate"] = "Sceaux du destin temp\195\169r\195\169"
L["Place check boxes in the raid progress you want to track."] = "Cocher la case dans le progr\195\168s du Raid que vous voulez suivre"
L["Show Weekly Objectives"] = "Afficher objectifs hebdomadaires"
L["-Weekly Tracker-"] = "-Suivi Hebdomadaire-"
L["Toggle Weekly List"] = "Basculer vers liste hebdomadaire"
L["Weekly Tracker: %d characters - Reset In %s"] = "Suivi hebdomadaire: %d personnages - r\195\169initialisation dans %s"
L["Killed"] = "Tu\195\169"
L["Not Killed"] = "Pas Tu\195\169"
L["Unknown"] = "Inconnu"
L["Looted"] = "Ramass\195\169"
L["Not Looted"] = "Pas Ramass\195\169"
L["Completed"] = "Termin\195\169"
L["Not Completed"] = "Pas Termin\195\169"

-- Bosses
-- MoP
L["Sha of Anger"] =  "Sha de la Col\195\168re"
L["Galleon"] = "Galion"
L["Nalak, The Storm Lord"] = "Nalak, le Seigneur des Temp\195\170tes"
L["Oondasta"] = true				--same name in fr
L["Celestials"] = "D\195\169fi C\195\169leste"
L["Ordos"] = true				--same name in fr
--WoD
L["Rukhmar"] = true				--same name in fr
L["Drov the Ruiner"] = "Drov le D\195\169vastateur"
L["Tarlna the Ageless"] = "Tarlna l'\195\137ternel"

L["The Crumbled Chamberlain"] = "L'\195\169miett\195\169 Chamberlain"
L["Tempered Fate Seals"] = "Sceaux du destin temp\195\169r\195\169"
L["Garrison Invasion"] = "Invasion de Fief"
L["Bronze"] = true
L["Silver"] = "Argent"
L["Gold"] = "Or"
L["Palace Key"] = "La cl\195\169 du Palais"
L["LFR"] = true
L["Normal"] = true
L["Heroic"] = "H\195\169ro\195\175que"
L["Mythic"] = "Mythique"
L["Mogu'shan Vaults"] = "Caveaux Mogu'shan"
L["Heart of Fear"] = "Coeur de la Peur"
L["Terrace of Endless Spring"] = "Terrasse des \195\169ternels Printemps"
L["Throne of Thunder"] = "Tr\195\180ne du Tonnerre"
L["Siege of Orgrimmar"] = "Si\195\168ge d'Orgrimmar"
L["Highmaul"] = "Cognefort"
L["Blackrock Foundry"] = "Fonderie des Rochenoires"
L["Shan'ze Ritual Stone"] = "Pierre rituelle Shan'ze"
L["Lei Shen Palace Key"] = "La cl\195\169 du palais de Lei Shen"
L["Thunder King Trove"] = "Troyes du Roi-Tonnerre"
L["MoP"] = true
L["WoD"] = true
L["Weekly"] = "hebdomadaire"

-- No Longer Used
L["Yes"] = "Oui"
L["No"] = "Non"
