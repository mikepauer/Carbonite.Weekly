if ( GetLocale() ~= "koKR" ) then
	return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("Carbonite.Weekly", "koKR")
if not L then return end

L["Weekly Status Module"] = "주간 상태 모듈"
L["Weekly Status Options"] = "주간 상태 옵션"
L["General"] = "일반"
L["Day Reset Occurs"] = "서버 점검 요일"
L["Monday"] = "월요일"
L["Tuesday"] = "화요일"
L["Wednesday"] = "수요일"
L["Thursday"] = "목요일"
L["Friday"] = "금요일"
L["Saturday"] = "토요일"
L["Sunday"] = "일요일"
L["Mobs"] = "몬스터"
L["Place check boxes in the mobs you wish to track weekly kills."] = "매주 처치 여부를 추적할 몬스터를 선택하십시오."
L["Lootables"] = "전리품"
L["Place check boxes in the weekly drops you wish to track."] = "매주 획득 여부를 추적할 전리품을 선택하십시오."
L["Place check boxes in the difficulties you want to track."] = true
L["Quests"] = "퀘스트"
L["Place check boxes in the weekly quests you want to track."] = "매주 수행 여부를 추적할 퀘스트를 선택하십시오."
L["Seal of Tempered Fate"] = true
L["Seals of Tempered Fate"] = true
L["Place check boxes in the raid progress you want to track."] = "추적하고자 하는 공격대 확인란을 선택하십시오."
L["Show Weekly Objectives"] = "주간 목표 보기"
L["-Weekly Tracker-"] = "-주간 추적-"
L["Toggle Weekly List"] = "주간 목록 전환"
L["Weekly Tracker: %d characters - Reset In %s"] = "주간 추적: %d 개의 캐릭터 - %s 후 재설정"
L["Killed"] = "처치"
L["Not Killed"] = "처치 안함"
L["Unknown"] = "알수없음"
L["Looted"] = "획득"
L["Not Looted"] = "획득 실패"
L["Completed"] = "완료"
L["Not Completed"] = "완료 안함"

-- Bosses
-- MoP
L["Sha of Anger"] = "분노의 샤"
L["Galleon"] = "갈레온"
L["Nalak, The Storm Lord"] = "나락크"		-- need retranslation
L["Oondasta"] = "운다스타"
L["Celestials"] = "천신"
L["Ordos"] = "오르도스"
--WoD
L["Rukhmar"] = true
L["Drov the Ruiner"] = true
L["Tarlna the Ageless"] = true

L["The Crumbled Chamberlain"] = "부스러진 시종장"
L["Tempered Fate Seals"] = true
L["Garrison Invasion"] = true
L["Bronze"] = true
L["Silver"] = true
L["Gold"] = true
L["Palace Key"] = "궁전으로 통하는 문의 열쇠"
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
L["Shan'ze Ritual Stone"] = "샨쩌 의식용 돌"
L["Lei Shen Palace Key"] = "레이 션 궁전으로 통하는 문의 열쇠"
L["Thunder King Trove"] = "천둥왕의 발견물"
L["MoP"] = true
L["WoD"] = true
L["Weekly"] = true

-- No Longer Used
L["Warforged Seals"] = "전쟁벼림 인장"
L["Warforged Seals Quest"] = "전쟁벼림 인장 퀘스트"
L["The Crumbled Chamberlain Quest"] = "부스러진 시종장 퀘스트"
