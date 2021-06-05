--��ȡ���֧��
Include("\\script\\class\\ktabfile.lua");
--�����ַ�������֧��
Include("\\script\\task\\world\\task_head.lua");

File_name = "\\script\\task\\teach\\����ָ��book.lua"
--����ʼ��
tabTaskInfo 	 =  new(KTabFile,"\\settings\\task\\task_info.txt");
tabNpcPos 		 =  new(KTabFile,"\\settings\\task\\npc_pos_info.txt");
tabLevelTaskInfo =  new(KTabFile,"\\settings\\task\\level_task.txt");
tabZXTaskInfo 	 =  new(KTabFile,"\\settings\\task\\task_info_zx.txt");


---------------------------------------------��������������-----------------------------------------
Zgc_conf_task_goos_num = {						--�����ռ��ȼ�Ϊ9��
	{2000,1},{4000,2},{8000,4},{12000,7},{16000,10},{20000,15},{24000,16},{28000,17},{32000,18}
}
--
Zgc_conf_task_goods_need = {50,90,140,200,400}

function OnUse()
	Say("V� b�ng h�u n�y, mu�n t�m hi�u g�?",
		7,
		"T�m hi�u nhi�m v�./Renwuchaxun",
		"T�m hi�u vi�c c�n l�m./#ShowTaskInfo(1,1)",
		"H��ng d�n s� d�ng v� c�ng./wuogongmiji",
		"H�n ch� �i�u ki�n m� b�n ��./mapkaiqi",
		"T�m hi�u v� tr� ng��i ch� ��nh./Chaxunnpc",
		"T�m hi�u th�i gian hi�n t�i./Timechaxun",
		"R�i kh�i./cancel")
end

function cancel()
end

function Renwuchaxun()
	Say("Ng��i mu�n h�i chuy�n g�?",
			3,
		"T�m hi�u nhi�m v� ch� tuy�n./#ShowTaskInfo(1,2)",
		"T�m hi�u nhi�m v� ph� tuy�n./#ShowTaskInfo(1,3)",
		--"������֮�������ѯ��/conf_task_inq",
		"Nh�n ti�n gh� qua th�i!/cancel")
end

--**************************������֮�������ѯ****************************
function conf_task_inq()
	if IsTongMember() == 0 then
		Say("B�n ch�a gia nh�p bang h�i n�o!",
			1,
			"Ta bi�t r�i/cancel"
		)
	else
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackStepInq")
	end
end
function CallBackStepInq(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--���������ж�--
	if tong_level_max == nil or tong_level_max <= 0 then
		ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
		return
	end
	--����--
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	local dialog_date_now = ""					--�����������ʱ��
	local dialog_date_next =""					--��������ʼʱ��
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date_now = "24h t�i nay "
		dialog_date_next = "24h t�i mai "
	else
		dialog_date_now = "24h t�i mai "
		dialog_date_next = "24h t�i m�t "
	end
	local dialog_conf = ""
	if tong_state == 1 then
		dialog_conf = "\n Qu� bang v�n ch�a nh�n chu�i nhi�m v� n�y, nhi�m v� n�y ��n <color=yellow>"..dialog_date_now.."<color> k�t th�c."
	elseif tong_state == 2 then
		local cent = Zgc_conf_task_cent_date(0,956)
		local times = Zgc_conf_task_cent_date(1,956)
		if times ~= Zgc_conf_task_time_return() then
			cent = 0
		end
		dialog_conf = "\n Qu� bang �� nh�n nhi�m v�, t�nh h�nh thu th�p v�t ph�m hi�n l�:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1]..", chu�i nhi�m v� n�y ��n <color=yellow>"..dialog_date_now.."<color> k�t th�c. \n Nhi�m v� c�a b�n hi�n �� ho�n th�nh:"..cent.."/"..Zgc_conf_task_num_max().."."
	elseif tong_state == 3 then
		dialog_conf = "\n Qu� bang �� ho�n th�nh nhi�m v� l�n n�y, bang ch�, ph� bang ch�, tr��ng l�o ��u c� th� ��n nh�n ph�n th��ng. Chu�i nhi�m v� n�y ��n <color=yellow>"..dialog_date_now.."<color> k�t th�c."
	elseif tong_state == 4 then
		dialog_conf = "\n Qu� bang �� ho�n th�nh nhi�m v� v� nh�n ���c ph�n th��ng. Chu�i nhi�m v� l�n sau ��n <color=yellow>"..dialog_date_now.."<color> k�t th�c."
	end
	Say(dialog_conf,
		1,
		"Ta bi�t r�i/cancel")
end
--**************************�����������ת��************************
function CallBackDataRepair(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,GetTongName())
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if tong_level_max == nil or tong_level_max <= 0 then
		tong_ID = 0
		tong_level = 0
		tong_num = 0
		tong_state = 0
		tong_level_max = 1
	end
	local add_flag = AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	return
end
--**************************�ִμ��㺯��*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 57600)/(172800))
	return time_return
