--=============================================
--create by baiyun 2009.10.15
--describe:Խ�ϰ�10�¹���ս��������ʼ������ս������
--���ڹ���������1Ϊ����̨��2Ϊ��Ͷ��ս��
--=============================================
Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
File_name = "\\script\\missions\\bw\\siege\\init_gongcheng_type.lua";

function main()
	if tonumber(date("%w")) == 6 then--�������������һ�ֹ���ս�ʸ�����
		local nType = 1--random(1, 2);
		SetGlbValue(CITY_GLB_VALUE_TYPE, nType);
		WriteLog("[Ch�n ng�u nhi�n tranh �o�t c�ng th�nh chi�n]: Lo�i h�nh tranh �o�t c�ng th�nh chi�n l�n n�y l�: "..tSignMethod[nType]);
		AddRelayShareData("gongchengtype", 0, 0, File_name, "clear_data", 2, "type", "d", nType); 
	end
end

function clear_data()
	ClearRelayShareData("tiaozhanling", 0, 0, File_name, "nothing");
end

function nothing()
	WriteLog("Last week tiaozhanling data has been cleared successful");
end