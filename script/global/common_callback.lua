--��Ϸ���ܻص����ܽű�
Include("\\script\\function\\vip_card\\vc_head.lua")

--ǿ��һ��
function _Item_Enhance_CallBack(bIsSucc, enhLevel)
	--print("_Item_Enhance_CallBack", bIsSucc, enhLevel)
	_vc_EnhanceOnce(bIsSucc, enhLevel);
end

--װ������һ��
function _Equip_Evolution_CallBack(bIsSucc)
	_vc_Equip_Evolution(bIsSucc);
end