--create date:2007-08-13 20:44
--author:yanjun
--describe:�����ļ̳��飬ʹ�������Լ�100���Ϲ�����
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = " T� Quang M�t B�a";
g_tbItem = {
	[1] = {2,0,735,"T� Quang Li�t Vi�m C�m",1},
	[2] = {2,0,736,"T� Quang K� L�n V�",1},
	[3] = {2,0,737,"T� Quang Kim T�m Ti",2},
	[4] = {2,0,738,"M�nh Ti�t Ho�nh Th�",4},
	[5] = {2,0,739,"Th��ng C� K� L�n Huy�t",3},
	}
function OnUse(nItemIdx)
	local selTab = {};
	for i=1,getn(g_tbItem) do
		tinsert(selTab,format("%s (c�n %d %s)/#make_it(%d)",g_tbItem[i][4],g_tbItem[i][5],g_szItemName,i));
	end;
	tinsert(selTab,"�� ta ngh� l�i ��/nothing");
	Say("��i hi�p mu�n h�p th�nh v�t ph�m n�o b�n d��i?",getn(selTab),selTab);
end;

function make_it(nType)
	if gf_JudgeRoomWeight(2,20) == 0 then
		Talk(1,"","H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i h�nh trang!");
		return 0;
	end;
	local nNeedItemCount = g_tbItem[nType][5];
	if GetItemCount(2,0,761) < nNeedItemCount then
		Talk(1,"","S� l��ng "..g_szItemName.." tr�n h�nh trang c�a ��i hi�p kh�ng ��!");
		return 0;
	end;
	if DelItem(2,0,761,nNeedItemCount) == 1 then
		AddItem(g_tbItem[nType][1],g_tbItem[nType][2],g_tbItem[nType][3],1);
		WriteLog("[Bang h�i v��t �i]:"..GetName().."S� d�ng 1	"..g_szItemName..", h�p th�nh 1 "..g_tbItem[nType][4]);
	end;
end;