end
--**************************���������ڷ�װ����*************************
function Zgc_conf_task_cent_date(diff_flag,task_id)
	local cent_return = 0
	local date_return = 0
	local data_save = GetTask(task_id)
	if diff_flag == 0 then
		cent_return = floor (data_save/10000)
		return cent_return
	else
		date_return = data_save - ((floor (data_save/10000))*10000)
		return date_return
	end
end
--**************************��һ��ʱ�����*****************************
function Zgc_conf_task_dist_date()
	local date_tomorrow = floor((GetTime() + 28800)/(172800))
	if Zgc_conf_task_time_return() == date_tomorrow then
		return 2
	else
		return 1
	end
end
--*************************����ȡ�ռ�Ʒ���޼��㺯��**********************
function Zgc_conf_task_num_max()
	local ruturn_num = 0
	if GetLevel() > 50 then
		ruturn_num = 400
	else
		local num_seq = floor(GetLevel()/10)
		ruturn_num = Zgc_conf_task_goods_need[num_seq]
	end
	return ruturn_num
end
--*******************************����**************************************
function Chaxunnpc()
	Say("Ng��i mu�n h�i ng��i n�o?",
			2,
		"T�m ng��i ch� ��nh./GetNpcName",
		"Nh�n ti�n gh� qua th�i!/cancel")
end

function ShowTaskInfo(nNum,nType)

local i = 0;
local strTalk = "Nhi�m v� c�a ng��i:";
local nTaskInfoStr = "";
local RowNumTab = SearchTaskInfoRowNum(nType);
local tabTaskFile = GetTaskTabFile(nType);

	if getn(RowNumTab) == 0 then
		TalkEx("",{"Hi�n ng��i kh�ng c� nhi�m v�."})
		return
	end

	if nNum == 1 then
		if getn(RowNumTab) <= nNum then
			TalkEx("",{"Nhi�m v� c�a ng��i:"..tabTaskFile:getCell(RowNumTab[nNum],"TaskInfo")})
		else
			nNum = nNum + 1;
			TalkEx("#ShowTaskInfo("..nNum..","..nType..")",{"Nhi�m v� c�a ng��i:"..tabTaskFile:getCell(RowNumTab[nNum-1],"TaskInfo")})
		end
	elseif nNum >= getn(RowNumTab) then
		TalkEx("",{tabTaskFile:getCell(RowNumTab[nNum],"TaskInfo")})
	else
		nNum = nNum + 1;
		Talk(1,"#ShowTaskInfo("..nNum..","..nType..")",tabTaskFile:getCell(RowNumTab[nNum-1],"TaskInfo"))
	end
end

--���ݽ�ɫ�ȼ�����ر���ֵ�������������ID
function SearchTaskInfoRowNum(nType)

local i = 0;
local j = 0;
local nTaskID = 0;
local nTaskVaule = 0;
local nLevel = GetLevel();
local RowNumTab = {};
local tabTaskFile = GetTaskTabFile(nType);

	for i=3,tabTaskFile:getRow() do
		if nLevel >= tonumber(tabTaskFile:getCell(i,"Level")) then
			nTaskID = tonumber(tabTaskFile:getCell(i,"TaskID"));
			nTaskVaule = tonumber(tabTaskFile:getCell(i,"TaskValue"));
			if GetTask(nTaskID) == nTaskVaule then
				tinsert(RowNumTab,i);
			end
		end
	end

	return RowNumTab

