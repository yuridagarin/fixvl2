--=============================================
--create by baiyun 2009.9.14
--describe:Խ��2009��9�¹���ս�޸ģ���Ͷ��ս�����ʵ��
--=============================================
--��ս�� 		2,1,30117
--�ɶ��Ѳ��� 2,1,30118
--�з����� 	 2,1,30119
--�ɶ�֮ӡ 	 2,1,30120
--�ɶ��ɰ��� 

Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")

File_name = "\\script\\missions\\bw\\siege\\jingtoutiaozhanling.lua";
--������Ͷ��ս��
function baobing_jingtoutiaozhanling()
	local szTong = GetTongName();
	local nYear = tonumber(date("%Y"));
	local nDay = tonumber(date("%m%d"));
	
	if IsTongMaster() == 0 then
		Talk(1,"","<color=green> Ch� l�i ��i<color>: Ch� c� bang ch� m�i c� th� b�o danh ��u gi� khi�u chi�n l�nh.")
		return 0
	end
	
	-- �ǹ��ǻ����سǷ�����һ��
	for index, value in tFightCityName do
		local szAttack, szDefence = GetCityWarAD(index)
		if szTong == szAttack then
			Talk(1,"","B�n �� l� ng��i c�a "..value.." b�n c�ng, kh�ng th� b�o danh ��u gi� khi�u chi�n l�nh th�m l�n n�a")
			return 0
		end
		if szTong == szDefence then
			Talk(1,"","B�n �� l� ng��i c�a "..value.." b�n th�, kh�ng th� b�o danh ��u gi� khi�u chi�n l�nh th�m l�n n�a.")
			return 0
		end
	end
	
	-- �Ƿ��ǰ���

	
	-- ����������λ7������
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","<color=green> Ch� l�i ��i<color>: Th�i gian t�i v� c�a c�c h� �t h�n 7 ng�y, kh�ng th� b�o danh ��u gi� khi�u chi�n l�nh")
		return 0
	end
	
	-- 80������
	local nLevel = GetLevel();
	if nLevel < 80 then
		Talk(1,"","<color=green> Ch� l�i ��i<color>: C�p b�c c�c h� kh�ng �� 80, kh�ng th� b�o danh ��u gi� khi�u chi�n l�nh")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green> Ch� l�i ��i<color>: C�c h� ch�a gia nh�p m�n ph�i, kh�ng th� b�o danh ��u gi� khi�u chi�n l�nh")
		return 0
	end
	
	ApplyRelayShareData("tiaozhanling",0,0,File_name,"baoming_callback")
end

function baoming_callback(szKey, nKey1, nKey2, nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));
	local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", nKey1, nKey2, szTong);
	DelRelayShareDataCopy("tiaozhanling",nKey1,nKey2);
	if (not nNum) or (not nLastDate) then
		if DelItem(2,1,1200,1) ~= 1 then
			Talk(1,"","<color=green> Ch� l�i ��i<color>: Xin h�y mang th� ti�n c� �� b�o danh khi�u chi�n l�nh");
			return 0;
		end
		if AddRelayShareData("tiaozhanling", nKey1, nKey2, File_name, "nothing", 2, szTong, "dds", 0, nDate, szTong) == 1 then
			Talk(1,"","<color=green> Ch� l�i ��i<color>: Bang ch� �� b�o danh ��u gi� khi�u chi�n l�nh th�nh c�ng, qu� tr�nh ��u gi� s� b�t ��u v�o 19:40, xin bang ch� l�u �!");
			SetGlbValue(1020,GetGlbValue(1020) + 1)
		end
	else
		if nLastDate < nDate then
			if DelItem(2,1,1200,1) ~= 1 then
				Talk(1,"","<color=green> Ch� l�i ��i<color>: Xin h�y mang th� ti�n c� �� b�o danh khi�u chi�n l�nh");
				return 0;
			end
			if AddRelayShareData("tiaozhanling", nKey1, nKey2, File_name, "nothing", 2, szTong, "dds", 0, nDate, szTong) == 1 then
				Talk(1,"","<color=green> Ch� l�i ��i<color>: Bang ch� �� b�o danh ��u gi� khi�u chi�n l�nh th�nh c�ng, qu� tr�nh ��u gi� s� b�t ��u v�o 19:40, xin bang ch� l�u �!");
				SetGlbValue(1020,GetGlbValue(1020) + 1)
			end
		else
			Talk(1, "", "<color=green> Ch� l�i ��i<color>: Qu� bang ch� �� giao n�p th� ti�n c� r�i.");
		end
	end
end

function jingtou_tiaozhanling()
	if IsTongMaster() == 0 then
		Talk(1,"","<color=green> Ch� l�i ��i<color>: Ch� c� bang ch� m�i c� th� ��u gi� khi�u chi�n l�nh")
		return 0
	end
	ApplyRelayShareData("tiaozhanling",0,0,File_name,"jingtou_callback");
end

function jingtou_callback(szKey, nKey1, nKey2, nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));	
	
	local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", nKey1, nKey2, szTong);
	DelRelayShareDataCopy("tiaozhanling",nKey1,nKey2);
	if (not nNum) or (not nLastDate) then
		Talk(1, "", "<color=green> Ch� l�i ��i<color>: Bang h�i c�a c�c h� ch�a b�o danh ��u gi� khi�u chi�n l�nh");
	else
		if nLastDate < nDate then
			Talk(1, "", "<color=green> Ch� l�i ��i<color>: Bang h�i c�a c�c h� ch�a b�o danh ��u gi� khi�u chi�n l�nh");
		else
			local nCount = 1;
			local nPreCount = GetItemCount(2,1,30117);
			if nPreCount > 999 then
				nPreCount = 999;
			end
			SetTaskTemp(103, nNum);
			
			AskClientForNumber("give_tiaozhanling", nCount, nPreCount, "��i hi�p mu�n giao n�p bao nhi�u khi�u chi�n l�nh?");
		end
	end
