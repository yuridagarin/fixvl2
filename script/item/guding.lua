Include("\\script\\lib\\globalfunctions.lua");
TB_GUINSECT_INFO = 
{
	[1] = 
	{
		["name"] = "c�  ",
		[1] = {"c�",1},
	},
	[2] = 
	{
		["name"] = "��c h�",
		[1] = {"��c c�",2},	
		[2] = {"M�nh ��c c�",3},	
		[3] = {"��c y�u c�",4},
		[4] = {"Y�u c�",14},
		[5] = {"Th�c Y�u C�",15},	
		[6] = {"Y�u Ho�ng C�",16},
	},
	[3] = 
	{
		["name"] = "Huy�t h�",
		[1] = {"Huy�t c�",5},	
		[2] = {"Th� huy�t c�",6},	
		[3] = {"Huy�t Tinh c�",7},	
		[4] = {"Huy�n C�",20},	
		[5] = {"B�ng Huy�n C�",21},	
		[6] = {"Vong Ti�n c�",22},	
	},
	[4] = 
	{
		["name"] = "Linh h�",
		[1] = {"T�m c�",17},	
		[2] = {"Th�c T�m C�",18},	
		[3] = {"T�m S�t c�",19},	
		[4] = {"H��ng c�",8},	
		[5] = {"M� h��ng c�",9},	
		[6] = {"�� H� c�",10},	
		[7] = {"Linh c�",26},	
		[8] = {"Linh Lung c�",27},	
		[9] = {"Th�t Th�i Ti�u Ti�n C�",28},		
	},
	[5] = 
	{
		["name"] = "Ma h�",
		[1] = {"Thi c�",11},	
		[2] = {"Tam thi c�",12},	
		[3] = {"Qu� V��ng c�",13},	
		[4] = {"T�m c�",23},	
		[5] = {"Huy�t T�m c�",24},	
		[6] = {"Kim T�m c�",25},	
		[7] = {"Ma c�",29},	
		[8] = {"U �nh c�",30},
		[9] = {"V� �nh Ma C�",31},	
	},
}

GU_INSECT_ID1 = 2;	--�Ƶ���ƷID1
GU_INSECT_ID2 = 17;	--�Ƶ���ƷID2

TSK_BASE_ID = 2201;	--2201��2240������������
TSK_BASE_ID_LAST = 2240;--ӵ�е����һ���������
TSK_TEMP_ID = 126;	--��¼ȡ���ĹƵ�ID������������齫���ӵ���ʱ������һ���ģ�������������

MAX_SEL_PER_PAGE = 5;	--ÿҳ�����ʾ����

g_szInfoHeader = "<color=green>Th�n m�c v��ng ��nh<color>: ";

function OnUse()
	local selTab = {
				"B�t s�u /get_guinsect",
				"B� s�u v�o trong ��nh/put_guinsect",
				"Ch� xem � d��i ��nh/nothing",
				}
	Say(g_szInfoHeader.."��nh n�y ch�a c�c lo�i s�u trong thi�n h�, ng��i mu�n b�t s�u hay th� s�u?",getn(selTab),selTab);
end;
--ȡ����
function get_guinsect()
	local selTab = {};
	local nGuInsectNum = 0;
	for i=1,getn(TB_GUINSECT_INFO) do
		nGuInsectNum = get_guinsect_num(i);
		tinsert(selTab,TB_GUINSECT_INFO[i]["name"].."("..nGuInsectNum.." con)/#select_guinsect("..i..")");
	end;
	tinsert(selTab,"\nT�m th�i kh�ng b�t/OnUse");
	Say(g_szInfoHeader.."Ng��i mu�n b�t h� s�u n�o?",getn(selTab),selTab);
end;
--ѡ���
function select_guinsect(nType)
	list_page(1,nType);
