Include("\\script\\online_activites\\201204\\changkuaishujia\\changkuaishujia.lua")
Include("\\script\\online_activites\\201205\\exchange_award.lua")
Include("\\script\\vng\\doinguyenlieu.lua")

function main()
	local tbSay = {};
	local nDate = tonumber(date("%Y%m%d"))
	--����table
	if gf_CheckEventDateEx(VET_CKSJ_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_CKSJ_Say_Tb) do
			tinsert(tbSay,Vet_CKSJ_Say_Tb[i]);
		end
	end
	--2012��6�»
	if gf_CheckEventDateEx(VET_ExcAw_ACITIVITY_ID) == 1 then
		for i=1,getn(Vet_ExcAw_Say_Tb) do
			tinsert(tbSay,Vet_ExcAw_Say_Tb[i]);
		end
	end

	tinsert(tbSay, "Thu ��i Qu�n d�ng/Trade_Material_Menu3")

	tinsert(tbSay,"Kh�ng c�n ��u/cancel");
	Say("Tr�ng thanh gi� m�t nh� th� n�y�sao kh�ng c�ng ta �i t�n b� ch�?",
		getn(tbSay),tbSay)
		--"��˵����������һЩ����ʧ���Ķ����������򼸸���/Suiyinbuy",
		--"��˵����������һЩ�Ϻõ���װ�·������뿴����/ClothBuy",
		--"��˵����������һЩ�Ϻõ���װ���ڣ����뿴����/CapBuy",
		--"��˵����������һЩ�Ϻõ���װ��ȹ�����뿴����/ShoeBuy",
		--"��˵����������һЩңԶ�����ս�ۣ����뿴����/ShijieBuy",
		--"�뿪û�¡�/cancel")
end

function cancel()
end

function Suiyinbuy()
   Sale(53)
end
function ClothBuy()
   Sale(56)
end
function CapBuy()
   Sale(57)
end
function ShoeBuy()
   Sale(58)
end
function ShijieBuy()
   Sale(87)
end