if ( GetLocale() ~= "ruRU" ) then
	return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("Carbonite.Weekly", "ruRU")
if not L then return end

L["Weekly Status Module"] = true
L["Weekly Status Options"] = true
L["General"] = true
L["Day Reset Occurs"] = true
L["Monday"] = "Понедельник"
L["Tuesday"] = "Вторник"
L["Wednesday"] = "Среда"
L["Thursday"] = "Четверг"
L["Friday"] = "Пятница"
L["Saturday"] = "Суббота"
L["Sunday"] = "Воскресенье"
L["Mobs"] = true
L["Place check boxes in the mobs you wish to track weekly kills."] = true
L["Lootables"] = true
L["Place check boxes in the weekly drops you wish to track."] = true
L["Place check boxes in the difficulties you want to track."] = true
L["Quests"] = "Заданий"								-- verify
L["Place check boxes in the weekly quests you want to track."] = true
L["Seal of Tempered Fate"] = "Печать закаленной судьбы"
L["Seals of Tempered Fate"] = "Печать закаленной судьбы"
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
L["Sha of Anger"] = "Ша Злости"
L["Galleon"] = "Галеон"
L["Nalak, The Storm Lord"] = "Налак, Повелитель Гроз"
L["Oondasta"] = "Ундаста"
L["Celestials"] = "Небожителя"							-- verify
L["Ordos"] = "Ордос, Огненный бог яунголов"
--WoD
L["Rukhmar"] = "Рухмар"
L["Drov the Ruiner"] = "Дров Крушитель"
L["Tarlna the Ageless"] = "Тарлна Нестареющий"

L["The Crumbled Chamberlain"] = "Древний хранитель ключей"
L["Tempered Fate Seals"] = true
L["Garrison Invasion"] = true
L["Bronze"] = true
L["Silver"] = true
L["Gold"] = true
L["Palace Key"] = true
L["LFR"] = "Поиск рейдов"							-- verify
L["Normal"] = "Обычный режим"							-- verify
L["Heroic"] = "Героический режим"						-- verify
L["Mythic"] = "Эпохальный режим"						-- verify
L["Mogu'shan Vaults"] = "Подземелья Могу'шан"
L["Heart of Fear"] = "Сердце Страха"
L["Terrace of Endless Spring"] = "Терраса Вечной Весны"
L["Throne of Thunder"] = "Престол Гроз"
L["Siege of Orgrimmar"] = "Осада Оргриммара"
L["Highmaul"] = "Верховный Молот"
L["Blackrock Foundry"] = "Литейная клана Черной горы"
L["Shan'ze Ritual Stone"] = "Ритуальный камень Шань'цзэ"
L["Lei Shen Palace Key"] = "Ключ от дворца Лэй Шэня"
L["Thunder King Trove"] = true
L["MoP"] = true
L["WoD"] = true
L["Weekly"] = true