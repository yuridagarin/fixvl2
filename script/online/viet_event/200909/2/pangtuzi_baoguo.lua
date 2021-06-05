GET_PANGTUZI_ID = 2432
GET_PANGTUZI_TIME_ID = 2433

-- file th�t nu�ng
Include("\\script\\online\\viet_event\\200911\\6\\head_bachtiensinh.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\award\\feature_award.lua")

function main()
	if GetTask(TSK_THONUONG_ACCEPT) ~= 1 then
		Talk(1, "", "B�n ch�a nh�n nhi�m v� n�n kh�ng th� tham gia b�n ti�c.");
		return 0
	end
	
	if GetLevel() < 73 then
		Talk(1,"","C�p 73 tr� l�n m�i c� th� tham gia b�n ti�c.")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","Gia nh�p m�n ph�i m�i c� th� tham gia b�n ti�c.")
		return 0
	end
	
	local nReputation = GetReputation()
	if nReputation < 3000 then
		Talk(1,"","��t 3000 �i�m danh v�ng tr� l�n m�i c� th� tham gia b�n ti�c.")
		return 0
	end

	local nDate = tonumber(date("%d"));
	local nTaskVal = GetTask(GET_PANGTUZI_ID)
	
	if GetByte(nTaskVal,1) ~= nDate then
		nTaskVal  = SetByte(nTaskVal,1,nDate)
		nTaskVal  = SetByte(nTaskVal,2,0)
		nTaskVal  = SetByte(nTaskVal,3,0)
		SetTask(GET_PANGTUZI_ID, nTaskVal)	
	end
	
	nTaskVal = GetTask(GET_PANGTUZI_ID)	
	
	-- m�i nh�n v�t thu�ng th�c ��ng 180 c�i / ng�y
	if GetByte(nTaskVal,2) >= 180 then
		Talk(1,"","M�i ng�y ch� c� th� th��ng th�c 180 Th�t N��ng.")
		return 0
	end	
	
	-- ? gm ds SetTask( 2432, SetByte ( GetTask(2432) , 2 , value) )
	-- value: s� l�n �n 	
	-- ?gm ds Msg2Player(GetByte(GetTask(100),3))	
	
	-- th�i gian gi�n c�ch hai l�n click v�o l� nu�ng l� 45 gi�y
	if GetTime() - GetTask(GET_PANGTUZI_TIME_ID) < 45 then
		Talk(1,"","B�n c�n "..GetTask(GET_PANGTUZI_TIME_ID) + 45 - GetTime().." gi�y m�i c� th� ti�p t�c th��ng th�c Th�t N��ng.")
		return 0
	end
	
	-- �i�m danh v�ng = 0  kh�ng th� nh�n th��ng	
	if ( GetReputation() == 0 ) then
		Talk(1,"","�i�m danh v�ng kh�ng ��.")
		return 0
	end
	
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	

	SetTask(GET_PANGTUZI_ID, SetByte(nTaskVal,2,GetByte(nTaskVal,2) + 1))
	SetTask(GET_PANGTUZI_TIME_ID,GetTime())
	local nExp, nRep, nRep1, nFaction, nFaction1 = 50000, 5, 2, 5, 2
	
	local nRand = random(1,100)
	if nRand <= 50 then	
		ModifyExp(nExp)
		Msg2Player("B�n nh�n ���c "..nExp.." Kinh nghi�m");
	else	
		AddItem(2,0,351,1)
		Msg2Player("B�n nh�n ���c 1 L� Th�y");	
	end
	
	--  ph�n th��ng th�ch th� n��ng
	--	ThoNuong_Award()		--Expired
	
	-- sau b�o tr� 4-12-2010 s� c� th�m t�nh n�ng n�y
	-- c� 10% bi tr� 1 �i�m danh v�ng
		
	local nRandReputation = random(1,100)
	if ( nRandReputation <= 10 ) then
		ModifyReputation ( -1,0 )   -- tr� 1 �i�m danh v�ng 
		
		if ( GetReputation() < 0 ) then
				ModifyReputation (0, 0)   -- set �i�m danh v�ng b�ng 0 l�i
		end
	end
	
	-- doi 45 gi�y m�i c� th� �n ���c n�a	
	StartTimeGuage("Th�t N��ng",45,0,1)	
		
	if GetTask(TSK_THONUONG_ACCEPT) == 1 then
		set_task_thonuong(BYTE_COUNT_COLLECT, get_task_thonuong(BYTE_COUNT_COLLECT) + 1)
		Msg2Player("Thu th�p Th�t N��ng "..get_task_thonuong(BYTE_COUNT_COLLECT).."/20")
		if get_task_thonuong(BYTE_COUNT_COLLECT) == 20 then
			SetTask(TSK_THONUONG_ACCEPT,2)
			-- Ph�n th��ng B�ch Ti�n Sinh
			BachTienSinh_Award();
			ThitNuong_NhanThuong()		--function BachTienSinh_Award s� chuy�n v�o function n�y
			TaskTip("Ho�n th�nh nhi�m v� thu th�p Th�t N��ng. Mau v� b�o cho B�ch Ti�n Sinh")
		end	
	end		
end