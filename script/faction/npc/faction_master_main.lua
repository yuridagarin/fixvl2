--�ű����ܣ�ʦ��NPC-ʦ�����ű�
--���ܿ������峤
--����ʱ�䣺2011-4-7
--�޸ļ�¼��
Include("\\script\\faction\\faction_head.lua")
function master_dia_sel_main(nFactionId,nRouteId)
	--e:\Խ��_����\2011��\fore_work\������\����ͳһ����_4-13\faction_master_main.lua ���ö�Ӧ����
end
--�������ɵĲ���
function join_route_main(nRouteId)
	--�����ռ���
	local nNeedItemRoom = 5
	if nRouteId == 30 or nRouteId == 2 then
		nNeedItemRoom = 6 
	end
	if gf_Judge_Room_Weight(nNeedItemRoom,200,format("<color=green>"..GetTargetNpcName().."<color>: n�u �� quy�t v�o m�n ph�i ta, b�n s� s� t�ng ng��i m�t v�i trang b� t�n th� xem nh� l� qu� nh�p m�n, h�y ch�nh l� l�i h�nh trang v� quay l�i t�m ta nh�n l�y (c�n <color=yellow>%d<color> � tr�ng h�nh trang!#",nNeedItemRoom)) ~= 1 then
		
		return 0
	end
	--ʦ��װ������
	Add_Faction_Equipment(nRouteId,GetBody(),40)
	return 1
end
