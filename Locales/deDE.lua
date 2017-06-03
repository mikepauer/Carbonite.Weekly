if ( GetLocale() ~= "deDE" ) then
	return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("Carbonite.Weekly", "deDE")
if not L then return end

L["Weekly Status Module"] = "W\195\182chentliches"
L["Weekly Status Options"] = "W\195\182chentlicher Status"
L["General"] = "Allgemein"
L["Day Reset Occurs"] = "Der Tag, an dem Blizzard die ID zur\195\188cksetzt"
L["Monday"] = "Montag"
L["Tuesday"] = "Dienstag"
L["Wednesday"] = "Mittwoch"
L["Thursday"] = "Donnerstag"
L["Friday"] = "Freitag"
L["Saturday"] = "Samstag"
L["Sunday"] = "Sonntag"
L["Mobs"] = "Weltenbosse"
L["Place check boxes in the mobs you wish to track weekly kills."] = "Jene Gegner aktivieren, deren w\195\182chentliche T\195\182tung nachverfolgt werden soll."
L["Lootables"] = "Pl\195\188nderbares"
L["Place check boxes in the weekly drops you wish to track."] = "Bitte aktivieren Sie jene w\195\182chentlichen Beuteziele, die \195\188berwacht werden sollen."
L["Place check boxes in the difficulties you want to track."] = "Bitte aktivieren Sie den Schwierigkeitsgrad, der \195\188berwacht werden soll."
L["Quests"] = "Quests"
L["Place check boxes in the weekly quests you want to track."] = "Jene Quests aktivieren, deren w\195\192chentliche Erf\195\188llung nachverfolgt werden soll."
L["Seal of Tempered Fate"] = "Siegel des geschmiedeten Schicksals"
L["Seals of Tempered Fate"] = "Siegel des geschmiedeten Schicksals"
L["Place check boxes in the raid progress you want to track."] = "Bitte aktivieren Sie jene Raid-Ziele, die beobachtet werden sollen"
L["Show Weekly Objectives"] = "Zeige w\195\182chentliche Questziele"
L["-Weekly Tracker-"] = "-W\195\182chentlicher Status-"
L["Toggle Weekly List"] = "W\195\182chentliche Statusliste an-/ausstellen"
L["Weekly Tracker: %d characters - Reset In %s"] = "W\195\182chentlicher Status: %d Charaktere - Zur\195\188cksetzen in %s"
L["Killed"] = "Get\195\182tet"
L["Not Killed"] = "Nicht get\195\182tet"
L["Unknown"] = "Unbekannt"
L["Looted"] = "Gepl\195\188ndert"
L["Not Looted"] = "Noch nicht gepl\195\188ndert"
L["Completed"] = "Abgeschlossen"
L["Not Completed"] = "Nicht abgeschlossen"

-- Bosses
-- MoP
L["Sha of Anger"] = "Sha der Angst"
L["Galleon"] = "Galleon"
L["Nalak, The Storm Lord"] = "Nalak, der Sturm Lord"
L["Oondasta"] = "Oondasta"
L["Celestials"] = "Die Erhabenen"
L["Ordos"] = "Ordos"
--WoD
L["Rukhmar"] = "Rukhmar"
L["Drov the Ruiner"] = "Drov der Verheerer"
L["Tarlna the Ageless"] = "Tarlna der Zeitlose"

L["The Crumbled Chamberlain"] = "Der zerfallene K\195\164mmerer"
L["Tempered Fate Seals"] = "Siegel des geschmiedeten Schicksals"
L["Garrison Invasion"] = "Garnisons-Invasion"
L["Bronze"] = "Bronze"
L["Silver"] = "Silber"
L["Gold"] = "Gold"
L["Palace Key"] = "Palastschl\195\188ssel"
L["LFR"] = "LFR"
L["Normal"] = "Normal"
L["Heroic"] = "Heroisch"
L["Mythic"] = "Mythisch"
L["Mogu'shan Vaults"] = "Mogu'shan-Gew\195\182lbe"
L["Heart of Fear"] = "Herz der Angst"
L["Terrace of Endless Spring"] = "Terasse des endlosen Fr\195\188hlings"
L["Throne of Thunder"] = "Der Thron des Donners"
L["Siege of Orgrimmar"] = "Schlacht um Orgrimmar"
L["Highmaul"] = "Hochfels"
L["Blackrock Foundry"] = "Schwarzfelsschmiede"
L["Shan'ze Ritual Stone"] = "Ritualstein der Shan'ze"
L["Lei Shen Palace Key"] = "Schl\195\188ssel zu Lei Shens Palast"
L["Thunder King Trove"] = "Schatztruhe des Donnerk\195\182nigs"
L["MoP"] = true
L["WoD"] = true
L["Weekly"] = "W\195\182chentlich"

-- No Longer Used
L["Yes"] = "Ja"
L["No"] = "Nein"
