--create date:2007-08-13 20:03
--author:yanjun
--describe:�հ׵ļ̳��飬ʹ�øõ��߿۳����1000���Ϲ����֣�
--�۳�һ���հ׵ļ̳��飬�������������5���µ��ߣ������ļ̳���
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = "T� Quang B�i";
function OnUse(nItemIdx)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 1000 then
		Talk(1,"","�i�m t�ch l�y T� Quang C�c c�a ��i hi�p <color=yellow> "..nPoint.." <color>�i�m, v�n ch�a �� <color=yellow>1000<color> ��, kh�ng th� s� d�ng "..g_szItemName..".");
		return 0;
	end;
	local selTab = {
				format("��ng �/#use(%d)",nItemIdx),
				"H�y b�/nothing",
				}
	Say("Ng��i ��ng � s� d�ng <color=yellow>"..g_szItemName.."<color> ? Sau khi s� d�ng s� thu ���c <color=yellow>5 T� Quang L�nh<color>, ��ng th�i s� tr� <color=yellow>1000<color> �i�m T� Quang C�c c�a ��i hi�p.",getn(selTab),selTab);
end;

function use(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i h�nh trang!");
		return 0;
	end;
	local nExpireTime = GetItemExpireTime(nItemIdx) or 30 * 24 * 60 * 60
	if DelItemByIndex(nItemIdx,1) == 1 then		
		for i=1,5 do
			local nRet,nIdx = AddItem(2,0,763,1);
			if nRet == 1 then
				SetItemExpireTime(nIdx,nExpireTime)
			end			
		end
		SetTask(TSK_POINT,GetTask(TSK_POINT)-1000);
		Msg2Player("C�c h� nh�n ���c 5 T� Quang L�nh");
		Msg2Player("�i�m T� Quang C�c c�a ��i hi�p b� tr� 1000.");
		WriteLog("[Bang h�i v��t �i]:"..GetName().."S� d�ng 1	"..g_szItemName);
	end;
end;