--=============================================
--create by baiyun 2009.8.26
--describe:Խ�ϰ�9�·��������ĵ����ű��ļ�
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

tRole ={
	{"toanleo1991","ZzThanhTuyetzZ",87},
	{"mylove220192","EmperorPitt",75},
	{"huydat008","ZxRoyKangxZx",96},
	{"duongtulang005vn","duongthieu2009",89},
	{"lovezuken7","lovezuken",90},
	{"xexichlo52","xzLongphiV�nzxx",94},
	{"volamzinh","TuyenUyenx",93},
	{"starletcute","ZzLordlyzZ",90},
	{"ttttnmthtk","sitinh",91},
	{"nhocconbuongbinh91","RRuouQuenSauu",88},
	{"tappro120","BatS�Th�c",95},
	{"hoaduongtathan10","CatherineLep",93},
	{"lightpoison","AnhSoDocx",92},
	{"macthienbinh","zTuyetTinhKhucz",92},
	{"lukeqn","TaoKoNoiNhieux",86},
	{"5docyeunu","iLyMacSau",92},
	{"vick89","1zCaterpillarz1",94},
	{"zhangngocphan","oZoMashimarooZo",90},
	{"triennhuoctran131727","zTuongTheNaoz",92},
	{"ukyo3006","XxLongTuyetNgoc",92},
	{"vuamuvuaden","�o�nTh�yC�m",90},
	{"lequynhloan","o0TjeuTjeu0o",93},
	{"doibonba83","doibonba83",89},
	{"votinhgirl187","0oVoTinhGirloO",94},
	{"lynghiastc1","osoSTVoso",96},
	{"cuaongvip2091","IoIAniMaxIoI",96},
	{"volam2263107","KjepVeSau",90},
	{"tyhononlinetk5","TieuYeuNhoNo1",90},
	{"dudidudi2557","zxzCRYzxz",99},
	{"83722884","xOxEdwardxOx",94},
	{"xoaylovepe","zIzKeoCaoSuzIz",96},
	{"trangiahunghanam1987","Vua��cBi�nH�nh",78},
	{"caytienthuonghoi0","dt01684919893",90},
	{"thinmeo88","zZzCuaHapBiazZz",95},
	{"hoat6892","o0oVIRUSoOo",92},
	{"volam2363535","DanGajTajTrau",89},
	{"shopluadong1","Back2theTOP",92},
	{"anhvudp619","o0oTHAYCHUAo0o",92},
	{"petrangiuiu","zTzBomNetzTz",98},
	{"chuminhhungpro","o0Mr�inho0",81},
	{"vyvy1203","ZxVitYeuHeoxZ",92},
	{"nhtl027670","HanDoiXamLoDick",79},
	{"leesanoc1986","o0Thi�nTh�n0o",82},
	{"nhimcon2210","oOTrieuManOo",88},
	{"binz246","Ti�uC�i",83},
	{"luckyboys9xftubn","H�nK�B�cT�nh0241",85},
	{"nhtl050949","TuyPhong",75},
}


function main()
	local t_dialog = {
--		"Nh�n buff h� tr� n�i c�ng/#Getfuzhu(1)",
--		"Nh�n buff h� tr� ngo�i c�ng/#Getfuzhu(2)",
		"K�t th�c ��i tho�i/viet_0909_nothing"
	};
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20091001 and nDate <= 20091004 then
		tinsert(t_dialog,1,"Nh�n ph�n th��ng d�nh cho Bang ch�/get_token")
	end
	Say("S� ki�n Trung Thu 2009 b�t ��u di�n ra t� ng�y 18-09-2009 ��n h�t ng�y 25-10-2009. Trong th�i gian n�y, ��ng ��o c� th� tham gia v�o c�c s� ki�n n�i b�c nh�: Ch� bi�n B�nh Trung Thu, vui c�ng ��n K�o Qu�n v� Th� B�o �, tham gia ti�u di�t Mu�i ��c, Tr�ng C�y H�nh Ph�c, x�t th��ng theo �i�m danh v�ng v� �i�m s� m�n �� s� h�u nh�ng ph�n th��ng c�c kh�ng.Ch�c ��ng ��o c� m�t ��m Trung Thu �m �p b�n ng��i th�n v� gia ��nh!", getn(t_dialog), t_dialog);