end;
--�г��ɹ�ѡ��Ĺ�
function list_page(nPageNum,nType)
	local tbSelTab = get_select_list(nType);
	local nRecordCount = getn(TB_GUINSECT_INFO[nType]);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbSelTab[i]);
	end;
	local szCmdStr = "";
	if nPageNum ~= 1 then
		szCmdStr = "Trang tr��c/#list_page("..(nPageNum-1)..","..nType..")";
		tinsert(selTab,szCmdStr);
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		szCmdStr = "Trang k�/#list_page("..(nPageNum+1)..","..nType..")";
		tinsert(selTab,szCmdStr);	
	end;
	tinsert(selTab,"\nT�m th�i kh�ng b�t/get_guinsect");
	Say(g_szInfoHeader.."Ng��i b�t lo�i s�u n�o?",getn(selTab),selTab);
end;
--���ѡ������
function get_select_list(nType)
	local tbSelTab = {};
	local nCurNum = 0;
	local nGuInsectID = 0;
	local nTaskID = 0;
	for i=1,getn(TB_GUINSECT_INFO[nType]) do
		nGuInsectID = TB_GUINSECT_INFO[nType][i][2];
		nTaskID = TSK_BASE_ID+nGuInsectID-1;
		nCurNum = GetTask(nTaskID);
		szCmdStr = gf_FormatStringLength(TB_GUINSECT_INFO[nType][i][1],10).."("..nCurNum.." con)/#input_guinsect_num("..nType..","..i..","..nCurNum..")";
		tinsert(tbSelTab,szCmdStr);
	end;
	return tbSelTab;
end;
--����ȡ������
function input_guinsect_num(nType,nDetailType,nCurNum)
	local nGuInsectID = TB_GUINSECT_INFO[nType][nDetailType][2];
	local szGuInsectName = TB_GUINSECT_INFO[nType][nDetailType][1];
	if nCurNum <= 0 then
		Talk(1,"get_guinsect",g_szInfoHeader.."Trong ��nh c�a ng��i kh�ng c� lo�i s�u <color=yellow>"..szGuInsectName.."<color>.");
		return 0;
	end;
	SetTaskTemp(TSK_TEMP_ID,nGuInsectID);
	nCurNum = min(nCurNum,15000);	--���һ��ȡ������ֻ
	AskClientForNumber("get_guinsect_callback",1,nCurNum,"Nh�p s� l��ng b�t:");
end;
--�ص�
function get_guinsect_callback(nNum)
	local nGuInsectID = GetTaskTemp(TSK_TEMP_ID);
	local nTaskID = TSK_BASE_ID+nGuInsectID-1;
	local nCurGuInsectNum = GetTask(nTaskID);
	local nType,nDetailType = get_guinsect_info_idx(nGuInsectID);
	if nType == 0 then
		return 0;
	end;
	if gf_JudgeRoomWeight((floor(nNum/1000)+1),10) ~= 1 then
		return 0;
	end;
	local szGuInsectName = TB_GUINSECT_INFO[nType][nDetailType][1];
	if nCurGuInsectNum < nNum then
		Talk(1,"get_guinsect",g_szInfoHeader.."S� l��ng trong ��nh"..szGuInsectName.." kh�ng �� "..nNum.." con.");
		return 0;
	end;
	AddGuInsectIntoBottle(nGuInsectID,-nNum);
	AddItem(GU_INSECT_ID1,GU_INSECT_ID2,nGuInsectID,nNum);
	Msg2Player("B�n l�y ra "..nNum.." con"..szGuInsectName);
	select_guinsect(nType);
end;
--���ݹƵ�ID��ùƵ���Ϣ����
function get_guinsect_info_idx(nID)
	for i=1,getn(TB_GUINSECT_INFO) do
		for j=1,getn(TB_GUINSECT_INFO[i]) do
			if TB_GUINSECT_INFO[i][j][2] == nID then
				return i,j;
			end;
		end;
	end;
	return 0,0;
