--�����ɿ���
Include("\\script\\lib\\globalfunctions.lua");

VET_XU_NUM = 20 
EVENT_LOG_TITLE = "Hoat dong thang 2 nam 2012"

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 120210 or nDate > 120219 then
		Talk(1, "", "�� h�t h�n mua S�c�la t�nh nh�n!")
		return
	end
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Ch�o m�ng l� t�nh nh�n ng�y 14/02. B�n h�y mua S�c�la s� d�ng cho l� t�nh nh�n:"
	local tbSayDialog = {};
	local nSaySize = 0;

	tinsert(tbSayDialog, "Ta mu�n mua S�c�la t�nh nh�n/buy_chocolate")
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
	
end
function buy_chocolate()
	if GetItemCount(2,1,30230) < VET_XU_NUM then
		Talk(1,"",format("Xu ��o c� kh�ng �� <color=green>%d<color>",VET_XU_NUM))
		return 0;
	end
	if DelItem(2,1,30230,20) == 1 then
		local nRet,nIndex = AddItem(2,1,30356,1);
		SetItemExpireTime(nIndex,24*60*60);
		WriteLogEx(EVENT_LOG_TITLE, "mua",1,"th�nh c�ng s�cola")
		return 1;
	end
	return 0;
end

function do_nothing()

end