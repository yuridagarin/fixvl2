
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII Ұ�Žű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\gmscript.lua")
--Include("\\script\\global\\skills_table.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--�ٻ�����һ

TASK_JUE_NUM = 540   --08��ʢ����ɽ�汾ϴ��Ҫ���� ����Ϊ���

function main()
  if random(1,15) == 1 then
		NpcChat(GetTargetNpc()," M� t�i li�u tr�n trang ch� V� L�m Truy�n K� 2 �� tham kh�o v� s�n h� linh ��ng, kh�m n�m Linh Th�ch, b� �� B�t qu�i!");
	end;

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()

	if (nState==100) then
		
		task_000_00();
		return
		
	elseif (nState==6) then
	
		task_006_00();
		return
		
	elseif (nState==7) then
	
		if nLevel>=4 then
			task_007_00();
			return
		end;
		
	elseif (nState==10) then
	
		task_010_00();
		return

	elseif (nState==11) then
	
		if nLevel>=6 then
			task_011_00();
			return
		end;

	elseif (nState==14) then
	
		task_014_00();
		return

	elseif (nState==15) then
	
		Say("�� t�m ���c b�n h�u r�i �?",
			4,
			"��ng r�i/teach_team_001",
			"Ch�a t�m ���c ai th�ch h�p!/teach_team_004",
			"L�m sao mang t�i ��y/teach_team_002",
			"Ch�a c�!/teach_team_003");
		return
		
	elseif (nState==16) then
		
		if nLevel>=8 then
			task_016_00();
			return
		end;
		
	elseif (nState==17) then
	
		task_017_00();
		return

	elseif (nState==19) then
	
		task_019_00();
		return
		
	elseif (nState==20) then
		
		if nLevel>=9 then
			task_020_00();
			return
		end;

	elseif (nState==24) then
		
		if nLevel>=10 then
			task_024_00();
			return
		end;
		
	elseif (nState>=1) and (nState<24) then -- �м�״̬
		
		local i,j;
		local strMain = {
			[1] = "Sao ng��i ch�a �i g�p Ch� ti�m v� kh�? Tr� l�i ��y l�m g�?",
			[2] = "Sao ng��i ch�a �i g�p Ch� ti�m ph�c trang? Tr� l�i ��y l�m g�?",
			[3] = "Sao ng��i ch�a �i g�p Ch� Kim ho�n? Tr� l�i ��y l�m g�?",
			[4] = "Sao ng��i ch�a �i g�p Ch� d��c �i�m? Tr� l�i ��y l�m g�?",
			[5] = "Sao ng��i ch�a �i g�p Ch� T�p h�a? Tr� l�i ��y l�m g�?"
		}
		
		for i,j in strMain do
			if TE_GetTeachState()==i then
				Say(strMain[i],0);
				return
			end;
		end;
		
	elseif (nState>=1) then
		if (GetPlayerFaction() > 0) then
			if attr_point_readd_date_chk() ~= 1 then
				local strtab = {
					"Nh�n ph�n th��ng/callback_talk",
					"��n th�m D� T�u/main_exit"
				};
				if callback_date_check() == 1 then
					tinsert(strtab,2,"Ta mu�n tr� th��ng/restore_all");
				end
				Say("<color=green>D� T�u<color>: Ta �� d�y cho ng��i t�t c� nh�ng g� ta bi�t r�i, ng��i c�n ��n ��y l�m g� v�y?",
					getn(strtab),
					strtab);
			else
				attr_point_readd_dia()
			end
			return
		else
			local strtab = {
				"T�y �i�m ti�m n�ng./main_point",
--				"Tr� th��ng./main_restore",
				"Nh�n ph�n th��ng/callback_talk",
				--"��Ҫ������װ��������������ľ�Ҫȡ��/remove_addendar",
				"��n th�m D� T�u/main_exit"			
				};
			if callback_date_check() == 1 then
				tinsert(strtab,4,"Ta mu�n tr� th��ng/restore_all");
			end				
			Say("Ta c� th� gi�p g� cho b�ng h�u?",
				getn(strtab),
				strtab);
			return
		end;
	end;
	
	if (GetPlayerFaction() > 0) then
		if attr_point_readd_date_chk() ~= 1 then
			local strtab = {
				"Nh�n ph�n th��ng/callback_talk",
				"��n th�m D� T�u/main_exit"
			};
			if callback_date_check() == 1 then
				tinsert(strtab,2,"Ta mu�n tr� th��ng/restore_all");
			end			
			Say("<color=green>D� T�u<color>: Ta �� d�y cho ng��i t�t c� nh�ng g� ta bi�t r�i, ng��i c�n ��n ��y l�m g� v�y?",
				getn(strtab),
				strtab);
		else
			attr_point_readd_dia()
		end
		return
	else
		local strtab = {
			"T�y �i�m ti�m n�ng./main_point",
--			"Tr� th��ng./main_restore",
			"Nh�n ph�n th��ng/callback_talk",
			--"��Ҫ������װ��������������ľ�Ҫȡ��/remove_addendar",
			"��n th�m D� T�u/main_exit"			
			};
		if callback_date_check() == 1 then
			tinsert(strtab,4,"Ta mu�n tr� th��ng/restore_all");
		end				
		Say("Ta c� th� gi�p g� cho b�ng h�u?",
			getn(strtab),
			strtab);
	end;
end

--=========================================
--�峤207-06-29�������ϴ�㹦��
--�Ի�
function attr_point_readd_dia()
	Say("<color=green>D� T�u<color>: Ta �� d�y cho ng��i t�t c� nh�ng g� ta bi�t r�i, ng��i c�n ��n ��y l�m g� v�y?",
		2,
--		"��Ҫ������װ��������������ľ�Ҫȡ��/remove_addendar",
		"�� m� k� n�ng m�i r�i, ta mu�n t�y �i�m /attr_point_readd",
		"��n th�m D� T�u/nothing"
		)

end
--ϴ��
function attr_point_readd()
	Say("<color=green>D� T�u<color>: Tr��c <color=yellow>23h ng�y 4/5/2008<color>, c� th� <color=yellow>��n ��y<color> �� <color=yellow>t�y �i�m<color>, b�n x�c nh�n mu�n <color=yellow>t�y �i�m<color>?",
	2,
	"Ta mu�n t�y �i�m/confirm_xidian",
	"Ta v�n ch�a quy�t ��nh/nothing"
	)
end
--ʱ����
function attr_point_readd_date_chk()
	local date_now = tonumber(date("%Y%m%d%H"))
	if date_now >= 2008032710 and date_now <= 2008050423 then
		return 1
	else
		return 0
	end
end
--=========================================
function nothing()

end;

function remove_addendar()
	local nCount = GetTask(TASK_JUE_NUM);
	local selTab = {
			"Ta mu�n th�o y�u quy�t g�n tr�n b� k�p/remove_addendar_confirm",
			"�� ta ngh� l�i ��/nothing",
			}
	Say("<color=green>D� T�u<color>: Tr��c <color=yellow>23h ng�y 10/4/2008, ng��i c� th� ��n t�m l�o phu th�o y�u quy�t g�n tr�n b� k�p, <color=yellow>l�u �, m�i ng��i ch� ���c mi�n ph� 5 l�n, ng��i c�n c� th� th�o "..(5-nCount).." l�n. <color>Ng��i c� mu�n <color=yellow>th�o y�u quy�t<color> kh�ng?",
	getn(selTab),
	selTab
	)
end;
--���ؾ�Ҫ��������Ҫ�ַ�������Ҫ����table����ҪIDtable
function get_addendar_info()
	local tbAddendarName = {"", "", "", ""}
	local tbAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		tbAddendarName[i + 1], tbAddendarID[i + 1] = GetBookAddendarName(i)
		if (tbAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	if nAddendarCount == 0 then
		return 0,"",tbAddendarName,tbAddendarID;
	end;
	local strPages = "";
	for i=1,4 do	--���ֻ�����ž�Ҫ
		if tbAddendarName[i] ~= "" then
			strPages = strPages..tbAddendarName[i]..", ";
		end;
	end;
	strPages = strsub(strPages,1,strlen(strPages)-2);
	return nAddendarCount,strPages,tbAddendarName,tbAddendarID;
end;

function remove_addendar_confirm()
	if GetTask(TASK_JUE_NUM) >= 5 then
		Talk(1,"","<color=green>D� T�u<color>: M�i ng��i ch� ���c mi�n ph� 5 l�n, thi�u hi�p �� th�o 5 l�n r�i.");
		return
	end
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","<color=green>D� T�u<color>: Thi�p hi�p h�y trang b� b� k�p tr��c ��, n�u kh�ng l�m sao l�o phu bi�t �� l� b� k�p n�o ch�.");
		return 0;
	end;
	local nAddendarCount,strPages = get_addendar_info();
	if nAddendarCount == 0 then
		Talk(1,"","<color=green>D� T�u<color>: L� n�o thi�u hi�p �ang ��a v�i l�o phu sao, b� k�p n�y c� y�u quy�t g� ch�?");
		return 0;
	end;
	local selTab = {
				"���c/remove_addendar_confirm_final",
				"�� ta suy ngh�/nothing",
				}
	Say("<color=green>D� T�u<color>: ���c, thi�u hi�p nh�n k� ��y, b� k�p n�y c� th� th�o <color=yellow>"..strPages.."<color><color=yellow>"..nAddendarCount.."<color> y�u quy�t, ng��i mu�n nh�n nh�ng y�u quy�t n�y ch�?",getn(selTab),selTab);
end;

function remove_addendar_confirm_final()
	if GetTask(TASK_JUE_NUM) >= 5 then
		Talk(1,"","<color=green>D� T�u<color>: M�i ng��i ch� ���c mi�n ph� 5 l�n, thi�u hi�p �� th�o 5 l�n r�i.");
		return
	end
	if gf_JudgeRoomWeight(4,10) == 0 then
		Talk(1,"","<color=green>D� T�u<color>: H�y ki�m tra l�i xem, n�u nh�n y�u quy�t m� kh�ng d�ng ���c, h� ch�ng ph�i l� tr� c��i cho thi�n h� sao?");
		return 0;
	end;
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","<color=green>D� T�u<color>: Thi�p hi�p h�y trang b� b� k�p tr��c ��, n�u kh�ng l�m sao l�o phu bi�t �� l� b� k�p n�o ch�.");
		return 0;
	end;
	if IsBookLocked() > 0 then
		Talk(1,"","<color=green>D� T�u<color>: B� k�p c�a ng��i �ang kho�, kh�ng th� th�o y�u quy�t!")
		return 0;
	end
	local nAddendarCount,strPages,tbAddendarName,tbAddendarID = get_addendar_info();
	if nAddendarCount == 0 then
		Talk(1,"","<color=green>D� T�u<color>: L� n�o thi�u hi�p �ang ��a v�i l�o phu sao, b� k�p n�y c� y�u quy�t g� ch�?");
		return 0;
	end;
	local nCurCount = GetTask(TASK_JUE_NUM);
	SetTask(TASK_JUE_NUM,nCurCount+1);
	local strName,nID = "",0;
	local nRetCode = 0;
	for i=1,4 do
		strName,nID = GetBookAddendarName(0);
		if nID ~= -1 then
			RemoveAddendarFromBook(0);
			nRetCode = AddItem(2, 6, nID, 1);
			if nRetCode == 1 then
				Msg2Player("B�n �� th�o th�nh c�ng"..strName);
				WriteLog("[Nh�n y�u quy�t D� T�u]"..GetName().."�� th�o"..strName);
			else
				WriteLog("[D� T�u th�o y�u quy�t b� l�i]"..GetName().." th�o "..strName.." b� l�i, nRetCode:"..nRetCode);
			end;
		end;
	end;
	WriteLog("[Nh�n y�u quy�t D� T�u]:"..GetName().."th�"..(nCurCount+1).." l�n y�u quy�t");
end;

-- ���ϴǱ�ܵ�ĺ���
function test_free_clean_points()
	Say("��y l� ti�n ��n qu� hi�m, ta ch� c� th� cho ng��i s� d�ng 1 vi�n. Ng��i x�c nh�n th�t s� c�n d�ng ch�?",
		2,
		"X�c nh�n/confirm_free_clean_points",
		"Sau n�y h�y t�nh./exit_free_clean_points")
end;
-- ȷ����Ҫ���ϴ�㣬����ϴ��
function confirm_free_clean_points()
	ResetProperty()
	SetTask(99, 27)
	Say("Ng��i �� t�y ���c �i�m ti�m n�ng. L�n sau ph�i c�n th�n nh�!", 0)
end;
-- ��ʱ��Ҫ���ϴǱ�ܵ�ĺ���
function exit_free_clean_points()
	Say("���c! Nh�ng l�n sau ph�i ��n s�m! Ch�m tr� l� h�t ti�n ��n, ta kh�ng th� gi�p ng��i t�y �i�m ti�m n�ng ��u!", 0)
end;
--======================================================


function teach_team_001()
local nMemCount = GetTeamSize()
	if (nMemCount == 0) or (nMemCount == 1) then
		task_015_check(2)
	else
		task_015_check(1)
	end
	return
end

function teach_team_002()
	task_015_check(3)
end

function teach_team_003()
	task_015_check(4)
end

function teach_team_004()	
	
	if GetTeamSize() == 1 then
		task_015_check(5)
	else
		task_015_check(6)
	end

end


-- ѡ��ϴǱ�ܵ�
function main_point()
	if GetPlayerFaction()>0 then
		Talk(1,"","Ng��i �� gia nh�p m�n ph�i, kh�ng th� t�y �i�m ti�m n�ng n�a!");
	elseif GetLevel() > 10 then
		Talk(1, "", "��ng c�p hi�n t�i c�a ng��i �� v��t qu� 10, kh�ng th� t�y �i�m ti�m n�ng.")
	else
		ResetProperty()
		Talk(1,"","Ng��i �� t�y ���c �i�m ti�m n�ng. L�n sau ph�i c�n th�n nh�!");
	end
end

-- ѡ���������
function main_exit()
	Talk(1,"","Ha ha! Ng��i qu� th�t c� l�ng!");
end

-- ��ѻظ�����
function main_restore()
	if GetPlayerFaction()>0 then
		Talk(1,"","Ng��i �� gia nh�p m�n ph�i, c� th� ��n d��c �i�m mua d��c th�o tr� th��ng. Mua ��n d��c c�a ng��i bi�t k� n�ng luy�n ��n, kh�ng th� gi�p g� cho ng��i!");
	else
		Restore()    --�ָ���ҵ�����
		RestoreNeili()   --�ָ���ҵ�������ȫ����
		CureWound(2)    --����������
		Talk(1,"","Ta �� tr� th��ng cho ng��i! Sau n�y ph�i c�n th�n nh�!");
		return
	end;
end;

function confirm_xidian()
	ResetProperty()
	Talk(1,"","<color=green>D� T�u<color>: Ta �� t�y �i�m ti�m n�ng gi�p ng��i r�i.");
end