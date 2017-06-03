if ( GetLocale() ~= "zhTW" ) then
	return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("Carbonite.Weekly", "zhTW")
if not L then return end

L["Weekly Status Module"] = "週常狀態模組"
L["Weekly Status Options"] = "週常狀態選項"
L["General"] = "一般"
L["Day Reset Occurs"] = "週常重置日"
L["Monday"] = "週一"
L["Tuesday"] = "週二"
L["Wednesday"] = "週三"
L["Thursday"] = "週四"
L["Friday"] = "週五"
L["Saturday"] = "週六"
L["Sunday"] = "週日"
L["Mobs"] = "世界首領"
L["Place check boxes in the mobs you wish to track weekly kills."] = "請勾選你想追蹤擊殺狀態的世界首領"
L["Lootables"] = "可拾取物品"
L["Place check boxes in the weekly drops you wish to track."] = "請勾選你想追蹤拾取狀態的物品"
L["Place check boxes in the difficulties you want to track."] = true
L["Quests"] = "週常任務"
L["Place check boxes in the weekly quests you want to track."] = "請勾選你想追蹤完成狀態的任務"
L["Seal of Tempered Fate"] = "淬鍊命運徽印"
L["Seals of Tempered Fate"] = "淬鍊命運徽印"
L["Place check boxes in the raid progress you want to track."] = "請勾選你想追蹤的團隊進度"
L["Show Weekly Objectives"] = "顯示週常目標"
L["-Weekly Tracker-"] = "週常追蹤器"
L["Toggle Weekly List"] = "切換週常列表"
L["Weekly Tracker: %d characters - Reset In %s"] = "週常追蹤： %d 角色 - 將於 %s 後重置"
L["Killed"] = "已擊殺"
L["Not Killed"] = "未擊殺"
L["Unknown"] = "未知"
L["Looted"] = "已被拾取"
L["Not Looted"] = "未被拾取"
L["Completed"] = "已完成"
L["Not Completed"] = "未完成"

-- Bosses
-- MoP
L["Sha of Anger"] = "憤怒之煞"
L["Galleon"] = "蓋里昂"
L["Nalak, The Storm Lord"] = "「風暴龍王」納拉卡"
L["Oondasta"] = "烏達斯塔"
L["Celestials"] = "沙利斯的劫掠兵團"
L["Ordos"] = "歐朵斯"
--WoD
L["Rukhmar"] = "魯克馬爾"
L["Drov the Ruiner"] = "「毀滅者」德羅夫"
L["Tarlna the Ageless"] = "「不朽者」塔爾納"

L["The Crumbled Chamberlain"] = "崩壞的司庫"
L["Tempered Fate Seals"] = "淬鍊命運徽印"
L["Garrison Invasion"] = "要塞入侵"
L["Bronze"] = "青銅"
L["Silver"] = "白銀"
L["Gold"] = "黃金"
L["Palace Key"] ="皇宮鑰匙"
L["LFR"] = "團隊隨機"
L["Normal"] = "普通"
L["Heroic"] = "英雄"
L["Mythic"] = "傳奇"
L["Mogu'shan Vaults"] = "魔古山寶庫"
L["Heart of Fear"] = "恐懼之心"
L["Terrace of Endless Spring"] = "豐泉台"
L["Throne of Thunder"] = "雷霆王座"
L["Siege of Orgrimmar"] = "圍攻奧格瑪"
L["Highmaul"] = true
L["Blackrock Foundry"] = "黑石鑄造場"
L["Shan'ze Ritual Stone"] = "衫織儀式石"
L["Lei Shen Palace Key"] = "雷神皇宮鑰匙"
L["Thunder King Trove"] = "雷王寶箱"
L["MoP"] = "潘達利亞的迷霧"
L["WoD"] = "德拉諾之霸"
L["Weekly"] = true

-- No Longer Used
L["Yes"] = "是"
L["No"] = "否"
