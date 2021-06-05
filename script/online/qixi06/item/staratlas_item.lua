--file name:staratlas_item.lua
--author:yanjun
--create date:2006-6-26
--describe:06����Ϧ����ǵ�ͼ�ű�
Include("\\script\\online\\qixi06\\qixi06_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
IB_VERSION = 1;

function OnUse()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
		SetTask(TASK_FIND_STAR_COUNT,0);
	end;
	local nFindNum = GetTask(TASK_FIND_STAR_COUNT);
	if nFindNum >= 7 then
		gf_ShowMsg("H�m nay ng��i �� t�m ���c 7 ng�i sao, m�i ng��i m�i ng�y nhi�u nh�t ch� c� th� t�m <color=yellow>7<color> ng�i sao.",0)
		return 0;
	end;
	local sMapName = "";
	local nMapID,nMapX,nMapY = 0,0,0;
	local nCurMapID = GetWorldPos();
	local nRow = 0;
	local nRetCode = 0;
	local nRandomNum = 0;
	local nOldPlayerIndex = PlayerIndex;
	if GetTask(TASK_POS_INDEX) ~= 0 then
		nRow = GetTask(TASK_POS_INDEX);
		if nRow < 3 then
			WriteLog("[L�i ho�t ��ng Th�t T�ch]:"..GetName().."Khi nh�n ���c h��ng d�n v� tr� ng�i sao, nRandomRow nh� h�n 3, tr� l�:"..nRow)
			SetTask(TASK_POS_INDEX,3);	--��Ϊ��
		end;
		sMapName = tabPos:getCell(nRow,3);
		nMapID = tonumber(tabPos:getCell(nRow,4));
		nMapX = tonumber(tabPos:getCell(nRow,5));
		nMapY = tonumber(tabPos:getCell(nRow,6));
		local nItemIdx = 0;
		if nCurMapID == nMapID then
			if is_around_the_star() == 1 then
				if DelItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],1) == 1 then
					nRetCode,nItemIdx = AddItem(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4],1);
					SetItemExpireTime(nItemIdx,get_time_left());
					nFindNum = nFindNum + 1;
					if nRetCode == 1 then
						Talk(1,"","Theo t�a �� b�n ��, ch� n�y l� n�i Sao b�ng r�i, b�n nh�n ���c <color=yellow>"..t7XiItem["star"][1].."<color>");
						WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."Nh�n ���c"..t7XiItem["star"][1]);
						Msg2Player("H�m nay ng��i nh�n ���c "..nFindNum.." "..t7XiItem["star"][1]);
					else
						WriteLog("[L�i ho�t ��ng Th�t T�ch]:"..GetName().."L�i khi nh�n ���c Sao b�ng, tr� quay l�i ch� l�nh AddItem:"..nRetCode);
					end;
					SetTask(TASK_FIND_STAR_COUNT,nFindNum);
					SetTask(TASK_POS_INDEX,0);
					local nExpAward = 0;
					local nLevel = GetLevel();
					if Is_Lovers_Team() == 1 then
						for i=1,2 do
							PlayerIndex = GetTeamMember(i);						
							nLevel = GetLevel();	
							if nOldPlayerIndex == PlayerIndex then
								if random(1,100) <= 80 then
									nRetCode,nItemIdx = AddItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],1);
									Msg2Player("Ch�c m�ng ng��i nh�n ���c 1 t�m "..t7XiItem["atlas"][1]);
									WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."Nh�n ���c th�m 1 t�m Tinh Tinh ��a ��");
								end;
							else
								if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
									SetTask(TASK_FIND_STAR_COUNT,0);
								end;
							end;
							if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
								SetTask(TASK_ADDED_AWARD_FINDSTAR_DATE,nDate);
								if nLevel ~= 99 then
									if IB_VERSION == 0 then
										nExpAward = floor((nLevel^2)/(80^2)*5180000);
									else
										nExpAward = floor((nLevel^2)/(80^2)*4680000);
									end;
									ModifyExp(nExpAward);
									Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");
									WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."�� nh�n ph�n th��ng song nh�n th�p sao Th�t T�ch"..nExpAward.." �i�m kinh nghi�m");										
								else
									AddItem(2,1,2642,2);
									Msg2Player("B�n nh�n ���c 2 T�i b�o th�ch");
									WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."Nh�n ph�n th��ng song nh�n th�p sao Th�t T�ch: 2 T�i b�o th�ch");
								end;
							else
								Msg2Player("H�m nay ng��i �� nh�n ph�n th��ng kinh nghi�m th�p sao (ho�c T�i b�o th�ch), l�n n�y ng��i kh�ng nh�n ���c ph�n th��ng kinh nghi�m (ho�c T�i b�o th�ch)");
							end;
						end;
						PlayerIndex = nOldPlayerIndex;
					else
						if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
							SetTask(TASK_ADDED_AWARD_FINDSTAR_DATE,nDate);
							if nLevel ~= 99 then
								if IB_VERSION == 0 then
									nExpAward = floor((nLevel^2)/(80^2)*5180000*0.8);
								else
									nExpAward = floor((nLevel^2)/(80^2)*4680000*0.8);
								end;
								ModifyExp(nExpAward);
								Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");
								WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."�� nh�n ph�n thu�ng Th�t T�ch t�m sao c� nh�n:"..nExpAward.." �i�m kinh nghi�m");										
							else
								AddItem(2,1,2642,2);
								Msg2Player("B�n nh�n ���c 2 T�i b�o th�ch");
								WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."Nh�n ph�n thu�ng Th�t T�ch t�m sao c� nh�n: 2 T�i b�o th�ch");
							end;
						else
							Msg2Player("H�m nay ng��i �� nh�n ph�n th��ng kinh nghi�m th�p sao (ho�c T�i b�o th�ch), l�n n�y ng��i kh�ng nh�n ���c ph�n th��ng kinh nghi�m (ho�c T�i b�o th�ch)");
						end;
					end;
					WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."T�m ���c 1 ng�i sao");
				end;
			else
				Talk(1,"","Theo t�a �� b�n ��, ch� n�y kh�ng ph�i l� n�i Sao b�ng r�i nh�ng b�n ph�t hi�n � <color=yellow>"..floor(nMapX/8)..","..floor(nMapY/16).."(t�a ��)<color> c� v�t �ang ph�t s�ng.");
			end;
		else
			Talk(1,"","Theo t�a �� b�n ��, ch� n�y kh�ng ph�i l� n�i Sao b�ng r�i, hay l� b�ng h�u ��n <color=yellow>"..sMapName.."<color> xem th�!");
		end;
	else
		local nTotalPosCount = tabPos:getRow();	--�õ�������
		local nRandomRow = random(3,nTotalPosCount);	--���һ��λ��
		if nRandomRow < 3 then
			WriteLog("[L�i ho�t ��ng Th�t T�ch]:"..GetName().."Khi nh�n ���c h��ng d�n v� tr� ng�i sao, nRandomRow nh� h�n 3, tr� l�:"..nRandomRow..", tr� s� nTotalPosCount:"..nTotalPosCount)
			SetTask(TASK_POS_INDEX,3);	--��Ϊ��
		end;
		sMapName = tabPos:getCell(nRandomRow,3);
		nMapID = tonumber(tabPos:getCell(nRandomRow,4));
		nMapX = tonumber(tabPos:getCell(nRandomRow,5));
		nMapY = tonumber(tabPos:getCell(nRandomRow,6));
		SetTask(TASK_POS_INDEX,nRandomRow);
		Talk(1,"","G�n ��y th�n d�n ��n r�ng th�y 1 ng�i sao r�i � <color=yellow>"..sMapName.."<color>, v� c�ng tr�ng l�.");
	end;
end;
--�ж��Ƿ���Ŀ��ص㸽��
function is_around_the_star()
	local nCurMapID,nCurMapX,nCurMapY = GetWorldPos();
	local nMapID,nMapX,nMapY = 0,0,0;
	local nRow = GetTask(TASK_POS_INDEX);
	nMapID = tonumber(tabPos:getCell(nRow,4));
	nMapX = tonumber(tabPos:getCell(nRow,5));
	nMapY = tonumber(tabPos:getCell(nRow,6));
	if nCurMapID == nMapID then
		if floor(nCurMapX/8) == floor(nMapX/8) and floor(nCurMapY/16) == floor(nMapY/16) then
			return 1;
		else
			return 0;
		end;
	else
		return 0;
	end;
end;

function get_time_left()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nTimeLeft = (23-nHour)*3600+(59-nMin)*60+(59-nSec)
	return nTimeLeft;
end;
