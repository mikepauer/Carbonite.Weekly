if ( GetLocale() ~= "itIT" ) then
	return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("Carbonite.Weekly", "itIT")
if not L then return end

L["Weekly Status Module"] = "Modulo Stato Settimanali"
L["Weekly Status Options"] = "Opzioni Stato Settimanali"
L["General"] = "Generale"
L["Day Reset Occurs"] = "Giorno di Reset"
L["Monday"] = "Luned\195\172"
L["Tuesday"] = "Marted\195\172"
L["Wednesday"] = "Mercoled\195\172"
L["Thursday"] = "Gioved\195\172"
L["Friday"] = "Venerd\195\172"
L["Saturday"] = "Sabato"
L["Sunday"] = "Domenica"
L["Mobs"] = true
L["Place check boxes in the mobs you wish to track weekly kills."] = "Metti un segno di spunta al mob di cui vuoi tracciare le kill settimanali"
L["Lootables"] = "Lista Ricompense"
L["Place check boxes in the weekly drops you wish to track."] = "Metti un segno di spunta alla ricompensa che vuoi tracciare"
L["Place check boxes in the difficulties you want to track."] = "Metti un segno di spunta sulla difficolt\195\160 che vuoi tracciare"
L["Quests"] = "Missioni"
L["Place check boxes in the weekly quests you want to track."] = "Metti un segno di spunta sulle missioni settimanali che vuoi tracciare"
L["Seal of Tempered Fate"] = "Sigillo del Fato Temprato"
L["Seals of Tempered Fate"] = "Sigilli del Fato Temprati"
L["Place check boxes in the raid progress you want to track."] = "Metti un segno di spunta sui progressi Raid che vuoi tracciare"
L["Show Weekly Objectives"] = "Mostra Obiettivi Settimanali"
L["-Weekly Tracker-"] = "-Settimanali-"
L["Toggle Weekly List"] = "Dis/Attiva Lista Settimanali"
L["Weekly Tracker: %d characters - Reset In %s"] = "Traccia Settimanale: %d personaggi - Reset in %s"
L["Killed"] = "Ucciso"
L["Not Killed"] = "Non Ucciso"
L["Unknown"] = "Sconosciuto"
L["Looted"] = "Depredato"
L["Not Looted"] = "Non Depredato"
L["Completed"] = "Completato"
L["Not Completed"] = "Non Completato"

-- Bosses
-- MoP
L["Sha of Anger"] = "Sha della Rabbia"
L["Galleon"] = true
L["Nalak, The Storm Lord"] = true
L["Oondasta"] = true
L["Celestials"] = "Celestiali"
L["Ordos"] = true
--WoD
L["Rukhmar"] = true
L["Drov the Ruiner"] = "Drov il Polverizzatore"
L["Tarlna the Ageless"] = "Tarlna il Senza Et\195\160"

L["The Crumbled Chamberlain"] = "Il Ciambellano Sbriciolato"
L["Tempered Fate Seals"] = "Sigilli del Fato Temprati"
L["Garrison Invasion"] = "Invasione della Guarnigione"
L["Bronze"] = "Bronzo"
L["Silver"] = "Argento"
L["Gold"] = "Oro"
L["Palace Key"] = "Chiave del Palazzo"
L["LFR"] = "RDI"
L["Normal"] = "Normale"
L["Heroic"] = "Eroica"
L["Mythic"] = "Mitica"
L["Mogu'shan Vaults"] = "Segrete Mogu'shan"
L["Heart of Fear"] = "Cuore della Paura"
L["Terrace of Endless Spring"] = "Terrazza dell'Infinita Primavera"
L["Throne of Thunder"] = "Trono del Tuono"
L["Siege of Orgrimmar"] = "Assedio ad Orgrimmar"
L["Highmaul"] = "Altomaglio"
L["Blackrock Foundry"] = "Fonderia Rocciascura"
L["Shan'ze Ritual Stone"] = "Pietra Rituale Shan'ze"
L["Lei Shen Palace Key"] = "Chiave del Palazzo di Lei Shen"
L["Thunder King Trove"] = true
L["MoP"] = true
L["WoD"] = true
L["Weekly"] = true

-- No Longer Used
L["Yes"] = "Si"
L["No"] = "No"
