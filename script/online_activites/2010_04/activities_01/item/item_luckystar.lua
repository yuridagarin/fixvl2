Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")
Include("\\script\\online_activites\\2010_09\\activites_02\\head.lua")
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\script\\vng\\config\\vng_feature.lua")

-- LUCKY_STAR_MAX_USE = 8
LUCKY_STAR_MAX_USE = 16
--LUCKY_STAR_MAX_USE = 24

-- TSK_LUCKY_STAR_201011 
-- hai so ( hang chuc + hang don vi ) luu so lan su dung trong ngay
-- so ( hang tram ) luu timer  : 
--     + 0: giay thu 15s 
--     + 1: giay thu 30s 
--     + 2: giay thu 45s 
--     + 3: giay thu 60s	
	
function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"))

	if nDate > 151231 then		
		Talk(1,"","Ng�i Sao May M�n �� h�t h�n s� d�ng!")
		return
	end
	
	if GetLevel() < 10 then
		Talk(1,"","Nh�n v�t ph�i c� ��ng c�p 10 tr� l�n m�i c� th� s� d�ng Ng�i Sao May M�n")
		return
	end
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return
	end	
	local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
	if (nPlayerMapId ~= 100 and nPlayerMapId ~= 150 and nPlayerMapId ~= 200 and nPlayerMapId ~= 300 and nPlayerMapId ~= 350 and nPlayerMapId ~= 400 and nPlayerMapId ~= 500) then
		Talk(1,"","Ng�i Sao May M�n ch� c� th� s� d�ng � 7 ��i th�nh th�!")
		return	
	end
	
	--local nLastDate = floor(GetTask(TSK_LUCKY_STAR_201011) / 100)	
	local nLastDate = floor(GetTask(TSK_LUCKY_STAR_201011) / 1000) 
	
	if nLastDate ~= nDate then
		
		-- SetTask(TSK_LUCKY_STAR_201011, nDate * 100)
		SetTask(TSK_LUCKY_STAR_201011, nDate * 1000)		 				   -- 101215000
	end
	
	--local nWDay = tonumber(date("%w"))
	--if nWDay == 0 or nWDay == 5 or nWDay == 6 then
	--	LUCKY_STAR_MAX_USE = 32
	--end
	
	-- local nUsed = mod(GetTask(TSK_LUCKY_STAR_201011), 10)	
	local nUsed = mod(GetTask(TSK_LUCKY_STAR_201011), 100) 				-- 2 so cuoi luu so lan su dung trong ngay
	
	if nUsed >= LUCKY_STAR_MAX_USE then
		Talk(1,"","M�i ng�y ch� c� th� s� d�ng "..LUCKY_STAR_MAX_USE.." Ng�i Sao May M�n")
		return
	end
	
	if GetTrigger(VET_201009_02_TIME_USER_DEFINE) ~= 0 then 							-- 0,1,2,3: tuong ung voi 15s, 30s, 45s, 60s
		Talk(1,"","B�n �ang s� d�ng 1 Ng�i Sao May M�n kh�c r�i!")
		return
	end
	
	-- local nTimes = floor(mod(GetTask(TSK_LUCKY_STAR_201011), 100) / 10)	   -- 
	local nTimes = floor(mod(GetTask(TSK_LUCKY_STAR_201011), 1000) / 100)	   -- ( lay so hang tram - luu trigger timer )  = 0
	
	if DelItemByIndex(nItemIdx, 1) == 1 then
		CreateTrigger(1, VET_201009_02_TIME_TB_DEFINE, VET_201009_02_TIME_USER_DEFINE);
        	ContinueTimer(GetTrigger(VET_201009_02_TIME_USER_DEFINE))
        	
        	-- luu so lan su dung trong ngay
        	SetTask(TSK_LUCKY_STAR_201011, GetTask(TSK_LUCKY_STAR_201011) + 1)
        	
        	-- SetTask(TSK_LUCKY_STAR_201011, GetTask(TSK_LUCKY_STAR_201011) - (nTimes * 10))  	-- Reset Timer
        	SetTask(TSK_LUCKY_STAR_201011, GetTask(TSK_LUCKY_STAR_201011) - (nTimes * 100))  	-- Reset Timer (so hang tram - luu timer ) 
        	
        	gf_WriteLogEx("Ngoi Sao May Man 201011", "s� d�ng")

        	VietLuckyStar()	--th�m nguy�n li�u event h�ng th�ng
        	Use_Award_NgoiSao() --ph�n th��ng khi s� d�ng Ng�i Sao        
        	if nUsed == 15 then
        		Use_Award_NgoiSao_16() --ph�n th��ng th� 16
        	end	
        	gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� Ng�i sao")		
        	----------- Chu�i nhi�m v� Chuy�n Sinh 6
        	local nCS6_NS =  floor(GetTask(TSK_CS6_COUNTB)/10000000)
			local nCS6_NS_Num = mod(GetTask(TSK_CS6_COUNTB),10000000)
			if mod(nCS6_NS,1000) < 160 and GetTask(TSK_CS6_TULINH) < 2 then
				nCS6_NS = (nCS6_NS + 1) * 10000000 + nCS6_NS_Num
				SetTask(TSK_CS6_COUNTB, nCS6_NS)
			end
	end
	
	if mod(GetTask(TSK_LUCKY_STAR_201011), 100) == 16 and nDate <= 130120 then
		gf_AddItemEx2({2,1,30030, 140}, "Ti�u Nh� Y1", "NIEN THU NHU Y", "ho�n th�nh 16 Ng�i Sao ")
	end
    --cdkey
    SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemLuckyStart()");

end
