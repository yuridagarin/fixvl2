-- 精英帮会战 红包
-- by windle 2009-2-13 14:35

Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d%H")) > 09113024 then--使用期限要修改
		return
	end
	if GetTask(TASKID_JYBHZ_USE_HONGBAO) >= 2 then
		Talk(1,"","M鏸 ngi ch? c? th? s? dung Bang H閕 Tinh Anh H錸g Bao 2 l莕.!");
		return
	end
	if GetLevel() <= 65 then
		Talk(1,"","Чi hi謕 ph秈 c? c蕄 65 tr? l猲 m韎 c? th? s? d鬾g.");
		return
	end
	Say("S? d鬾g Bang H閕 Tinh Anh H錸g Bao thu 頲 2500000 kinh nghi謒, i hi謕 c? ch綾 mu鑞 s? d鬾g??",
		2,
		"Л頲/#onOpen("..nItemIdx..")",
		"Kh玭g c莕 u/nothing");
end

function onOpen(nItemIdx)
	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(TASKID_JYBHZ_USE_HONGBAO, GetTask(TASKID_JYBHZ_USE_HONGBAO) + 1);		
		gf_Modify("Exp", 2500000);
		WriteLogEx("Bang hoi tinh anh 2","s? d鬾g H錸g Bao","","","",GetTongName())		
	end
end