end;
--���ĳ��Ƶ�����
function get_guinsect_num(nType)
	local nTotalNum = 0;
	local nGuInsectID = 0;
	local nTaskID = 0;
	for i=1,getn(TB_GUINSECT_INFO[nType]) do
		nGuInsectID = TB_GUINSECT_INFO[nType][i][2];
		nTaskID = TSK_BASE_ID+nGuInsectID-1;
		nTotalNum = nTotalNum + GetTask(nTaskID);
	end;
	return nTotalNum;
end;
--�����������еĹ�
function put_guinsect()
	local nGuInsectNum = 0;
	local nGuInsectID = 0;
	local nTaskID = 0;
	local szGuInsectName = "";
	for i=1,getn(TB_GUINSECT_INFO) do
		for j=1,getn(TB_GUINSECT_INFO[i]) do
			nGuInsectID = TB_GUINSECT_INFO[i][j][2];
			nTaskID = TSK_BASE_ID+nGuInsectID-1;
			szGuInsectName = TB_GUINSECT_INFO[i][j][1];
			nGuInsectNum = GetItemCount(GU_INSECT_ID1,GU_INSECT_ID2,nGuInsectID);
			if nGuInsectNum > 0 then
				if DelItem(GU_INSECT_ID1,GU_INSECT_ID2,nGuInsectID,nGuInsectNum) == 1 then
					AddGuInsectIntoBottle(nGuInsectID,nGuInsectNum);
					Msg2Player("B�n �em "..nGuInsectNum.."c�i"..szGuInsectName.." b� v�o trong ��nh");
				end;
			end;
		end;
	end;
	Say("B�n �� �em t�t c� s�u c� trong t�i b� v�o trong ��nh!",0);
end;

function nothing()

end;

--=================================================================================
--�������ӿڹ��������
--�ı�ƶ���ĳ�ֹƵ�����
--nNumΪ��ʱ�����ӣ�Ϊ��ʱ�Ǽ���
function AddGuInsectIntoBottle(nID,nNum)
	local nTaskID = TSK_BASE_ID+nID-1;
	if nTaskID > TSK_BASE_ID_LAST then
		print(format("\n*********AddGuInsectIntoBottle(nID=%d,nNum%d) error nID must<=%d ",nID,nNum,TSK_BASE_ID_LAST-TSK_BASE_ID+1))
		return
	end
	local nCur=GetTask(nTaskID)
	local nCurNum = nCur+nNum;
	SetTask(nTaskID,nCurNum);
	SyncGuInsectNumInGuDing(nID,nCurNum);
	return 1;
end;
--�ӹƶ���ɾ��ĳ�ֹ�
function RemoveGuInsectFromBottle(nID,nNum)
	local nTaskID = TSK_BASE_ID+nID-1;
	local nCurNum = GetTask(nTaskID);
	if nCurNum >= nNum then	--���������������㹻��
		SetTask(nTaskID,nCurNum-nNum);
		SyncGuInsectNumInGuDing(nID,nCurNum-nNum);
		return 1;
	else
		local nGuNumInBag = GetItemCount(GU_INSECT_ID1,GU_INSECT_ID2,nID);	--��ð����������
		if nCurNum + nGuNumInBag >= nNum then	--���������Ӱ�����������㹻
			if DelItem(GU_INSECT_ID1,GU_INSECT_ID2,nID,nNum-nCurNum) == 1 then
				SetTask(nTaskID,0);
				SyncGuInsectNumInGuDing(nID,0);
				return 1;
			else
				return 0;
			end;
		else
			return 0;
		end;
	end;
	return 1;
end;
--��ùƶ��кͱ����п��õĸ���Ƴ�����
function GetAvailableGuInsectNum(nID)
	local nTaskID = TSK_BASE_ID+nID-1;
	return GetItemCount(GU_INSECT_ID1,GU_INSECT_ID2,nID) + GetTask(nTaskID);
end;
