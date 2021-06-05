Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
IB_VERSION = 1;	--�����

g_szItemName = "Truy�n C�ng T�m ��c";
g_nMaxUseTime = 100;	--ÿ�����ʹ�ô���

function OnUse(nItemIdx)
	local nLevel = GetLevel();
	BWT_WeeklyClear();
	local nUseXinDeNum = GetTask(TSK_USE_CHUANGONG_XINDE);
	if nUseXinDeNum >= g_nMaxUseTime then
		Talk(1,"","Tu�n n�y b�n �� d�ng "..g_nMaxUseTime.." cu�n"..g_szItemName..", kh�ng th� d�ng n�a.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"","��ng c�p qu� th�p, ��n c�p <color=yellow>60<color> m�i d�ng ���c "..g_szItemName..".");
		return 0;
	end;
	local selTab = {
			"S� d�ng/ask_number",
			"T�m th�i ch�a s� d�ng!/nothing",
			}
	local szString = "";
	if IB_VERSION == 1 then
		local nExp = floor((nLevel^4)/300);
		szString = "Ng��i ��ng � s� d�ng <color=yellow>"..g_szItemName.."<color>? Ng��i c� th� nh�n <color=yellow>m�i ��o c� "..nExp.."<color> �i�m kinh nghi�m.";
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4));
		szString = "Ng��i ��ng � s� d�ng <color=yellow>"..g_szItemName.."<color>? T�i �a c� th� chuy�n <color=yellow>m�i ��o c� "..nGoldenExp.."<color> �i�m s�c kh�e, �i�m s�c kh�e hi�n t�i <color=yellow>"..nCurGoldenExp.."<color>.";
	end;
	Say(szString,getn(selTab),selTab);
end;

function ask_number()
	local nUseXinDeNum = GetTask(TSK_USE_CHUANGONG_XINDE);
	local	nItemNum = GetItemCount(2,1,3353);
	
	local nMaxNum = 0;
	
	if g_nMaxUseTime - nUseXinDeNum > nItemNum then
		nMaxNum = nItemNum;
	else
		nMaxNum = g_nMaxUseTime - nUseXinDeNum;
	end;
	
	AskClientForNumber("use",1,nMaxNum,"Xin h�i d�ng m�y c�i");
	
end

function use(nCount)
	local nLevel = GetLevel();
	if IB_VERSION == 0 then
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4)) * nCount;
		if GetGoldenExp() < nGoldenExp then
			Say("�i�m s�c kh�e c�a b�n <color=yellow>"..GetGoldenExp().."<color> kh�ng �� <color=yellow>"..nGoldenExp.."<color>, c� mu�n ��i kh�ng?",2,"��ng �/#use_shoufei("..nCount..")","H�y b�/nothing")
			return
		else
			use_shoufei(nCount);
			return
		end;
	end
	if DelItem(2,1,3353,nCount) == 1 then
		if IB_VERSION == 1 then
			local nExp = floor((nLevel^4)/300) * nCount;--������������ȡ�������ȳ���nCount�أ�
			ModifyExp(nExp);
			Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
		else
			
		end;
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("Trong tu�n n�y b�n �� d�ng cu�n th� "..GetTask(TSK_USE_CHUANGONG_XINDE).." cu�n"..g_szItemName..", m�i tu�n ch� c� th� d�ng "..g_nMaxUseTime.." cu�n"..g_szItemName);	

	end;
end;

function use_shoufei(nCount)
	if DelItem(2,1,3353,nCount) == 1 then
		local nGoldenExp = floor(((GetLevel()^4)*200000)/(80^4)) * nCount;
		gf_GoldenExp2Exp(nGoldenExp);
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("Trong tu�n n�y b�n �� d�ng cu�n th� "..GetTask(TSK_USE_CHUANGONG_XINDE).." cu�n"..g_szItemName..", m�i tu�n ch� c� th� d�ng "..g_nMaxUseTime.." cu�n"..g_szItemName);	
	end;
end
function nothing()

end;

--2,1,3353