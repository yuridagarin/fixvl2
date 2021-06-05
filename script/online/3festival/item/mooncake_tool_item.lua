--File name:mooncake_tool_item.lua 
--Describe:���������������±��Ķ���
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\lib\\time.lua")

function OnUse()
	if tonumber(date("%y%m%d")) > 081007 then
		Talk(1,"","T�t Trung Thu �� qua, ti�p t�c l�m b�nh c�ng ch�ng c�n � ngh�a");
		return 0;
	end;
	local nTimeElapse = GetTime()-GetTask(TASK_FIREUP_TIME);
	local bTempChecked = GetTask(TASK_TEMPERATURE_CHECKED);
	if nTimeElapse >= COOKING_TIME and GetTask(TASK_FIREUP_TIME) ~= 0 then	--ʱ�䵽������ȡ�±���
		local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
		if nCurTemp <= 0 then	--����¶ȵ���0��
			local selTab = {
						"M� l� xem th�/open_stove",
						}
			Say("L�a trong l� c�a b�n �� t�t, ch�c b�nh Trung Thu c�ng �� h�.",getn(selTab),selTab);
			return 0;
		end;
		local selTab = {
					"L�y b�nh Trung Thu ra/get_mooncake",
					"Th�m nhi�n li�u/ask_fuel",
					"T�m th�i kh�ng l�y b�nh ra/nothing",
					}
		Say("B�nh Trung Thu c�a b�n �� l�m xong. B�n mu�n l�y ch�ng ra ch�? Nghe n�i khi nhi�t �� l� l� 180 �� l� c� th� l�y b�nh ra, n�u b�n kh�ng bi�t l�m sao kh�ng ch� nhi�t ��, Kh�nh �i�n S� Gi� c� b�n m�t s� nguy�n li�u ch�nh, b�n c� th� mua th� xem.",getn(selTab),selTab);
	elseif GetTask(TASK_FIREUP_TIME) == 0 then	--��ʼ����
		local selTab = {
					"Ta mu�n th� xem!/ask_main_res",
					"Sau n�y s� th�!/nothing",
					}
		Say("B�n mu�n b�t ��u l�m b�nh Trung Thu? Ch� �: Th�i gian l� c� hi�u l�c l� <color=yellow>11/9 ��n 7/10<color>.",getn(selTab),selTab);	
	else	--����������
		local selTab = {
					"Ta mu�n xem nhi�t �� l�/see_temperature",
					"Ta mu�n th�m nhi�n li�u/ask_fuel",
					"Ta mu�n d�ng l� n�y/give_up",
					"Kh�ng c� g�/nothing",
					}
		local sTimeStr = "";
		if bTempChecked == 1 or nTimeElapse > 3*60 then	--��������¶Ȼ򳬹�3����
			tremove(selTab,1);
		else
			sTimeStr = "Ch� �: Sau <color=yellow>"..Get_Time_String(COOKING_TIME-GetTime()+GetTask(TASK_FIREUP_TIME)-120).."<color> sau kh�ng th� �o nhi�t ��."
		end;
		Say("�� t�m m�i c� th� l�m ra b�nh Trung Thu h�o h�ng. Sau <color=yellow>"..Get_Time_String(COOKING_TIME-GetTime()+GetTask(TASK_FIREUP_TIME)).."<color> m�i c� th� l�y b�nh ra."..sTimeStr,getn(selTab),selTab);
	end;
end;

function ask_main_res()	--ѯ�ʼ���ʲô����
	local selTab = {
				"Ng.li�u ch�nh1/#ask_sub_res(1)",
				"Ng.li�u ch�nh2/#ask_sub_res(2)",
				"Ng.li�u ch�nh3/#ask_sub_res(3)",
				"T�m th�i ch�a c�n!/cancel",
				}
	Say("B�n mu�n th�m nguy�n li�u n�o v�o?",getn(selTab),selTab);
end;

function ask_sub_res(nMainResType)	--ѯ�ʼ���ʲô����
	if nMainResType ~= 0 then
		if GetItemCount(tMaterial[nMainResType][2],tMaterial[nMainResType][3],tMaterial[nMainResType][4]) == 0  then
			Talk(1,"ask_main_res","B�n kh�ng c� nguy�n li�u n�y!");
			return 0;
		end;
	end;
	SetTaskTemp(TT_MAIN_RES,nMainResType)
	local selTab = {
				"Ph� li�u1/#ask_fire_seed(1)",
				"Ph� li�u2/#ask_fire_seed(2)",
				"Ph� li�u3/#ask_fire_seed(3)",
				"T�m th�i ch�a c�n!/cancel",
				}
	Say("B�n mu�n cho ph� li�u n�o v�o?",getn(selTab),selTab);
end;

