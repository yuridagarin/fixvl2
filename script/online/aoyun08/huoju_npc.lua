--ʥ�𴫵ݻ���̨NPC
--by vivi
--2008/06/02

Include("\\script\\online\\aoyun08\\aoyun_head.lua")
Include("\\script\\lib\\lingshi_head.lua")

function main()
	if GetGlbValue(GLB_AOYUN_TIME_STATE) ~= 0 then  --��ڼ���
		if GetTask(TASK_AOYUN_FINAL_AWARD) ~= 0 then --����Ѿ���ȡ�����ս�����������
			return
		end
		if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then --���ǻ����
			local sNpcName = GetTargetNpcName();
			local nHisNum = GetTask(TASK_AOYUN_HUOJU_NUM); --����ֱ��
--			if GetTrigger(TRIGER_AOYUN_TIME_ID) == 0 then   --����һ��ʱ�䴥��������һ��ʱ���ڸ��辭�齱��			
--				if CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID) == 0 then
--					WriteLog("[ʥ�𴫵ݻ]:���"..GetName().."���̨������CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID)ʧ�ܣ�TIME_TABLE_IDֵ:"..TIME_TABLE_ID.."TRIGER_AOYUN_TIME_ID:"..TRIGER_AOYUN_TIME_ID);
--					return 0;	--����ʧ��
--				end;					
--			end
			--�����װ�ж�
			local nIndex = GetPlayerEquipIndex(10); --��ȡ��װ�·�����
			local nId1,nId2,nId3 = GetPlayerEquipInfo(10); --��ȡ��װ�·�id
			local nBody = GetBody();
			if nId1 ~= 0 or nId2 ~= 105 or nId3 ~= (44+nBody) then
				Talk(1,"","<color=green>��i �u�c<color>: Tham gia ho�t ��ng r��c Th�nh H�a c�n mang <color=yellow>��ng ph�c ng��i r��c �u�c<color>, nh�n t�i ��i s� r��c Th�nh H�a.");
				return			
			end			
			if tHuojuName[nHisNum][1] ~= sNpcName and tHuojuName[nHisNum][2] ~= sNpcName then
				if (GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM)) > nHisNum then	
					Talk(1,"","<color=green>��i �u�c<color>: Th�nh H�a �ang chuy�n t�i tr��c, xin v� ��i �u�c ch� ��nh ch� ph�n th��ng sau c�ng.");
					return
				else 				
					Talk(1,"","<color=green>��i �u�c<color>: B�n ph�i t� <color=yellow>"..tHuojuName[nHisNum][1].."<color> nh�n Th�nh H�a, chuy�n ��n <color=yellow>"..tHuojuName[nHisNum][2].."<color>, <color=yellow>tr��c khi Th�nh H�a ��i b�c ch�y<color> chuy�n ��n "..tHuojuName[nHisNum][2]..", n�u kh�ng ��n ��ng gi� s� kh�ng ���c ph�n th��ng.");
					return
				end
			elseif tHuojuName[nHisNum][1] == sNpcName then
				if (GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM)) < nHisNum then
					Talk(1,"","<color=green>��i �u�c<color>: ��ng v�i, v�n ch�a chuy�n ��n ��y m�.");
					return
				elseif (GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM)) > nHisNum then	
					Talk(1,"","<color=green>��i �u�c<color>: Th�nh H�a �ang chuy�n t�i tr��c, xin v� ��i �u�c ch� ��nh ch� ph�n th��ng sau c�ng.");
					return
				end 
				if GetTask(TASK_AOYUN_GET_SHENGHUO) ~= 0 then
					Talk(1,"","<color=green>��i �u�c<color>: B�n �� nh�n ���c m�i l�a, mau chuy�n ��n <color=yellow>"..tHuojuName[nHisNum][2].."<color> �i! <color=yellow>Tr��c khi Th�nh H�a ��i b�c ch�y<color> chuy�n ��n "..tHuojuName[nHisNum][2]..", n�u kh�ng ��n ��ng gi� s� kh�ng ���c ph�n th��ng.");
					return
				end
				SetTask(TASK_AOYUN_GET_SHENGHUO,GetTime());
				Talk(1,"","<color=green>��i �u�c<color>: B�n t� "..tHuojuName[nHisNum][1].." nh�n m�i l�a, "..tHuojuName[nHisNum][1].." v� �u�c trong tay th�p l�n Th�nh H�a. Mau chuy�n ��n <color=yellow>"..tHuojuName[nHisNum][2].."<color> �i! <color=yellow>Tr��c khi Th�nh H�a ��i b�c ch�y<color> chuy�n ��n "..tHuojuName[nHisNum][2]..", n�u kh�ng ��n ��ng gi� s� kh�ng ���c ph�n th��ng.");
			elseif tHuojuName[nHisNum][2] == sNpcName then
				if GetTask(TASK_AOYUN_GET_SHENGHUO) == 0 then
					Talk(1,"","<color=green>��i �u�c<color>: B�n ph�i c� Th�nh H�a tr��c v� <color=yellow>tr��c khi Th�nh H�a ��i b�c ch�y<color> chuy�n ��n ��y.");
					return
				end
				if GetTask(TASK_AOYUN_DIAN_SHENGHUO) == 0 and GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) > nHisNum then