end

function CheckRole(szName)
	for i=1,getn(tRole) do
		if tRole[i][2] == szName then
			return i
		end
	end
	return 0
end

function get_token()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20091001 and nDate <= 20091007 then
		if IsTongMaster() ~= 1 then
			Say("Ch� c� Bang ch� m�i ���c nh�n th��ng!",0)
			return
		end
		local nExtVal = GetExtPoint(4)
		if nExtVal < 1 then
			Say("C�c h� kh�ng c� trong danh s�ch nh�n th��ng!",0)
			return
		elseif  nExtVal == 2 then
			Say("Ch�ng ph�i c�c h� �� nh�n th��ng r�i sao?",0)
			return
		end
		local nRoleIndex = CheckRole(GetName())
		if nRoleIndex == 0 then
			Say("C�c h� kh�ng c� trong danh s�ch nh�n th��ng!",0)
			return
		end
		if GetLevel() < tRole[nRoleIndex][3] then
			Say("C�c h� kh�ng c� trong danh s�ch nh�n th��ng!",0)
			return
		end
		if GetFreeItemRoom() <1  then
			Say("H�nh trang c�a c�c h� kh�ng �� � tr�ng. H�y s�p x�p l�i!",0)
			return
		end		
		if nExtVal == 1 then
			AddExtPoint(4,1)
		end	
	end
end

function GetTopWorld()
	if GetLevel() < 80 then
		Say("B�n kh�ng �� �i�u ki�n nh�n th��ng!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
		return
	end
	
	local nExtVal = GetExtPoint(5)	
	if nExtVal ~= 1 then
		Say("B�n kh�ng �� �i�u ki�n nh�n th��ng ho�c �� nh�n th��ng r�i!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
		return	
	end
	
	if gf_JudgeRoomWeight(3,300,"") == 0 then
		return
	end
	
	PayExtPoint(5,1)
end


function GetTopFaction()
	if GetLevel() < 80 then
		Say("B�n kh�ng �� �i�u ki�n nh�n th��ng!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
		return
	end
	
	local nExtVal = GetExtPoint(6)	
	if nExtVal ~= 1 then
		Say("B�n kh�ng �� �i�u ki�n �� nh�n th��ng ho�c �� nh�n th��ng r�i!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n th��ng.")
		return	
	end
	
	if gf_JudgeRoomWeight(1,100,"") == 0 then
		return
	end
	
	PayExtPoint(6,1)
end


--��ø���Ч��,nType == 1�ڹ���2�⹦
function Getfuzhu(nType)
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Ch�a gia nh�p m�n ph�i kh�ng th� nh�n ���c ch�c n�ng h� tr�");
		return
	end
	if GetTask(VIET_0909_TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H�m nay c�c h� �� nh�n ���c ch�c n�ng h� tr� r�i, kh�ng th� ti�p t�c nh�n th�m..");
		return
	end
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
	local nRandAttr = 0;
	if nType == 1 then
		nRandAttr = gf_GetRandItemByTable(viet_0909_tb_InBuff, 100, 1);
		for i = 1, getn(viet_0909_tb_InBuff[nRandAttr][3]) do
			CastState(viet_0909_tb_InBuff[nRandAttr][3][i][1], viet_0909_tb_InBuff[nRandAttr][3][i][2], nLeftTime);
		end
		Msg2Player("Trong h�m nay c�c h� nh�n ���c hi�u qu�"..viet_0909_tb_InBuff[nRandAttr][1]);
	else
		nRandAttr = gf_GetRandItemByTable(viet_0909_tb_OutBuff, 100, 1);
		for i = 1, getn(viet_0909_tb_OutBuff[nRandAttr][3]) do
			CastState(viet_0909_tb_OutBuff[nRandAttr][3][i][1], viet_0909_tb_OutBuff[nRandAttr][3][i][2], nLeftTime);
		end
		Msg2Player("Trong h�m nay c�c h� nh�n ���c hi�u qu�"..viet_0909_tb_OutBuff[nRandAttr][1]);
	end
	
	SetTask(VIET_0909_TASK_GET_FUZHU_TYPE, nType * 10 + nRandAttr);
	SetTask(VIET_0909_TASK_GET_FUZHU_DATE, tonumber(date("%y%m%d")));
	
end

