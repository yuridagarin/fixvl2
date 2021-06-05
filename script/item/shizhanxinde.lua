Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
Include("\\script\\lib\\lingshi_head.lua");
IB_VERSION = 1;
g_nMaxUseTime = 100;	--ÿ�����ʹ�ô���

function OnUse(nItemIdx)
	local nLevel = GetLevel();
	BWT_WeeklyClear();
	local nUseXinDeNum = GetTask(TSK_USE_XINDE);
	if nUseXinDeNum >= g_nMaxUseTime then
		Talk(1,"","Tu�n n�y b�n �� d�ng "..g_nMaxUseTime.."Kh�ng th� d�ng l�i Th�c Chi�n T�m ��c n�y.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"","��ng c�p c�a ng��i qu� th�p, ng��i ph�i ��t ��n c�p <color=yellow>60<color> m�i c� th� d�ng Th�c Chi�n T�m ��c.");
		return 0;
	end;
	local szIntro = "";
	if IB_VERSION == 1 then
		local nExp = floor(nLevel^4/200);--�ȼ����Ĵη�/200
		local selTab = {};
		if nLevel == 99 then
			tinsert(selTab,"Ta mu�n ��i th�nh T� v� ��i h�i b�i v� Truy�n C�ng T�m ��c/#use_confirm("..nItemIdx..",1)");
		else
			tinsert(selTab,"Ta mu�n ��i th�nh T� v� ��i h�i b�i v� kinh nghi�m ( "..floor(nExp/2).." �i�m/cu�n)/#use_confirm("..nItemIdx..",1)");
			tinsert(selTab,"Ta mu�n ��i th�nh kinh nghi�m ( "..nExp.." �i�m/cu�n)/#use_confirm("..nItemIdx..",2)");		
		end;
		tinsert(selTab,"\nT�m th�i kh�ng d�ng/nothing");
		Say(szIntro.."Tu�n n�y ng��i �� ��i <color=yellow>"..(nUseXinDeNum+1).."<color> l�n d�ng Th�c Chi�n T�m ��c, b�n c� mu�n d�ng Th�c Chi�n T�m ��c kh�ng?",getn(selTab),selTab);
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor((nLevel^4)*300000/(80^4));	--��ҵȼ����Ĵη�*30w/80���Ĵη�
		local selTab = {};
		if nLevel == 99 then
			tinsert(selTab,"Ta mu�n ��i th�nh T� v� ��i h�i b�i v� Truy�n C�ng T�m ��c/#use_confirm("..nItemIdx..",1)");
		else
			tinsert(selTab,"Ta mu�n ��i th�nh T� v� ��i h�i b�i v� l�y �i�m s�c kh�e ( "..floor(nGoldenExp/2).." �i�m/cu�n) ��i th�nh kinh nghi�m/#use_confirm("..nItemIdx..",1)");
			tinsert(selTab,"Ta mu�n l�y �i�m s�c kh�e ( "..nGoldenExp.." �i�m/cu�n) ��i th�nh kinh nghi�m/#use_confirm("..nItemIdx..",2)");		
		end;
		tinsert(selTab,"\nT�m th�i kh�ng d�ng/nothing");
		Say(szIntro.."��y l� cu�n Th�c Chi�n T�m ��c th� <color=yellow>"..(nUseXinDeNum+1).."<color> m� b�n d�ng trong tu�n n�y, �i�m s�c kh�e hi�n t�i l� <color=yellow>"..nCurGoldenExp.."<color>. B�y gi� b�n c� mu�n d�ng Th�c Chi�n T�m ��c kh�ng?",getn(selTab),selTab);
	end;
end;

function use_confirm(nItemIdx,nUseType)
	nUseType = nUseType or 0;
	local nUseXinDeNum = GetTask(TSK_USE_XINDE);
	local nItemNum = GetItemCount(2,1,1101);
	local nMax = 0;
	if g_nMaxUseTime - nUseXinDeNum > nItemNum then
		nMax = nItemNum;
	else
		nMax = g_nMaxUseTime - nUseXinDeNum;
	end;
	if nUseType == 1 then
		AskClientForNumber("use_real_1",1,nMax,"Xin h�i d�ng m�y c�i");
		return
	elseif nUseType == 2 then
		AskClientForNumber("use_real_2",1,nMax,"Xin h�i d�ng m�y c�i");
		return
	end;
	return
	
	
	
end;

function use_real_1(nCount)
	local nLevel = GetLevel();
	local nExp = floor(nLevel^4/200);--�ȼ����Ĵη�/200
	local nGoldenExp = floor((nLevel^4)*300000/(80^4));
	--�շ������������ж�
	if IB_VERSION == 0 then
		if nLevel == 99  then
			if DelItem(2,1,1101,nCount) == 1 then
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
				AddItem(2,1,3353,nCount);
				Msg2Player("B�n nh�n ���c "..nCount.." T� v� ��i h�i b�i v� "..nCount.." Truy�n C�ng T�m ��c");
				SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
				Msg2Player("Tu�n n�y ng��i �� d�ng "..GetTask(TSK_USE_XINDE).." Th�c Chi�n T�m ��c, m�i tu�n ch� c� th� d�ng "..g_nMaxUseTime.." quy�n Th�c Chi�n T�m ��c");	
				return
			else
		
				Say("X�c nh�n b�n c� �� Th�c Chi�n T�m ��c kh�ng!",1,"��ng �/nothing");
				
				return
			end;
		elseif floor(nGoldenExp/2)*nCount > GetGoldenExp() then
			Say("�i�m s�c kh�e c�a b�n <color=yellow>"..GetGoldenExp().."<color> kh�ng �� <color=yellow>"..(floor(nGoldenExp/2)*nCount).."<color>, c� mu�n ��i kh�ng?",2,"��ng �/#use_shoufei("..nCount..",1)","H�y b�/nothing");
			return
		else
			use_shoufei(nCount,1);
			return
		end;
	elseif IB_VERSION == 1 then
		if  DelItem(2,1,1101,nCount) == 1 then
			if nLevel == 99 then
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
				AddItem(2,1,3353,nCount);
				Msg2Player("B�n nh�n ���c "..nCount.." T� v� ��i h�i b�i v� "..nCount.." Truy�n C�ng T�m ��c");
			else
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
					
				ModifyExp(floor(nExp/2) * nCount);
				local nTemp = floor(nExp/2) * nCount;
				Msg2Player("B�n nh�n ���c "..nCount.." T� v� ��i h�i b�i v� "..nTemp.." �i�m kinh nghi�m");
			end;
		else
		
			Say("X�c nh�n b�n c� �� Th�c Chi�n T�m ��c kh�ng!",1,"��ng �/nothing");
		
			return
		end;
	
	end;


	SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
	Msg2Player("Tu�n n�y ng��i �� d�ng "..GetTask(TSK_USE_XINDE).." Th�c Chi�n T�m ��c, m�i tu�n ch� c� th� d�ng "..g_nMaxUseTime.." quy�n Th�c Chi�n T�m ��c");	

end
function use_real_2(nCount)
	local nLevel = GetLevel();
	local nExp = floor(nLevel^4/200);--�ȼ����Ĵη�/200
	local nGoldenExp = floor((nLevel^4)*300000/(80^4));
	--�շ������������ж�
	if IB_VERSION == 0 then
		if nGoldenExp*nCount > GetGoldenExp() then
			Say("�i�m s�c kh�e c�a b�n <color=yellow>"..GetGoldenExp().."<color> kh�ng �� <color=yellow>"..(nGoldenExp*nCount).."<color>, c� mu�n ��i kh�ng?",2,"��ng �/#use_shoufei("..nCount..",2)","H�y b�/nothing");
			return
		else
			use_shoufei(nCount,2);
			return
		end;
	end;
	if DelItem(2,1,1101,nCount) == 1 then
		if IB_VERSION == 1 then	
			ModifyExp(nExp * nCount);
			Msg2Player("B�n nh�n ���c "..(nExp * nCount).." �i�m kinh nghi�m");
		end;
	else
		WriteLog("D�ng Th�c Chi�n T�m ��c:"..GetName().."H�y Th�c Chi�n T�m ��c th�t b�i!");
		Say("X�c nh�n b�n c� �� Th�c Chi�n T�m ��c kh�ng!",1,"��ng �/nothing")
		
		return
	end;
	SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
	Msg2Player("Tu�n n�y ng��i �� d�ng "..GetTask(TSK_USE_XINDE).." Th�c Chi�n T�m ��c, m�i tu�n ch� c� th� d�ng "..g_nMaxUseTime.." quy�n Th�c Chi�n T�m ��c");	

end

function use_shoufei(nCount,nType)
	local nGoldenExp = 0;
	if DelItem(2,1,1101,nCount) == 1 then
		
		if nType == 1 then
			AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
			Msg2Player("B�n nh�n ���c "..nCount.." T� v� ��i h�i b�i");
			nGoldenExp =  floor((GetLevel()^4)*300000/(80^4)/2)*nCount;
		else
			nGoldenExp =  floor((GetLevel()^4)*300000/(80^4))*nCount;
		end;
		gf_GoldenExp2Exp(nGoldenExp);
		
		SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
		Msg2Player("Tu�n n�y ng��i �� d�ng "..GetTask(TSK_USE_XINDE).." Th�c Chi�n T�m ��c, m�i tu�n ch� c� th� d�ng "..g_nMaxUseTime.." quy�n Th�c Chi�n T�m ��c");	
	end;

end

function nothing()

end;

-- 2,1,1101