--					SetTask(TASK_AOYUN_HUOJU_IDX,GetTargetNpc());  --����npc���������ٸ��������
					Talk(1,"","<color=green>��i �u�c<color>: Th�t ��ng ti�c, <color=yellow>tr��c khi Th�nh H�a ��i b�c ch�y<color> ch�a chuy�n Th�nh H�a ��n ��y, xin � ��y ch� ��i �u�c th�nh th� th�p s�ng �� nh�n ph�n th��ng cu�i c�ng.");
					return
				end
				if GetTask(TASK_AOYUN_DIAN_SHENGHUO) == 0 then  --û����ȡ��
					SetTask(TASK_AOYUN_DIAN_SHENGHUO,1);
--					SetGlbValue(GLB_AOYUN_HUOJUTAI_NUM,nHisNum); --����ұ�ű�ǣ���ʾ��Ӧ�ĸúŻ��̨�Ѿ���ȼ
--					SetTask(TASK_AOYUN_HUOJU_IDX,GetTargetNpc());
					local nNpcNum = GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM); --�ڼ���̨��ȼ
					local nNpcIdx = GetGlbValue(GLB_AOYUN_NPC_YI+nNpcNum);
					local nNpcName = GetNpcName(nNpcIdx);	
					if tHuojuName[nHisNum][2] == nNpcName then
						if nNpcNum == 0 then
							SetCurrentNpcSFX(nNpcIdx,910,2,1);--��ȼ	
						elseif nNpcNum == 30 then
							SetCurrentNpcSFX(nNpcIdx,913,2,1);--��ȼ
						elseif nNpcNum < 30 then
							SetCurrentNpcSFX(nNpcIdx,909,2,1);--��ȼ
						end
					end			
					--���轱��
					local nLv = GetLevel();
					local nExp = floor((nLv^3)*15);
					if nLv ~= 99 then
						ModifyExp(nExp);
						Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.."Kinh nghi�m");
					else
						lspf_AddLingShiInBottle(7,1);
						Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 7, �� b� v�o trong T� Linh ��nh.");
					end
					if nHisNum ~= 30 then
						Talk(1,"","<color=green>��i �u�c<color>: B�n �� chuy�n th�nh c�ng Th�nh H�a, xin � ��y c� v� v� ch� ��i �� nh�n ph�n th��ng c�a m�nh.");
					else
						Talk(1,"","<color=green>��i �u�c th�nh th�<color>: B�n th�p th�nh c�ng ��i �u�c th�nh th�! Th�nh H�a ch�y b�ng l�n r�i!");
					end
				else	
					if GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) < 31 then   --ͨ��relay���÷���������Ϊ31
						Talk(1,"","<color=green>��i �u�c<color>: B�n �� th�p Th�nh H�a, xin � t�i ch� ch� ��i ��i Th�nh H�a Th�nh Th� ���c th�p s�ng �� nh�n th��ng.");
					else
						--��ȡ���ս���
						if GetTask(TASK_AOYUN_FINAL_AWARD) == 0 then
							--ɾ����װ
							if DelItemByIndex(nIndex,-1) == 1 then	
								SetTask(TASK_AOYUN_FINAL_AWARD,1);
								local nLv = GetLevel();
								local nExp = floor((nLv^3)*10);
								if nLv ~= 99 then
									ModifyExp(nExp);
									Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.."Kinh nghi�m");
								else
									local nRand = random(1,100);
									if nRand <= 80 then
										lspf_AddLingShiInBottle(6,1);
										Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 6, �� b� v�o trong T� Linh ��nh.");
									else
										lspf_AddLingShiInBottle(7,1);
										Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 7, �� b� v�o trong T� Linh ��nh.");									
									end
								end
							else
								Talk(1,"","<color=green>��i �u�c<color>: B�ng ch�a trang b� ��ng ph�c ng��i r��c �u�c.");
							end							
						end
					end
				end
			end
		elseif GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) == 0 then  --����������
			local sNpcName = GetTargetNpcName();
			local nZwNum = GetTask(TASK_AOYUN_ZHUWEI_NUM); --�����߱��		
			if GetTrigger(TRIGER_AOYUN_TIME_ID) == 0 then   --����һ��ʱ�䴥��������һ��ʱ���ڸ��辭�齱��
				local nTriIdx = CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID);
				if nTriIdx == 0 then
					WriteLog("[Ho�t ��ng r��c Th�nh H�a]: Ng��i ch�i "..GetName().."Trigger ��i �u�c CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID) th�t b�i, tr� TIME_TABLE_ID:"..TIME_TABLE_ID.."TRIGER_AOYUN_TIME_ID:"..TRIGER_AOYUN_TIME_ID);
					return 0;	--����ʧ��
				else
					ContinueTimer(nTriIdx);
				end;					
			end				
			if tHuojuName[nZwNum][1] ~= sNpcName then
				Talk(1,"","<color=green>��i �u�c<color>: B�n kh�ng ph�i c� v� � ��i �u�c n�y, h�y ��n "..tHuojuName[nZwNum][1]);
			else
				if GetTask(TASK_AOYUN_ZHUWEI_LABA) == 0 then	
					if Zgc_pub_goods_add_chk(1,1) ~= 1 then
						return
					end
					SetTask(TASK_AOYUN_ZHUWEI_LABA,1);
					SetTask(TASK_AOYUN_HUOJU_IDX,GetTargetNpc());
					AddItem(2,1,3378,1); --��������
				else
					if GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) < 31 then   --ͨ��relay���÷���������Ϊ31
						Talk(1,"","<color=green>��i �u�c<color>: H�y � t�i ch� reo h� c� v�.");
					else
						--��ȡ���ս���
						if GetTask(TASK_AOYUN_FINAL_AWARD) == 0 then
							SetTask(TASK_AOYUN_FINAL_AWARD,1);
							local nLv = GetLevel();
							local nExp = floor((nLv^3)*5);
							if nLv ~= 99 then
								ModifyExp(nExp);
								Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.."Kinh nghi�m");
							else
								lspf_AddLingShiInBottle(6,1);
								Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 6, �� b� v�o trong T� Linh ��nh.");
							end							
						end
					end
				end					
			end
		end
	else  --�ճ��
		if get_aoyun_state() == 0 then
			Talk(1,"","<color=green>��i �u�c<color>: Ho�t ��ng v�n ch�a b�t ��u.");
		elseif get_aoyun_state() == 2 then
			Talk(1,"","<color=green>��i �u�c<color>: Ho�t ��ng �� k�t th�c.");
		else
			--��װ���
			local nIndex = GetPlayerEquipIndex(10); --��ȡ��װ�·�����
			local nId1,nId2,nId3 = GetPlayerEquipInfo(10); --��ȡ��װ�·�id
			local nDate = tonumber(date("%Y%m%d"));
			local nBody = GetBody();
			if nId1 ~= 0 or nId2 ~= 105 or nId3 ~= (40+nBody) then
				Talk(1,"","<color=green>��i �u�c<color>: Tham gia ho�t ��ng ��i h�i t� v� m�ng Th�nh H�a c�n mang <color=yellow>��ng ph�c r��c �u�c<color>, c� th� mua t�i t�p h�a.");
				return
			else
				if GetTask(TASK_AOYUN_HUOJU_DATE) >= nDate then
					Talk(1,"","<color=green>��i �u�c<color>: H�m nay b�n �� ch�y ��n ho�t ��ng ��i h�i t� v� m�ng Th�nh H�a, m�i ng�y ch� c� th� ch�y 1 l�n.");
					return
				else
					if GetTask(TASK_AOYUN_TEMP_NUM) >= 32 or GetTask(TASK_AOYUN_TEMP_NUM) == 0 then
						SetTask(TASK_AOYUN_TEMP_NUM,1);
					end
					local sNpcName = GetTargetNpcName();
					local nHisNum = GetTask(TASK_AOYUN_TEMP_NUM);	
					if tHuojuName[nHisNum][1] ~= sNpcName then
						Talk(1,"","<color=green>��i �u�c<color>: B�n �ang th�p kh�ng ��ng ��i �u�c, c�n th�p l� "..tHuojuName[nHisNum][1]);
						return
					else
						if nHisNum < 32 then
							SetTask(TASK_AOYUN_TEMP_NUM,nHisNum+1);
							if GetTask(TASK_AOYUN_TEMP_NUM) ~= 32 then	
								Talk(1,"","<color=green>��i �u�c<color>: B�n th�p ��i �u�c th�nh c�ng, ��n "..tHuojuName[nHisNum+1][1].."!");
							else
								if DelItemByIndex(nIndex,-1) == 1 then
									SetTask(TASK_AOYUN_HUOJU_DATE,nDate);
									local nLv = GetLevel();
									local nExp = floor((nLv^3)*5);
									if nLv ~= 99 then
										ModifyExp(nExp);
										Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.."Kinh nghi�m");
									else
										local nRand = random(1,100);
										if nRand <= 85 then
											lspf_AddLingShiInBottle(5,1);
											Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 5, �� b� v�o trong T� Linh ��nh.");
										elseif nRand <= 95 then
											lspf_AddLingShiInBottle(6,1);
											Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 6, �� b� v�o trong T� Linh ��nh.");
										else
											lspf_AddLingShiInBottle(7,1);
											Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 7, �� b� v�o trong T� Linh ��nh.");									
										end
									end
								else
									Talk(1,"","<color=green>��i �u�c<color>: B�n ch�a trang b� <color=yellow>��ng ph�c r��c �u�c<color>.");
								end
							end
						end
					end 	 
				end
			end
		end
	end	