end

function give_tiaozhanling(nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));
	if nCount == 0 then
		return 0;
	end
	if DelItem(2, 1, 30117, nCount) == 1 then
		AddRelayShareData("tiaozhanling", 0,0,File_name, "nothing", 2, szTong, "dds", nCount + GetTaskTemp(103), nDate, szTong);
		Talk(1, "", "<color=green> Ch� l�i ��i<color>: Ng��i �� thay b�n bang h�i giao n�p "..nCount.." khi�u chi�n l�nh");
		WriteLogEx("Cong Thanh Chien","n�p",nCount,"Khi�u Chi�n L�nh","",GetTongName())
	else
		Talk(1, "", "<color=green> Ch� l�i ��i<color>: C�c h� mang khi�u chi�n l�nh kh�ng ��, h�y ki�m tra l�i s� l��ng khi�u chi�n l�nh");
		return 0;
	end
end

--�鿴���ﾺͶ��ս������
function view_tiaozhanling()
	ApplyRelayShareData("tiaozhanling",0,0,File_name,"view_callback");
end

function view_callback(szKey, nKey1, nKey2, nCount)
	local szTong = GetTongName();
	local nDate = tonumber(date("%y%m%d"));
	
	local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", 0, 0, szTong);
	DelRelayShareDataCopy("tiaozhanling",0,0);
	if (not nNum) or (not nLastDate) then
		Talk(1, "", "<color=green> Ch� l�i ��i<color>: Bang h�i c�a c�c h� ch�a b�o danh ��u gi� khi�u chi�n l�nh");
	else
		if nLastDate < nDate then
			Talk(1, "", "<color=green> Ch� l�i ��i<color>: Bang h�i c�a c�c h� ch�a b�o danh ��u gi� khi�u chi�n l�nh");
		else
			Talk(1, "", "<color=green> Ch� l�i ��i<color>: Hi�n gi� bang h�i c�a c�c h� �� n�p khi�u chi�n l�nh "..nNum.." c�i r�i.");
		end
	end
end

function nothing()

end

function main()
	if tonumber(date("%w")) == 5 then
		PlayerIndex = FirstPlayer()
		if SubWorldID2Idx(300) > 0 then
			ApplyRelayShareData("gongchengtype",0,0,File_name,"get_type_jingtou");				
		end		
	end
end

function get_type_jingtou(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		SetGlbValue(CITY_GLB_VALUE_TYPE, 1);		
	else
		local nType = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
		DelRelayShareDataCopy(szKey,nKey1,nKey2);
		if nType == 0 then
			SetGlbValue(CITY_GLB_VALUE_TYPE, 1);			
		else
			SetGlbValue(CITY_GLB_VALUE_TYPE, nType);			
		end
	end
	if GetGlbValue(CITY_GLB_VALUE_TYPE) == 2 then
		ApplyRelayShareData("tiaozhanling",0,0,File_name,"main_callback");		
	end
end

function view_all_tiaozhanling()
	local nCount = GetGlbValue(1020) or 0	
	Talk(1,"","Hi�n t�i c� "..nCount.." bang h�i b�o danh ��u gi� Khi�u Chi�n L�nh.")
end

function main_callback(szKey, nKey1, nKey2, nCount)
	local nDate = tonumber(date("%y%m%d"));	
	if nCount ~= 0 then
		local _, nNum, nLastDate, szTong = GetRelayShareDataByIndex(szKey, nKey1, nKey2, 0);
		
		if nDate == nLastDate then
			SetCityWarAttack(CITY_ID_CD, szTong);			
		end
		
		local szA, szD = GetCityWarAD(CITY_ID_CD)
		
		if szD ~= "" then						-- ������سǷ�
			SetCityWarAttack(CITY_ID_CD, szTong)
			szTong = replace(szTong, "|" ,"-")
			Msg2SubWorld("Ch�c m�ng bang h�i:"..szTong.." Bang h�i nh�n ���c "..tFightCityName[CITY_ID_CD].."_t� c�ch c�ng th�nh")
			AddGlobalNews("Ch�c m�ng bang h�i:"..szTong.." Bang h�i nh�n ���c "..tFightCityName[CITY_ID_CD].."_t� c�ch c�ng th�nh")
			WriteLogEx("Cong Thanh Chien",szTong.." nh�n ���c "..tFightCityName[CITY_ID_CD].."_t� c�ch c�ng th�nh")			
		elseif szD == "" then					-- ���û���سǷ�����ֱ��ռ�г���
			SetCityWarWinner(CITY_ID_CD, szTong)
			szTong = replace(szTong, "|" ,"-")
			Msg2SubWorld("Ch�c m�ng bang h�i:"..szTong.." �� chi�m ���c "..tFightCityName[CITY_ID_CD])
			AddGlobalNews("Ch�c m�ng bang h�i:"..szTong.." �� chi�m ���c "..tFightCityName[CITY_ID_CD])
			WriteLogEx("Cong Thanh Chien",szTong.." �� chi�m ���c "..tFightCityName[CITY_ID_CD])			
		end		
	end
end
