-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");

Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\������\\����\\npc\\�²�Ϊ.lua";	--Ĭ��ֵ
g_szInforHeader = "<color=green>Tr�n B�t Vi<color>:";	--Ĭ��ֵ
g_nBackRoomEntryType = 1;	--������ͣ������֡�1��ʾ��ʦ�������룬2��ʾ�ӵ��ߴ�����

function main()
	--backroom_main();
	
	--һ������µĶԻ�
	strTalk = {
		{"Tr�n B�t Vi: L�n tr��c ta du ngo�n B�ch Vi�t ��ng l� vui kh�ng t� n�i."},
		{"Tr�n B�t Vi: M�i l�n du ngo�n ta ��u ti�n tay thu ph�c y�u ma tr�n ���ng, m�i l�n ta ��u b� th��ng nh�. Kh�ng ph�i v� ta k�m c�i m� khu�n m�t c�a Mai s� mu�i trong l�c tr� th��ng l�m ta kh� qu�n. "},
		{"V�n phi�u t�n th�ng h� ca dao, ti�u di�u t� ph��ng�"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
end