function ask_fire_seed(nSubResType)	--ѯ�ʼ���ʲôȼ��
	if nSubResType ~= 0 then
		if GetItemCount(tMaterial[nSubResType+3][2],tMaterial[nSubResType+3][3],tMaterial[nSubResType+3][4]) == 0 then
			Talk(1,"#ask_sub_res("..GetTaskTemp(TT_MAIN_RES)..")","B�n kh�ng c� lo�i ph� li�u n�y!");
			return 0;
		end;
	end;
	SetTaskTemp(TT_SUB_RES,nSubResType)
	local selTab = {
				"S� d�ng than �� t�ng nhi�t ��/#final_confirm(1)",
				"D�ng c�i �� t�ng nhi�t ��/#final_confirm(2)",
				"T�m th�i ch�a c�n!/cancel",
				}
	Say("B�n mu�n d�ng lo�i nhi�n li�u n�o �� t�ng nhi�t �� l�?",getn(selTab),selTab);
end;

function final_confirm(nFireSeedType)
	if GetItemCount(tMaterial[nFireSeedType+6][2],tMaterial[nFireSeedType+6][3],tMaterial[nFireSeedType+6][4]) == 0 then
		Talk(1,"#ask_fire_seed("..GetTaskTemp(TT_SUB_RES)..")","B�n kh�ng c� lo�i nhi�n li�u n�y");
		return 0;
	end;
	local selTab = {
				"��ng �/begin_to_make",
				"Ta suy ngh� l�i!/cancel",
				}
	SetTaskTemp(TT_FIRE_SEED,nFireSeedType)
	local sContent = "";
	local nMainRes = GetTaskTemp(TT_MAIN_RES);
	local nSubRes = GetTaskTemp(TT_SUB_RES);
	local nFireSeed = nFireSeedType;
	sContent = sContent.."B�n �� cho <color=yellow>"..tMaterial[nMainRes][1].."<color> v� <color=yellow>"..tMaterial[nSubRes+3][1].."<color> v�o,";
	sContent = sContent.."s� d�ng <color=yellow>"..tMaterial[nFireSeed+6][1].."<color> �� t�ng nhi�t �� l�.";
	Say(sContent.."B�n mu�n d�ng s� nguy�n li�u n�y �� l�m b�nh Trung Thu?",getn(selTab),selTab);
end;

function begin_to_make()
	local nRandTemp = 0;
	local nCurTemp = 0;
	local nMainRes = GetTaskTemp(TT_MAIN_RES);
	local nSubRes = GetTaskTemp(TT_SUB_RES);
	local nFireSeed = GetTaskTemp(TT_FIRE_SEED);
	if DelItem(tMaterial[nMainRes][2],tMaterial[nMainRes][3],tMaterial[nMainRes][4],1) == 1 and DelItem(tMaterial[nSubRes+3][2],tMaterial[nSubRes+3][3],tMaterial[nSubRes+3][4],1) == 1 and DelItem(tMaterial[nFireSeed+6][2],tMaterial[nFireSeed+6][3],tMaterial[nFireSeed+6][4],1) == 1 then
		if GetTaskTemp(TT_FIRE_SEED) == 1 then
			--nRandTemp = random(550,650);
			nRandTemp = 600;
		elseif GetTaskTemp(TT_FIRE_SEED) == 2 then
			--nRandTemp = random(250,350);
			nRandTemp = 300;
		end;
		SetTask(TASK_MAIN_RES,nMainRes);
		SetTask(TASK_SUB_RES,nSubRes);
		SetTask(TASK_FIREUP_TIME,GetTime());
		SetTask(TASK_ADD_FUEL_TIME,GetTime());
		SetTask(TASK_TEMPERATURE,nRandTemp);
		Talk(1,"","B�n �� nh�m l�a l� th�nh c�ng, khi th�m nhi�n li�u ch� � <color=yellow>nhi�t �� c�a l�<color>, ��ng �� l�a t�t ho�c b�nh ch�y kh�t.");
	end;
end;

function cancel()
	SetTaskTemp(TT_MAIN_RES,0);
	SetTaskTemp(TT_SUB_RES,0);
	SetTaskTemp(TT_FIRE_SEED,0);
end;

function give_up()
	local selTab = {
				"��ng �/confirm_give_up",
				"�� ta suy ngh�!/OnUse",
				}
	Say("B�n kh�ng mu�n d�ng l� n�y?",getn(selTab),selTab);
end;

function confirm_give_up()
	SetTask(TASK_MAIN_RES,0);
	SetTask(TASK_SUB_RES,0);
	SetTask(TASK_FIREUP_TIME,0);
	SetTask(TASK_ADD_FUEL_TIME,0);
	SetTask(TASK_TEMPERATURE,0);
	SetTask(TASK_TEMPERATURE_CHECKED,0);
	Say("B�n c� th� b�t ��u l�m b�nh l�i!",0);
end;

