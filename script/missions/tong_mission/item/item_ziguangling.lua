--create date:2007-08-13 20:03
--author:yanjun
--describe:�����ļ̳��飬ʹ�������Լ�100���Ϲ�����
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = "T� Quang L�nh";
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(TSK_POINT,GetTask(TSK_POINT)+100);
		Msg2Player("B�n �� thu ���c 100 �i�m T� Quang C�c");
		WriteLog("[Bang h�i v��t �i]:"..GetName().."S� d�ng 1	"..g_szItemName);
	end;
end;