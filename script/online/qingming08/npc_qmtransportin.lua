--File name:npc_qmtransportin.lua
--Describe:2008年扫墓传送人（传进）
--Create Date:2008-3-18
--Author:ChenMoxian
Include("\\script\\online\\qingming08\\head_qingming.lua")--清明头文件

function main()


	if is_qingming_opened() == -1 then
		Talk(1,"","<color=green>"..get_transport_name()..":<color> Thanh Minh s緋 n r錳, h穣 gi祅h ch髏 th阨 gian  c髇g t? ti猲.");
	elseif is_qingming_opened() == 0 then
		Talk(1,"","<color=green>"..get_transport_name()..":<color> Ti誸 Thanh Minh  qua, "..get_player_sex().."nh? n╩ sau n c髇g t? t? ti猲.");
	elseif is_qingming_opened() == 2 then
		Talk(1,"","<color=green>"..get_transport_name()..":<color> Ho箃 ng Thanh Minh  ng.");
	elseif is_qingming_opened() == 1 then
		local selTab = {
					"дn "..get_tomb_name().." c髇g b竔./#gotocemetery("..get_type()..")",
					"Nh薾 1 quy觧 ch? nam ho箃 ng Ti誸 Thanh Minh./#AddItem(2,0,685,1)",
					"Ho箃 ng Ti誸 Thanh Minh./knowdetail",
					"H穣 quay l筰 c髇g t? sau nh?!/nothing",
					}
		Say("<color=green>"..get_transport_name()..":<color> Trong ti誸 Thanh Minh, "..get_player_sex().." c? mu鑞 n "..get_tomb_name().." b竔 t?, b祔 t? th祅h ? kh玭g?",getn(selTab),selTab);
	else
		WriteLog("Ti誸 Thanh Minh 2008: Kh玭g th? nh薾 頲 tr筺g th竔 ho箃 ng ti誸 Thanh Minh.");
		return FALSE;--出错
	end;
end;

--传送玩家到不同的墓园
function gotocemetery(MapIndex)
	if GetLevel() < 11 then
		Say("<color=green>"..get_transport_name()..":<color> Ngi v? luy謓 n <color=yellow>c蕄 11<color> m韎 n y t譵 ta.",0);
		return FALSE;
	end
	NewWorld(EnterPointTab[MapIndex][1],EnterPointTab[MapIndex][2],EnterPointTab[MapIndex][3]);
end;

function knowdetail()
	Talk(4,"","<color=green>"..get_transport_name()..":<color> Ho箃 ng Ti誸 Thanh Minh di詎 ra v祇 <color=yellow>3/4-12/4<color>, ngi ch琲 <color=yellow>c蕄 11<color> u c? th? tham gia b籲g c竎h 甶 t秓 m? c竎 i hi謕.",
				"<color=green>"..get_transport_name()..": <color>C髇g<color=yellow> b竔 m? ph莕 c竎 v? nh?<color> Ho祅g i hi謕, H祅 i hi謕, Hi猲 Vi猲 i hi謕. Th阨 gian di詎 ra ho箃 ng ch? c莕 c髇g b竔 b蕋 k? m? ph莕 c馻 m閠 v? i hi謕 b籲g c竎h <color=yellow>'v竔 l箉'<color> l? 頲.",
				"<color=green>"..get_transport_name()..":<color> B? i hi謕 kh輈h l?, s? khi課 cho kinh nghi謒 giang h? c馻 ngi t╪g kh玭g 輙. C遪 c? c? h閕 nh薾 頲 g蕄 10 l莕 kinh nghi謒 giang h?. N誹 trong th阨 gian di詎 ra ho箃 ng, m鏸 ng祔 u th祅h t﹎ c髇g b竔, c髇g b竔 <color=yellow>8<color> ng祔, s? nh薾 頲 kh輈h l? l韓.",
				"<color=green>"..get_transport_name()..":<color> N誹 m鏸 ng祔 trc khi c髇g t? c? th? d飊g m閠 v礽 o c? c髇g s? t╪g  th祅h ?, c? c? h閕 nh薾 頲 <color=yellow>10<color> l莕 kinh nghi謒 giang h?.");
end;