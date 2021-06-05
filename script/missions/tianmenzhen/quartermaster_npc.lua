Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local selTab = {				
				"S�a ch�a/repair",
				"K�t th�c ��i tho�i/gf_DoNothing",
				}
	local szSaySth = "C� c�n gi�p g� kh�ng?";
	if GLB_TMZ_RealmCheck() ~= 1 then
		tinsert(selTab,1,"M� r��ng ch�a ��/open_box");
		tinsert(selTab,3,"Mua thu�c/#Sale(30)");
	end
	Say("<color=green>Qu�n nhu quan<color>:"..szSaySth,getn(selTab),selTab);
end;

function want_medicine()
	if gf_Judge_Room_Weight(3,300) == 1 then	
		AddItem(1,0,204,30);
		Msg2Player("Nh�n ���c 30 H�c Ng�c �o�n T�c Cao chi�n tr��ng chuy�n d�ng");	
		AddItem(1,0,205,30);
		Msg2Player("Nh�n ���c 30 Sinh Sinh T�o H�a T�n chi�n tr��ng chuy�n d�ng");	
		AddItem(1,0,206,30);
		Msg2Player("Nh�n ���c 30 V�n V�t Quy Nguy�n ��n chi�n tr��ng chuy�n d�ng");	
	else
		Talk(1,"","<color=green>Qu�n Nhu Quan<color>: kh�ng gian h�nh trang kh�ng ��, h�y ch�nh l� l�i. ");
	end;
end;

function gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--������˵���������
			Talk(1,"",szMsgHead.."H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i h�nh trang!");
		end;
		return 0;
	else
		return 1;
	end;
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"","Xin l�i! Ng��i ch�a c� r��ng ch�a ��.");
		return 0;
	end;
	OpenBox();
end;

function repair()
	local selTab = {
			"S�a mi�n ph?(�� b�n tr��c ��y >0)/repair1",
			"T�ng c�p/repair2",
			"S�a mi�n ph� (�� b�n tr��c ��y =0)/repair3",
			"tr� l�i/main"
			};
	Say("Kh�ch quan xem k� trang b� khi s�a ch�a.",getn(selTab),selTab)
end;

function repair1()
	AdvanceRepair(1);
end;

function repair2()
	AdvanceRepair(2);
end;

function repair3()
	AdvanceRepair(3);
end;
