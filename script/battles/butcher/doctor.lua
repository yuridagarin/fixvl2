--�����
--�����޸�Ϊ�򿪴�����

Include("\\script\\battles\\battleinfo.lua")

function main(sel)
	--Say("����٣����Ǹ����Ӫ����ľ���٣�����ʲô��Ҫ��",3,"����ҩƷ/salemedicine","���Ź�֮ս�Ĺ���/bt_onbattleinfo","�����ˣ�лл/cancel")
	Say("Ta ph� tr�ch qu�n nhu, ng��i c�n g�?", 3, "M� r��ng ch�a ��/OpenStoreBox","T�m hi�u quy t�c Nh�n M�n chi�n/bt_onbattleinfo","Kh�ng c�n ��u! C�m �n!/cancel");
end;

--function salemedicine(sel)
--	Sale(50)
--end

function OpenStoreBox()
	OpenBox();
end;