end


function GetNpcName()

	Msg2Player("Xin nh�p t�a �� Npc mu�n t�m.");
	AskClientForString("SearchNpcName","",1,31,"Xin nh�p t�n Npc");

end

function SearchNpcName(nNpcName,nNum)

local i = 0;
local nPosX = 0;
local nPosY = 0;
local nNpcNameS = "";
local nMapName = "";
local nTabName = "";
local strSay = {};
local NameTab = {};
local PosRowNumTab = {};

	--���зǷ��ַ�
--	for i=1,strlen(nNpcName) do
--		if strbyte(nNpcName,i) <= 127 then
--			TalkEx("GetNpcName",{"����ָ�ϣ�������뺬�з������֣����ܽ��в�ѯ�����������롣"});
--			return
--		end
--	end

	if nNum == 0 then
		nNum = 1;
	end

	--������ȫƥ������
	for i=3,tabNpcPos:getRow() do
		if nNpcName == tabNpcPos:getCell(i,"NpcName") then
			tinsert(PosRowNumTab,i);
		end
	end

	if getn(PosRowNumTab) >= 1 then
		tinsert(strSay,"T�a �� Npc \n");
	else
		--���Һ������ֹؼ�������
		for i=1,strlen(nNpcName) do
			tinsert(NameTab,strsub(nNpcName,i,i+1))
			i = i+1;
		end

		for i=1,getn(NameTab) do
			for j=3,tabNpcPos:getRow() do
				nTabName = tabNpcPos:getCell(j,"NpcName");
				for k=1,strlen(nTabName) do
					if NameTab[i] == strsub(nTabName,k,k+1) then
						tinsert(PosRowNumTab,j);
					else
						k = k + 1;
					end
				end
			end
		end

		if getn(PosRowNumTab) >= 1 then
			tinsert(strSay,"Kh�ng t�m th�y t�a �� Npc, nh�ng t�a �� li�n quan \n");
		else
			TalkEx("",{"Xin l�i! Kh�ng t�m th�y t�a �� Npc, th� ki�m tra l�i t�n Npc!"});
			return
		end
	end

	if getn(PosRowNumTab) - nNum < 5 then
		for i=nNum,getn(PosRowNumTab) do
			nNpcNameS = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcNameS) do
				nNpcNameS = nNpcNameS.." ";
			end
			tinsert(strSay,nNpcNameS.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
			end
		if getn(PosRowNumTab) - nNum < nNum - 1 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang tr��c/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		end
		tinsert(strSay,"R�i kh�i/cancel");
		SelectSay(strSay)
		return
	else
		for i=nNum,nNum + 4 do
			nNpcNameS = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcNameS) do
				nNpcNameS = nNpcNameS.." ";
			end
			tinsert(strSay,nNpcNameS.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		end
		if nNum >= 5 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang tr��c/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
			nNum = nNum + 8;
		else
			nNum = nNum + 4;
		end
		tinsert(strSay,"Trang k�/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		tinsert(strSay,"R�i kh�i/cancel");
		SelectSay(strSay)
		return
	end
end

function ShowMapNpcPos(nNum)

local i = 0;
local j = 0;
local nPosX = 0;
local nPosY = 0;
local nMapName = "";
local nNpcName = "";
local strSay = {};
local PosRowNumTab = {};
local nMapID = GetWorldPos();

	for i=3,tabNpcPos:getRow() do
		if nMapID == tonumber(tabNpcPos:getCell(i,"MapID")) then
			tinsert(PosRowNumTab,i);
		end
	end

	if getn(PosRowNumTab) <= 0 then
		TalkEx("",{"Xin l�i! Khu v�c n�y kh�ng t�m th�y t�a �� Npc."});
	elseif getn(PosRowNumTab) - nNum < 5 then
		tinsert(strSay,"T�a �� Npc � khu v�c n�y \n \n");
		for i=nNum,getn(PosRowNumTab) do
			nNpcName = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcName) do
				nNpcName = nNpcName.." ";
			end
			tinsert(strSay,nNpcName.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#ShowMapNpcPos("..nNum..")");
		end
		if getn(PosRowNumTab) - nNum < nNum - 1 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang tr��c/#ShowMapNpcPos("..nNum..")");
		end
		tinsert(strSay,"R�i kh�i/cancel");
		SelectSay(strSay)
	else
		tinsert(strSay,"T�a �� Npc � khu v�c n�y \n \n");
		for i=nNum,nNum + 4 do
			nNpcName = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,20-strlen(nNpcName) do
				nNpcName = nNpcName.." ";
			end
			tinsert(strSay,nNpcName..nMapName.."     "..nPosX.."     "..nPosY.."/#ShowMapNpcPos("..nNum..")");
		end
		if nNum >= 5 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang tr��c/#ShowMapNpcPos("..nNum..")");
			nNum = nNum + 8;
		else
			nNum = nNum + 4;
		end
		tinsert(strSay,"Trang k�/#ShowMapNpcPos("..nNum..")");
		tinsert(strSay,"R�i kh�i/cancel");
		SelectSay(strSay)
	end
end

--��ȡ��Ӧ���
function GetTaskTabFile(nType)

local tabTaskFile;

	if nType==1 then
		tabTaskFile = tabLevelTaskInfo;
	elseif nType==2 then
		tabTaskFile = tabTaskInfo;
	elseif nType==3 then
		tabTaskFile = tabZXTaskInfo;
	end

	return tabTaskFile;

end

function Timechaxun()
	local sTimeLeft = "";
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	sTimeLeft = nHour.." gi� "..nMin.." Ph�t "
	Talk(1,"","Th�i gian hi�n t�i c�n <color=yellow>"..sTimeLeft.."<color>. C�c v� ��i hi�p nh� n�m b�t th�i gian!");
end;

function wuogongmiji()		--�书���ؼ���˵��
	Say("Ng��i mu�n h�i v�n �� g�?",
			3,
		"C�ch s� d�ng v� c�ng./Wugongshuoming",
		"C�ch s� d�ng m�t t�ch./Mijishuoming",
		"Kh�ng c�n ��u!/cancel")
end

function Wugongshuoming()		--�书˵��
	Say("Ng��i mu�n h�i v�n �� g�?",
			6,
		"L�m sao s� d�ng v� c�ng./shiyongwugong",
		"L�m sao ch�n ��ng c�p v� c�ng./xuanzewugongdengji",
		"V� c�ng chu�t tr�i v� chu�t ph�i c� ph�n bi�t kh�ng?/zuojianyoujian",
		"L�m sao  �� s� d�ng c�c s� ph�m t�t b�n d��i?/bianjikuaijie",
		"Ngo�i thanh s� ph�m t�t ra c�n ph�m t�t v� c�ng kh�ng?/qitakuaijie",
		"Kh�ng c�n ��u!/cancel")
end

function shiyongwugong()
		Say("\nGiao di�n b�n d��i l� 2 � tr�i ph�i ch�a k� n�ng v� c�ng, nh�n v�o ch�n k� n�ng mu�n s� d�ng l� ���c. \n\nThao t�c: \nNh�n v�o thanh v� c�ng b�n d��i - b�n ph�i ch�n v� c�ng - nh�n chu�t tr�i l�n v� c�ng", 0);
end;

function xuanzewugongdengji()
		Say("\nMu�n s� d�ng v� c�ng kh�c, ph�i qua thao t�c sau. \nTr��c ti�n nh�n chi�u th�c m�n ph�i ho�c F5. \n Sau �� ch�n v� c�ng ch� ��ng (v� c�ng b� ��ng kh�ng th� ch�n ��ng c�p) s� hi�n giao di�n ch�n v� c�ng. \n Cu�i c�ng ch�n k� n�ng th�ch h�p, nh�n ph�m t�t s� l� ���c.",
		1,
		"Trang k�/xuanzewugongdengji2")
end

function xuanzewugongdengji2()
		Say("\n V� sau nh�n ph�m t�t s� t��ng �ng v� c�ng l� c� th� s� d�ng cho chu�t ph�i. \n\nThao t�c: \nNh�n F5 - m� giao di�n v� c�ng - nh�n v� c�ng b�t k� (tr� v� c�ng b� ��ng) - m� giao di�n v� c�ng l�a ch�n - nh�n ph�m t�t s� t��ng �ng v� c�ng l� c� th� s� d�ng cho chu�t ph�i.",0)
end

function zuojianyoujian()
		Say("\n V� c�ng chu�t tr�i khi nh�n l�n qu�i s� ��nh li�n t�c. \nV� c�ng chu�t ph�i khi nh�n l�n qu�i n�u �� m�nh ch� ��nh m�t l�n.", 0);
end;

function bianjikuaijie()
		Say("\nThanh ph�m t�t s� g�m 4 t� cho ng��i ch�i s� d�ng \nNh�n m�i t�n b�n ph�i thanh ph�m t�t s� s� th�y ���c giao di�n S�p x�p, b�n c� th� ��a v� c�ng, trang b�, m�t t�ch, ��o c� v�o thanh ph�m t�t. \nS�p x�p xong thanh ph�m t�t b�n ph�i c� h�nh kh�a m�c ��nh, kh�a l�i l� kh�ng th� thay ��i. \nTa c� th� d�ng m�i t�n l�n xu�ng thay ��i thanh ph�m t�t, ho�c d�ng d�u ~.",
		1,
		"Trang k�/bianjikuaijie2")
end

function bianjikuaijie2()
		Say("\n M�c ��nh thanh ph�m t�t theo th� t� 1 - 2 - 3 - 4. Sau khi kh�a � ph�m t�t, khi s� d�ng s� b� qua � ��, v� d�: Kh�a � 3. theo th� t� s� l� 1 - 2 - 4 - 1.", 0);
end;

function qitakuaijie()
		Say("\nNgo�i thanh ph�m t�t s�, trong thanh v� c�ng nh�n Q, W, E, A, S, D, Z, X, C �� thi�t l�p ph�m t�t nhanh cho v� c�ng ��. \n", 0);
end;

function Mijishuoming()		--�ؼ�˵��
	Say("Ng��i mu�n h�i v�n �� g�?",
			7,
		"M�t t�ch d�ng �� l�m g�?/mijizuoyong",
		"�� t�ng c��ng v� c�ng n�n d�ng m�t t�ch g�?/jinengqianghua",
		"Ph��ng th�c tu luy�n./xiuweishuoming",
		"Ta d�ng bao nhi�u quy�t y�u, m�t t�ch ��y?/qitashuoming",
		"L�m c�ch n�o �� h�c m�t t�ch?/mijixiulian",
		"Sao ph�n bi�t m�t t�ch?/haohuaipanduan",
		"Kh�ng c�n ��u!/cancel")
end

function mijizuoyong()
		Say("\n M�i m�t t�ch ��u mang v� c�ng, sau khi tu luy�n ��t ��n m�t tr�nh �� nh�t ��nh s� s� d�ng ���c m�t t�ch v� c�ng ��. \nM�t t�ch g�n quy�t y�u c� th� l�m m�nh th�m v� c�ng.", 0);
end;

function jinengqianghua()
		Say("\n M�i m�t t�ch c� 4 gi� tr� ph�n bi�t Th�m h� ��nh ch� ��ng ngo�i c�ng; Th�m h� ��nh ch� ��ng n�i c�ng; Th�m ��nh h� tr�; Th�m ph�ng th�. \n M�i quy�t y�u t��ng �ng v�i 1 v� c�ng v� mang 1 trong 4 lo�i tr�n. Khi g�n quy�t y�u v�o m�t t�ch s� c�n c� tr� s� v� lo�i h�nh t� �� c�ng th�m cho v� c�ng. \n Nh�n chu�t ph�i l�n quy�t y�u �� g�n v�o m�t t�ch. ",
		1,
		"Trang k�/xiuweishuoming2")
end

function jinengqianghua2()
		Say("\n V� d�: \n T�c d�ng c�a quy�t y�u T�ch D��ng ki�m kh� l� t�ng t�c �� thi tri�n, l�n nh�t 25%. Thu�c k� n�ng ch� ��ng h� n�i c�ng. \n Khi ���c g�n v�o m�t t�ch h� ��nh ch� ��ng n�i c�ng th�m 80% s� ph�t huy t�c �� thi tri�n chi�u �� (25%*80%) t�c 20%.", 0);
end;

function xiuweishuoming()
		Say("\n Tu luy�n l� ch� t�o m�t t�ch, th�ng qua th�i gian online. \n B� quan tu luy�n gi�p t�ng t�c ��ng th�i m�t s� ch�c n�ng v� ho�t ��ng nh� Th�i H� Huy�n c�nh c�ng tr�c ti�p nh�n ���c tu luy�n.", 0);
end;

function qitashuoming()
		Say("\n M�t t�ch g�n ���c bao nhi�u quy�t y�u l� do s� l��ng ph� l�c. M� th�m s� tr� m�t t�ch v� s� l��ng ph� l�c c� th� th�ng qua tu luy�n m�t t�ch n�ng cao ��ng c�p nh�n ���c.", 0);
end;

function mijixiulian()
		Say("\n Tr��c ti�n trang b� m�t quy�n m�t t�ch, nh�n n�t chi�u th�c m�n ph�i ho�c F5 m� giao di�n v� c�ng, sau �� nh�n n�t ph�n trang. Nh�n ti�p tu luy�n nh�p tr� tu luy�n c�n t�n, x�c ��nh �� luy�n m�t t�ch. \n \n Thao t�c: \n Nh�n F5 m� giao di�n v� c�ng - nh�n ph�n trang m�t t�ch - nh�n tu luy�n - nh�p s� nh�n *��ng �* l� ���c.",
		1,
		"Trang k�/mijixiulian2")
end

function mijixiulian2()
		Say("\n M�t t�ch c�p 9 - c�p 10, c�p 19 - c�p 20�c�p 89 - c�p 90, c�p 98 - c�p 99 ��u c� t� l� l�nh ng� v� c�ng, v� v�y tu luy�n v� sau s� cao h�n nhi�u. H�n n�a ph�i tu luy�n �� c�p m�i c� th� ti�p t�c. M�t t�ch b�t ��u tu luy�n m�i l�n 1 c�p s� c� t� l� t�ng �i�m s� v� s� trang ph� l�c.", 0);
end;

function haohuaipanduan()
		Say("\n Nh�n ��nh m�t t�ch b�ng c�ch: \nTh� 1. t�ng s� l�nh ng� k� n�ng. \n Th� 2. s� trang ph� l�c. \nTh� 3. tr� c�ng th�m m�t t�ch. \n V� v�y m�t quy�n m�t t�ch lo�i t�t ngo�i c�n t�n s� k� n�ng cao ra quan tr�ng s� trang ph� l�c v� c�ng th�m k� n�ng.", 0);
end;

function mapkaiqi()		--��ͼ������ѯ
	Say("Ng��i kh�ng v�o ���c n�i n�o?",
			8,
		"��i th�o nguy�n ph�a b�c Nh�n M�n quan./dacaoyuan",
		"B� l�c V��ng K� ph�a b�c ��i th�o nguy�n./wangqibulu",
		"Giang T�n Th�n � h��ng ��ng nam Th�nh �� ph�./jiangjincun",
		"Phong Ma ��ng � Giang T�n Th�n./fengmodong",
		"Phong �� Qu� th�nh ph�a ��ng Giang T�n Th�n./fengduguicheng",
		"��ng H�i H�i T�n g�n Tuy�n Ch�u./donghaihaibin",
		"Trang sau./mapkaiqi2",
		"Ta kh�ng c� b�n �� �� v�o trong./cancel")
end

function mapkaiqi2()		--��ͼ������ѯ
	Say("Ng��i kh�ng v�o ���c n�i n�o?",
			8,
		"��o Hoa ��o � ngo�i bi�n./taohuadao",
		"Thanh Kh� ��ng � Long Tuy�n Th�n./qingxidong",
		"L��ng Th�y ��ng � V� Di s�n./liangshuidong",
		"Thi�n T�m th�p � ��i L�./qianxunta",
		"T�y Song B�n N�p � ph�a nam �i�m Th��ng s�n./xishuangbanna",
		"Long Nh�n ��ng � �i�m Th��ng s�n./longyandong",
		"Trang tr��c./mapkaiqi",
		"Ta kh�ng c� b�n �� �� v�o trong./cancel")
end

function dacaoyuan()
		Say("\nMu�n v�o ��i th�o nguy�n ph�i m� h� th�ng nhi�m v� Thi�n M�n tr�n, ho�n th�nh xong t�m H�n Tr� Nh��ng.", 0);
end;

function wangqibulu()
		Say("\nMu�n v�o b� l�c V��ng K� ph�i m� h� th�ng nhi�m v� Thi�n M�n tr�n, sau khi ho�n th�nh nhi�m v� ��i th�o nguy�n h�i l� cho l�nh canh b� l�c ho�c gi�p Nhi�u L�n chuy�n h�ng.", 0);
end;

function jiangjincun()
		Say("\nMu�n v�o Giang T�n Th�n ph�i m� h� th�ng nhi�m v� Phong �� Qu� th�nh, ho�n th�nh nhi�m v� n�n d�n Th�nh ��, t�m Tr��ng ��nh.", 0);
end;

function fengmodong()
		Say("\nMu�n v�o Phong Ma ��ng ph�i m� h� th�ng nhi�m v� Phong �� qu� th�nh, gi�p Tr��ng ��nh gi�i ��c xong b�t ��u nhi�m v� gi�p D��ng Nguy�t s� th�i thu th�p U Linh.", 0);
end;

function fengduguicheng()
		Say("\nMu�n v�o Phong �� Qu� th�nh ph�i m� h� th�ng nhi�m v� Phong �� qu� th�nh, gi�p ch� t�o ��n �n linh ph�, mang v�t ph�m ch� ��nh.", 0);
end;

function donghaihaibin()
		Say("\nMu�n v�o ��ng H�i H�i T�n ph�i t� c�p 50 tr� l�n, nh�n nhi�m v� � Vi�n Tinh [(198.199) B�c Tuy�n Ch�u].", 0);
end;

function taohuadao()
		Say("\nMu�n v�o ��o Hoa ��o ph�i m� nhi�m v� ��ng H�i H�i T�n, ph�a ��ng ��ng H�i H�i T�n 2 t�m thuy�n phu ng�i thuy�n.", 0);
end;

function qingxidong()
		Say("\nMu�n v�o Thanh Kh� ��ng ph�i m� h� th�ng nhi�m v� H� H�u C�m � D��ng Ch�u, nh�n nhi�m v� c�a L�i Th�ng trong Thanh Kh� ��ng.", 0);
end;

function liangshuidong()
		Say("\nMu�n v�o L��ng Th�y ��ng ph�i m� h� th�ng nhi�m v� H� H�u C�m D��ng Ch�u, gi�p L�u Huy�n Thanh ��n Thanh Kh� ��ng ��nh Th��ng th�n.", 0);
end;

function qianxunta()
		Say("\nMu�n v�o Thi�n T�m th�p ��ng c�p t� 70 tr� l�n.", 0);
end;

function xishuangbanna()
		Say("\nMu�n v�o T�y Song B�n N�p b�c ��ng c�p t� 75 tr� l�n.", 0);
end;

function longyandong()
		Say("\nMu�n v�o Long Nh�n ��ng ph�i m� h� th�ng nhi�m v� � Tr�nh Qu�n Chi ��i L�, nh�n nhi�m v� t�m b�n ��ng h�nh m�t t�ch � Long Nh�n ��ng.", 0);
end;

function no()

end