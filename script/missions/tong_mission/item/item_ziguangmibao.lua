--create date:2007-08-13 20:44
--author:yanjun
--describe:署名的继承书，使用增加自己100点紫光阁积分
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = " T? Quang M藅 B醓";
g_tbItem = {
	[1] = {2,0,735,"T? Quang Li謙 Vi猰 C萴",1},
	[2] = {2,0,736,"T? Quang K? L﹏ V?",1},
	[3] = {2,0,737,"T? Quang Kim T祄 Ti",2},
	[4] = {2,0,738,"M秐h Ti謙 Ho祅h Th?",4},
	[5] = {2,0,739,"Thng C? K? L﹏ Huy誸",3},
	}
function OnUse(nItemIdx)
	local selTab = {};
	for i=1,getn(g_tbItem) do
		tinsert(selTab,format("%s (c莕 %d %s)/#make_it(%d)",g_tbItem[i][4],g_tbItem[i][5],g_szItemName,i));
	end;
	tinsert(selTab,"в ta ngh? l筰 /nothing");
	Say("Чi hi謕 mu鑞 h頿 th祅h v藅 ph萴 n祇 b猲 di?",getn(selTab),selTab);
end;

function make_it(nType)
	if gf_JudgeRoomWeight(2,20) == 0 then
		Talk(1,"","H祅h trang c馻 i hi謕 kh玭g  ch? tr鑞g ho芻 s鴆 l鵦 kh玭g , xin h穣 s緋 x誴 l筰 h祅h trang!");
		return 0;
	end;
	local nNeedItemCount = g_tbItem[nType][5];
	if GetItemCount(2,0,761) < nNeedItemCount then
		Talk(1,"","S? lng "..g_szItemName.." tr猲 h祅h trang c馻 i hi謕 kh玭g !");
		return 0;
	end;
	if DelItem(2,0,761,nNeedItemCount) == 1 then
		AddItem(g_tbItem[nType][1],g_tbItem[nType][2],g_tbItem[nType][3],1);
		WriteLog("[Bang h閕 vt 秈]:"..GetName().."S? d鬾g 1	"..g_szItemName..", h頿 th祅h 1 "..g_tbItem[nType][4]);
	end;
end;