end

function OnTimer()
	if GetGlbValue(GLB_AOYUN_TIME_STATE) ~= 0 then
		local nLv = GetLevel();
		if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then  --����ֽ���
			--��������ж�
			local nNpcIdx = GetTask(TASK_AOYUN_HUOJU_IDX);
			local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
			local nMapId,nPlayerX,nPlayerY = GetWorldPos();	
			local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
			if nDistance < 40 then
				if nLv ~= 99 then
					local nExp = floor((nLv^2)*10);
					ModifyExp(nExp);
				else
					local nRand = random(1,100);
					if nRand <= 20 then
						aoyun_baoshi_prob();
					end
				end
			end
		elseif GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) == 0 then  --�����߽���
			local nNpcIdx = GetTask(TASK_AOYUN_HUOJU_IDX);
			local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
			local nMapId,nPlayerX,nPlayerY = GetWorldPos();	
			local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
			if nDistance < 40 then			
				if nLv ~= 99 then
					local nExp = floor((nLv^2)*6);
					ModifyExp(nExp);
				else
					local nRand = random(1,100);
					if nRand <= 20 then
						aoyun_baoshi_prob();
					end
				end	
			end		
		end
	else
		if GetTask(547) ~= 0 and GetTrigger(TRIGER_AOYUN_TIME_ID) ~= 0 then
			RemoveTrigger(GetTrigger(TRIGER_AOYUN_TIME_ID));  --ɾ��������
		end
	end 
end