function ask_fuel()
	local selTab = {
				"Ta mu�n th�m than/#add_fuel(1)",
				"Ta mu�n th�m c�i/#add_fuel(2)",
				"Kh�ng c�n ��u!/cancel",
				}
	Say("B�n mu�n th�m lo�i nhi�n li�u n�o?",getn(selTab),selTab);
end;

function add_fuel(nFuelType)
	if GetItemCount(tMaterial[nFuelType+6][2],tMaterial[nFuelType+6][3],tMaterial[nFuelType+6][4]) == 0 then
		Talk(1,"OnUse","B�n kh�ng c� lo�i nhi�n li�u n�y");
		return 0;
	end;
	if DelItem(tMaterial[nFuelType+6][2],tMaterial[nFuelType+6][3],tMaterial[nFuelType+6][4],1) == 1 then
		local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
		local nRandTemp = 0;
		if nFuelType == 1 then
			--nRandTemp = random(550,650);
			nRandTemp = 600;
		else
			--nRandTemp = random(250,350);
			nRandTemp = 300;
		end;
		local nTotalTemp = nCurTemp+nRandTemp;
		if nTotalTemp > 900 then
			SetTask(TASK_MAIN_RES,0);
			SetTask(TASK_SUB_RES,0);
			SetTask(TASK_FIREUP_TIME,0);
			SetTask(TASK_ADD_FUEL_TIME,0);
			SetTask(TASK_TEMPERATURE,0);
			SetTask(TASK_TEMPERATURE_CHECKED,0);
			AddItem(tMoonCake[19][2],tMoonCake[19][1],tMoonCake[19][4],1);
			Say("Nhi�t �� l� cao h�n 900 ��, b�nh Trung Thu �� b� ch�y h�t. B�n nh�n ���c 1 <color=yellow>"..tMoonCake[19][1].."<color>",0);
			return 0;
		end;
		SetTask(TASK_TEMPERATURE,nTotalTemp);
		SetTask(TASK_ADD_FUEL_TIME,GetTime());
		Say("B�n �� th�m m�t �t nhi�n li�u v�o, nhi�t �� l� t�ng l�n <color=yellow>"..nRandTemp.."<color> ��",0);
	end;
end;

function see_temperature()	--�鿴�¶�
	local selTab = {
				"��ng �/confirm_see_temperature",
				"Ch�a c�n xem v�i!/OnUse",
				}
	Say("Trong qu� tr�nh l�m b�nh ch� c� th� xem nhi�t �� 1 l�n, b�n mu�n xem ch�?",getn(selTab),selTab);
end;

function confirm_see_temperature()
	local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
	SetTask(TASK_TEMPERATURE_CHECKED,1);
	Talk(1,"OnUse","Nhi�t �� c�a l� l�: <color=yellow>"..nCurTemp.."<color> ��");
end;

function get_mooncake()
	local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
	local nMaterial1 = GetTask(TASK_MAIN_RES);
	local nMaterial2 = GetTask(TASK_SUB_RES);
	SetTask(TASK_MAIN_RES,0);
	SetTask(TASK_SUB_RES,0);
	SetTask(TASK_FIREUP_TIME,0);
	SetTask(TASK_ADD_FUEL_TIME,0);
	SetTask(TASK_TEMPERATURE,0);
	SetTask(TASK_TEMPERATURE_CHECKED,0);
	Give_MoonCake(nMaterial1,nMaterial2,nCurTemp);
end;

function get_temperature(nInitTemp,nElapseTime)	--���ݳ�ʼ�¶Ⱥ;���ʱ��õ�Ŀǰ���¶�
	local nTemp = 0;
	local nTime1 = sqrt((40000000+3)/nInitTemp);
	local nTime2 = nElapseTime + nTime1;
	nTemp = 40000000/(nTime2)^2 - 3;
	if nTemp < 0 then
		nTemp = 0;
	end; 
	return floor(nTemp)
end;

function open_stove()	--�¶Ƚ���0�Ⱥ��¯��
	if random(1,100) < 50 then
		AddItem(tMoonCake[11][2],tMoonCake[11][3],tMoonCake[11][4],1);
		Say("B�n nh�n ���c 1 <color=yellow>"..tMoonCake[11][1].."<color>, kh�ng bi�t m�i v� th� n�o?",0);
	else
		Say("B�n ki�m tra s� qua b�nh Trung Thu trong l� r�i k�t lu�n: B�nh Trung Thu n�y kh�ng th� �n ���c r�i!",0);
	end;
	SetTask(TASK_MAIN_RES,0);
	SetTask(TASK_SUB_RES,0);
	SetTask(TASK_FIREUP_TIME,0);
	SetTask(TASK_ADD_FUEL_TIME,0);
	SetTask(TASK_TEMPERATURE,0);
	SetTask(TASK_TEMPERATURE_CHECKED,0);
end;