--脚本名称：附灵NPC对话
--脚本功能：附灵相关NPC功能
--功能策划人：王强
--功能开发人：村长
--功能开发时间：2008-01-15
--修改记录：
Include("\\script\\weaponeffect\\ling_add_main.lua")
Include("\\script\\weaponeffect\\yun_ling_add.lua")
Include("\\script\\lib\\globalfunctions.lua")
--主对话
function main()
	local tSel = {
--		"我要看下蕴灵外装/yunling_main",
--		"我想处理下武器特效相关事情/lin_main",
		"Ta mu鑞 n﹏g c蕄 ngo筰 trang U萵 Linh/upgrade_clothes",
		"Ta mu鑞 衟 Linh Ph竎h v祇 v? kh? 產ng s? d鬾g (c莕 70 v藅 ph萴 Xu + 200 v祅g)/soul_upgrade",
		"Ta ch? gh? qua th玦/end_dialog",
	}
	Say(Npc_name.."H玬 nay tr阨 tr? l?, c? y猽 kh? t筰 i m筩 t﹜ b綾, l? е t? C玭 L玭 ph秈 bi誸 tr秏 ma tr? y猽. B莕 o g莕 y nghi猲 c鴘 ra c竎h g緉 th猰 linh t輓h l猲 trang ph鬰, th猰 g鋓 Linh t輓h cho v? kh?  tr? n猲 m筺h m? h琻, i hi謕 c? h鴑g th? kh玭g?",
		getn(tSel), tSel)
end
--蕴灵和武器特效分流对话
function lin_main()
	if GetPlayerRoute() == 0 then
		Talk(1,"",Npc_name.."B莕 o ch? d箉 v? cho anh h飊g h祇 ki謙 <color=yellow> v祇 l璾 ph竔<color> c竎 m玭 ph竔 v? l﹎!")
		return
	end
	if Tb_route_point_info[GetPlayerRoute()] == nil then
		Talk(1,"",Npc_name.."B莕 o ch? d箉 v? cho anh h飊g h祇 ki謙 <color=yellow> v祇 l璾 ph竔<color> c竎 m玭 ph竔 v? l﹎!")
		return
	end
	local weapon_index = GetPlayerEquipIndex(2)
	SetTaskTemp(Weapon_index_save_TasktempID,weapon_index)
	Say(Npc_name.."C玭 L玭 c? lo筰 o thu藅, c? th? d鵤 v祇 t? c竎h c馻 thi猲 h? h祇 ki謙  k輈h ho箃 <color=yellow>Linh Ph竎h<color> c馻 v? kh?, l祄 v? kh? r鵦 r? 竛h s竛g, th猰 Linh t輓h cho <color=yellow>Linh Ph竎h<color> c? th? t╪g th猰 uy l鵦 cho v? kh?. V? i hi謕 n祔 mu鑞 b莕 o gi髉 g? y?",
		6,
		"Ta mu鑞 k輈h ho箃 Linh Ph竎h c馻 v? kh? trong tay/soul_add",
		"Ta mu鑞 th猰 Linh t輓h cho v? kh? trong tay/ability_add",
		"Xem t? li謚 li猲 quan Linh t輓h v? Linh Ph竎h/soul_info",
		"Ta mu鑞 th竜 Linh Ph竎h cho v? kh? trong tay (Linh Ph竎h Linh t輓h u m蕋)/soul_del",
		"Ta mu鑞 th竜 Linh t輓h cho v? kh? trong tay (ch? m蕋 Linh t輓h)/ability_del",
		"Ta ch? gh? qua th玦/end_dilaog"
	)
end
--=========================灵魄============================
--增加灵魄
function soul_add()
	local weapon_index = GetPlayerEquipIndex(2)
	--武器装备判断
	if  weapon_index == 0 then
		Talk(1,"",Npc_name.."H穣 trang b? v? kh? trc r錳 n t譵 ta!")
		return
	end
	local weapon_nume = "<color=yellow>"..GetItemName(weapon_index).."<color>"
	--武器耐久判断
	if AbradeItem(weapon_index,0) == 0 then
		Talk(1,"",Npc_name.."  "..weapon_nume.."Х h誸  b襫, kh玭g th? k輈h ho箃 <color=yellow>Linh Ph竎h<color>!")
		return
	end
	--判断是否已经附加了灵魄
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name  ~= "" then
		Talk(1,"",Npc_name.."  "..weapon_nume.."Х c? <color=yellow>"..aptitude_name.."<color> Linh Ph竎h, th竜 trc r錳 h穣 k輈h ho箃 <color=yellow>Linh Ph竎h<color>!")
		return
	end
	--初始进入数据清理
	SetTaskTemp(Aptitue_seq_save_1_TasktempID,0)
	SetTaskTemp(Aptitue_seq_save_10_TasktempID,0)
	SetTaskTemp(Break_sky_get_date_seq_TaskID,0)
	SetTaskTemp(Aptitue_cent_TasktempID,0)
	--进入资质选择对话
	aptitude_sel(0,0)
end
--资质选择对话
function aptitude_sel(aptitue_count,page_seq)
	--主对话内容生成
	local dia_main = Npc_name.."Ch? c? t? ch蕋 tng 鴑g m韎 c? th? k輈h ho箃 <color=yellow>Linh Ph竎h<color> tng 鴑g. Sau khi b莕 o k輈h ho箃 <color=yellow>Linh Ph竎h<color>, n誹 mu鑞 g鋓 h錸 ch? c莕 nh蕁 2 ch? <color=yellow>k輈h ho箃<color> tr猲 ch﹏ dung v? kh? l? 頲. Ngi c? t? ch蕋 n祇? Sau khi ch鋘 xong nh? b竜 cho b莕 o m閠 ti課g."
	if aptitue_count ~= 0 then
		dia_main = Npc_name.."Ta bi誸 r錳"..Zgc_pub_sex_name().." b莕 o  ghi nh?,  "..Zgc_pub_sex_name().."V蒼 c遪 t? ch蕋 kh竎 sao? (T鎛g linh l鵦 hi謓 t筰 l?: <color=red>"..GetTaskTemp(Aptitue_cent_TasktempID).."<color>)"
	end
	--选项生成
	local dia_sel = {}
	local page_start,page_end = 0,0
	if page_seq == 0 then
		page_start = 1
		page_end = 6
	else
		page_start = 7
		page_end = getn(Tb_aptitude_info)
	end
	if page_seq ~= 0 then
		tinsert(dia_sel,"Trang trc/#aptitude_sel("..aptitue_count..",0)")
	end
	for i = page_start,page_end do
		tinsert(dia_sel,Tb_aptitude_info[i][1].."/#aptitude_chk("..aptitue_count..","..i..")")
	end
	if page_seq == 0 then
		tinsert(dia_sel,"Trang k?/#aptitude_sel("..aptitue_count..",1)")
	end
	tinsert(dia_sel,"Ta ch鋘 r錳, t? ch蕋 c馻 ta c? nhi猽 y th玦/#aptitude_dtm(0)")
	tinsert(dia_sel,"в ta suy ngh? l筰/end_dilaog")
	--对话展开
	Say(dia_main,
		getn(dia_sel),
		dia_sel
	)
end
--资质资格检测
function aptitude_chk(aptitue_count,aptitue_seq)
	--是否已经选取过该资质
	local aptidue_sel_temp_taskid = Aptitue_seq_save_1_TasktempID
	local aptitue_save_seq = aptitue_seq
	if aptitue_seq >= 10 then
		aptidue_sel_temp_taskid = Aptitue_seq_save_10_TasktempID
		aptitue_save_seq = aptitue_seq + 1 - 10
	end
	local aptidue_saved = GetTaskTemp(aptidue_sel_temp_taskid)
	local aptidue_uped_chk = strfind(tostring(aptidue_saved),tostring(aptitue_save_seq))
	if aptidue_uped_chk ~= 0  and aptidue_uped_chk ~= nil then
		Talk(1,"#aptitude_sel("..aptitue_count..",0)",Npc_name.."飉匓莕 o bi誸 t? ch蕋 n祔 c馻 ngi, c? t? ch蕋 kh竎 sao?")
		return
	end
	--武器是否更换
	if weapon_cha_chk() ~= 1 then
		return 0
	end
	--条件检测
	if dostring(Tb_aptitude_info[aptitue_seq][2]) ~=1  then
		Talk(1,"#aptitude_sel("..aptitue_count..",0)",Npc_name.."Ha ha, ng c? l鮝 b莕 o, b莕 o kh玭g th蕐 ngi c? t? ch蕋 n祔. Ngi xem c遪 t? ch蕋 n祇 kh竎 c莕 b竜 cho b莕 o kh玭g?")
		return
	end
	--数据处理和回调
	SetTaskTemp(aptidue_sel_temp_taskid,((aptidue_saved * 10) + aptitue_save_seq))
	aptitue_count =  (aptitue_count + Tb_aptitude_info[aptitue_seq][5])
	SetTaskTemp(Aptitue_cent_TasktempID,aptitue_count)
	aptitude_sel(aptitue_count,0)
end
--资质确认函数
num_per_page = 8
function aptitude_dtm(page_seq)
	--是否选取了资质
	local aptitue_count = GetTaskTemp(Aptitue_cent_TasktempID)
	if aptitue_count == 0 or aptitue_count == nil then
		Talk(1,"#aptitude_sel(0,0)",Npc_name..Zgc_pub_sex_name().."V蒼 ch璦 ch鋘 t? ch蕋 n祇?")
		return
	end
	--资质分解
	local magic_dia_sel = {}
	local aptitude_seled = ""
	local aptitude_seq = 0
	for i = Aptitue_seq_save_1_TasktempID,Aptitue_seq_save_10_TasktempID do
		aptitude_seled = tostring(GetTaskTemp(i))
		if tonumber(aptitude_seled) ~= 0 then
			for j = 1,strlen(aptitude_seled) do
				if i == Aptitue_seq_save_1_TasktempID then
					aptitude_seq = tonumber(strsub(aptitude_seled,j,j))
				else
					aptitude_seq = tonumber(strsub(aptitude_seled,j,j)) + 9
				end
				tinsert(magic_dia_sel,Tb_aptitude_info[aptitude_seq][3].."(Th阨 h筺: "..Tb_aptitude_info[aptitude_seq][8].." ng祔)".."/#magic_add("..aptitude_seq..")")
			end
		end
	end
	tinsert(magic_dia_sel,"Ngi xem t? ch蕋 ta c? th? k輈h ho箃 Linh Ph竎h m筺h h琻 kh玭g?/break_sky_chk")
	--对话组织
	local dia_sel = {}
	local dia_sel_num = getn(magic_dia_sel)
	if page_seq ~= 0 then
		tinsert(dia_sel,"Trang trc/#aptitude_dtm("..(page_seq - 1)..")")
	end
	for i = (1+num_per_page * page_seq),min((num_per_page * (1 +page_seq)),dia_sel_num) do
		tinsert(dia_sel,magic_dia_sel[i])
	end
	--加入撼天
	if dia_sel_num == (num_per_page + 1) then
		tinsert(dia_sel,magic_dia_sel[dia_sel_num])
	elseif dia_sel_num > (num_per_page + 1 + (num_per_page * page_seq)) then
		tinsert(dia_sel,"Trang k?/#aptitude_dtm("..(page_seq + 1)..")")
	end
	tinsert(dia_sel,"в ta suy ngh? l筰/end_dialog")
	--对话展开
	Say(Npc_name.."Kh玭g th? k輈h ho箃 nhi襲 <color=yellow>Linh Ph竎h<color> v藋, ngi ch? c? th? k輈h ho箃 1 <color=yellow>Linh Ph竎h<color> cho 1 v? kh?. Ch? ?: khi  b襫 v? kh? l? <color=yellow>0<color> ho芻 <color=yellow>h誸 h筺<color>, Linh Ph竎h s? b? m蕋, ngi c莕 n ch? ta  k輈h ho箃 Linh Ph竎h l筰. Ngi mu鑞 k輈h ho箃 Linh Ph竎h n祇?",
	getn(dia_sel),
	dia_sel
	)
end
------------------------------普通特效--------------------
--确认对话
function magic_add(aptitude_seq)
	Say(Npc_name.."Linh Ph竎h ngi mu鑞 k輈h ho箃 l?: <color=yellow>"..Tb_aptitude_info[aptitude_seq][3].."<color>, c莕 t? ch蕋: "..Tb_aptitude_info[aptitude_seq][6].."; C莕 ti猽 hao: "..aptitude_cost_string_build(Tb_aptitude_info[aptitude_seq][4])..". Linh Ph竎h t錸 t筰: <color=yellow>"..Tb_aptitude_info[aptitude_seq][8].."<color> ng祔. Ngi c? th? nh蕁 ch? '<color=yellow>Linh'<color> tr猲 ch﹏ dung v? kh?  k輈h ho箃 Linh Ph竎h. Ch? ?: N誹 t? ch蕋 kh玭g  甶襲 ki謓 th? kh玭g th? k輈h ho箃, ch? khi  m韎 頲. Ngo礽 ra ph秈 y猽 thng Th莕 binh c馻 ngi, m閠 khi  b襫 l? 0, Linh Ph竎h s? bi課 m蕋, ph秈 n ch? ta k輈h ho箃 l筰. Mu鑞 k輈h ho箃 Linh Ph竎h n祔 kh玭g?",
		3,
		"уng ?, ta  nghe r? l阨 khuy課 kh輈h c馻 ngi/#magic_add_dtm("..aptitude_seq..")",
		"Ta kh玭g c? v藅 li謚 c騨g mu鑞 k輈h ho箃 H祇 M玭 Linh Ph竎h/use_money_consume",
		"Kh玭g,  ta suy ngh? /end_dialog"
	)
end
--2208-5-20:增加用钱唤醒豪门的处理
Tb_consume_money = {3000,4000}
function use_money_consume()
	--武器切换检测
	if weapon_cha_chk() ~= 1 then
		return
	end
	Say(Npc_name.."Kh玭g c? v藅 li謚 c騨g 頲, nh璶g chi ph? kh? cao. C莕 ti猽 hao <color=yellow>"..Tb_consume_money[Sever_diff].."<color> v祅g, ng ? k輈h ho箃 kh玭g?",
		2,
		"уng ?!/use_money_dtm",
		"Kh玭g, ta mu鑞 suy ngh?/end_dialog"
	)
end
--确认增加
function use_money_dtm()
	--武器切换检测
	if weapon_cha_chk() ~= 1 then
		return
	end
	local aptitude_seq = getn(Tb_aptitude_info)
	--消费积分判断
	if dostring(Tb_aptitude_info[aptitude_seq][2]) ~=1  then
		Talk(1,"end_dialog",Npc_name.."觤 t輈h l騳 ti猽 d飊g kh玭g , kh玭g th? th猰 hi謚 鴑g <color=yellow>H祇 m玭<color>!")
		return
	end	
	--金钱携带判断
	if GetCash() < (Tb_consume_money[Sever_diff] * 10000) then
		Talk(1,"",Npc_name.."Ti襫 v祅g kh玭g  <color=yellow>"..Tb_consume_money[Sever_diff].."<color> v祅g,  qu猲 trong rng ??")
		return
	end
	--金钱删除判断
	if Pay(Tb_consume_money[Sever_diff] * 10000) ~=  1 then
		Talk(1,"",Npc_name.."Ti襫 v祅g kh玭g  <color=yellow>"..Tb_consume_money[Sever_diff].."<color> v祅g,  qu猲 trong rng ??")
		return
	end
	--豪门特效增加
	SetTask(IB_cost_num,(GetTask(IB_cost_num) - Tb_aptitude_num[12][Sever_diff]))
	SetTask(Consume_get_sec_seq_TaskID,GetTime())
	if BindWeaponEffect(Tb_aptitude_info[aptitude_seq][7],(Tb_aptitude_info[aptitude_seq][8]*86400)) == 1 then
		--增加时间处理
		--SetTask(Break_sky_get_sec_seq_TaskID,GetTime())
		Talk(1,"",Npc_name.."Ch骳 m鮪g  th猰 hi謚 鴑g <color=yellow>"..Tb_aptitude_info[aptitude_seq][7].."<color> th祅h c玭g! ? <color=yellow>g鉩 tr竔 ch﹏ dung v? kh?<color>, nh蕁 n髏 k輈h ho箃 m祏  l? c? th? k輈h ho箃 <color=yellow>Linh Ph竎h<color>. Ph輒 t総 k輈h ho箃 <color=yellow>Linh Ph竎h<color> l?: <color=red>F<color>!")
		if Tb_aptitude_info[aptitude_seq][4] == 4 or Tb_aptitude_info[aptitude_seq][4] == 5 then
			AddGlobalNews("Tin giang h? m韎 nh蕋, "..GetName().."V韎 b秐 l躰h h琻 ngi,  k輈h ho箃 Linh Ph竎h: "..Tb_aptitude_info[aptitude_seq][7]..", kh玭g h? l? i hi謕 v╪ v? song to祅!")
		end
		return
	else
		WriteLog("Hi謚 鴑g v? kh?: Ngi ch琲["..GetName().."]g緉 th猰 "..Tb_aptitude_info[aptitude_seq][7].."hi謚 鴑g th蕋 b筰!")
	end
end
--增加操作
function magic_add_dtm(aptitude_seq)
	--武器切换检测
	if weapon_cha_chk() ~= 1 then
		return
	end
	--物品携带检测
	if aptitude_cost_deal(1,Tb_aptitude_info[aptitude_seq][4]) ~= 1 then
		return
	end
	--物品删除检测
	if aptitude_cost_deal(2,Tb_aptitude_info[aptitude_seq][4]) ~= 1 then
		return
	end
	--豪门处理
	if aptitude_seq == getn(Tb_aptitude_info) then
		SetTask(IB_cost_num,(GetTask(IB_cost_num) - Tb_aptitude_num[12][Sever_diff]))
		SetTask(Consume_get_sec_seq_TaskID,GetTime())
	end
	--特效增加
	if BindWeaponEffect(Tb_aptitude_info[aptitude_seq][7],(Tb_aptitude_info[aptitude_seq][8]*86400)) == 1 then
		--增加时间处理
		--SetTask(Break_sky_get_sec_seq_TaskID,GetTime())
		Talk(1,"",Npc_name.."Ch骳 m鮪g  th猰 hi謚 鴑g <color=yellow>"..Tb_aptitude_info[aptitude_seq][7].."<color> th祅h c玭g! ? <color=yellow>g鉩 tr竔 ch﹏ dung v? kh?<color>, nh蕁 n髏 k輈h ho箃 m祏  l? c? th? k輈h ho箃 <color=yellow>Linh Ph竎h<color>. Ph輒 t総 k輈h ho箃 <color=yellow>Linh Ph竎h<color> l?: <color=red>F<color>!")
		if Tb_aptitude_info[aptitude_seq][4] == 4 or Tb_aptitude_info[aptitude_seq][4] == 5 then
			AddGlobalNews("Tin giang h? m韎 nh蕋, "..GetName().."V韎 b秐 l躰h h琻 ngi,  k輈h ho箃 Linh Ph竎h: "..Tb_aptitude_info[aptitude_seq][7]..", kh玭g h? l? i hi謕 v╪ v? song to祅!")
		end
		return
	else
		WriteLog("Hi謚 鴑g v? kh?: Ngi ch琲["..GetName().."]g緉 th猰 "..Tb_aptitude_info[aptitude_seq][7].."hi謚 鴑g th蕋 b筰!")
	end
end
------------------------------撼天相关---------------------
--撼天检测
function break_sky_chk()
	--SetTaskTemp(Aptitue_cent_TasktempID,26)
	local aptitue_count = GetTaskTemp(Aptitue_cent_TasktempID)
	if aptitue_count >= 26 then
		Talk(1,"break_sky_dia",Npc_name.."T? ch蕋 c馻 ngi c? th? k輈h ho箃 Linh Ph竎h <color=red>H竚 Thi猲<color>! Linh Ph竎h n祔 ph竧 ra s衪, 竛h s竛g kh竎 thng. Hy v鋘g ngi c? th? ph竧 huy s鴆 m筺h c馻 n?!")
		return
	else
		Talk(1,"#aptitude_dtm(0)",Npc_name.."T? ch蕋 dng nh? kh玭g  y猽 c莡  k輈h ho箃 hi謚 鴑g H竚 Thi猲, Linh Ph竎h n祔 y猽 c莡 t? ch蕋 (tr筺g th竔 v? trang b? tr猲 ngi hi謓 t筰)  cung c蕄 t鎛g linh l鵦 c馻 Linh Ph竎h t ho芻 h琻 <color=red>26<color>. Xin h穣 luy謓 t藀 th猰!\nLinh l鵦 1: <color=yellow>Thi誸 C鑤, L筩 H?<color>\nLinh l鵦 2: <color=yellow>B竎h Chi課, Chc Nh藅, Tu蕁 D藅, Уo L?, Danh T?, L╪g Ti猽<color>\nLinh l鵦 3: <color=yellow>Ph莕 V﹏, Tinh Di<color>\nLinh l鵦 4: <color=yellow>C竔 Th?<color>\nLinh l鵦 6: <color=yellow>筺 Giao<color>\nLinh l鵦 7: <color=red>H祇 M玭<color>\nLinh l鵦 8: <color=red>Ph? Qu﹏<color>")
		return
	end
end
--撼天增加确认
function break_sky_dia()
	Say(Npc_name.."Linh Ph竎h ngi mu鑞 k輈h ho箃 l?: <color=red>H竚 Thi猲<color>; T? ch蕋 c莕 l?: <color=red>Ch璦 r?<color>; Ti猽 hao c莕: "..aptitude_cost_string_build(5)..". Th阨 gian Linh Ph竎h t錸 t筰: <color=yellow>30<color> ng祔. Ngi c? th? nh蕁 ch? 'Linh' tr猲 ch﹏ dung v? khh?  k輈h ho箃 Linh Ph竎h. Ch? ?: N誹 t? ch蕋 kh玭g  甶襲 ki謓 th? kh玭g th? k輈h ho箃, ch? khi  m韎 頲. Ngo礽 ra ph秈 y猽 thng Th莕 binh c馻 ngi, m閠 khi  b襫 l? 0, Linh Ph竎h s? bi課 m蕋, ph秈 n ch? ta k輈h ho箃 l筰. Mu鑞 k輈h ho箃 Linh Ph竎h n祔 kh玭g?",
		2,
		"уng ?, ta  nghe r? l阨 khuy課 kh輈h c馻 ngi/break_sky_dtm",
		"Kh玭g,  ta suy ngh? /end_dialog"
	)
end
--撼天处理
function break_sky_dtm()
	--武器切换检测
	if weapon_cha_chk() ~= 1 then
		return
	end
	--物品携带检测
	if aptitude_cost_deal(1,5) ~= 1 then
		return
	end
	--物品删除检测
	if aptitude_cost_deal(2,5) ~= 1 then
		return
	end
	--特效增加
	if BindWeaponEffect("H竚 Thi猲",(30*86400)) == 1 then
		--撼天增加时间处理
		SetTask(Break_sky_get_sec_seq_TaskID,GetTime())
		Talk(1,"",Npc_name.."Ch骳 m鮪g th猰 hi謚 鴑g <color=red>H竚 Thi猲<color> cho trang b? th祅h c玭g! ? <color=yellow>g鉩 ph秈 ch﹏ dung v? kh?<color>, nh蕁 n髏 g鋓 h錸 m祏  l? c? th? k輈h ho箃 <color=yellow>Linh Ph竎h<color>. Ph輒 t総 k輈h ho箃 <color=yellow>Linh Ph竎h<color> l?: <color=red>F<color>!")
		AddGlobalNews("Tin giang h? m韎 nh蕋, "..GetName().."V韎 b秐 l躰h h琻 ngi,  k輈h ho箃 Linh Ph竎h: H竚 Thi猲, kh玭g h? l? i hi謕 v╪ v? song to祅!")
		return
	else
		WriteLog("Hi謚 鴑g v? kh?: Ngi ch琲["..GetName().."] th猰 hi謚 鴑g 'H竚 Thi猲' th蕋 b筰!")
	end
end
--消耗对话生成
function aptitude_cost_string_build(aptitude_level)
	local string_rtn = "<color=yellow>Kh玭g ti猽 hao g?<color>"
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] ~= 0 then
		string_rtn ="<color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][1].."<color> v祅g; "
	end
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]  ~= 0 then
		string_rtn = string_rtn.."<color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][2].."<color> <color=yellow>"..Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][4].."<color>;"
	end
	return string_rtn
end
--消耗携带或删除检测
function aptitude_cost_deal(deal_flag,aptitude_level)
	--deal_flag：1为携带检测，2为删除检测
	local chk_flag = 1
	--金钱
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] ~= 0 then
		if deal_flag == 1 then 
			if GetCash() < (Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] * 10000) then
				chk_flag = 0
			end
		else 
			if Pay(Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] * 10000) ~= 1 then
				chk_flag = 0
			end
		end
		if chk_flag == 0 then
			Talk(1,"",Npc_name.."Tr猲 ngi kh玭g  <color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] .."<color> v祅g,  qu猲 trong rng ??")
			return 0
		end
	end
	--材料
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]  ~= 0 then
		if deal_flag == 1 then 
			if GetItemCount(Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][1],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][2],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][3]) <  Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]  then
				chk_flag = 0
			end
		else
			if DelItem(Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][1],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][2],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][3],Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]) ~= 1 then
				chk_flag = 0
			end
		end
		if chk_flag == 0 then
			Talk(1,"",Npc_name.."Ngi mang <color=yellow>"..Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][4].."<color> kh玭g  <color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][2] .."<color> c竔,  qu猲 trong rng ??")
			return 0
		end
	end
	return 1
end
--=========================附灵能============================
function ability_add()
	--判断是否已经附件灵能
	if GetWeaponEffectAttributes() ~= 0 then
		Talk(1,"",Npc_name.."V? kh? hi謓 t筰  k輈h ho箃 <color=yellow>Linh t輓h<color>, ch? khi <color=yellow>X鉧 b?<color> c竔 c? trc b莕 o m韎 k輈h ho箃 c竔 m韎!")
		return 0
	end
	--对话生成
	Say(Npc_name.."Ngi mu鑞 k輈h ho箃 <color=yellow>Linh t輓h<color> g?? Nh?: N誹 kh玭g th? k輈h ho箃 <color=yellow>Linh Ph竎h<color>, <color=yellow>Linh t輓h<color> c騨g kh玭g th? ph竧 huy t竎 d鬾g.",
	4,
		"Linh t輓h t╪g sinh l鵦 t鑙 產/#add_ability_dia(1)",
		"Linh t輓h t╪g thu閏 t輓h l璾 ph竔/#add_ability_dia(3)",
		"Linh t輓h t╪g to祅 thu閏 t輓h/#add_ability_dia(2)",
		"Ta mu鑞 suy ngh? l筰"
	)
end
--唤醒对话
function add_ability_dia(ability_diff)
	if weapon_cha_chk() ~= 1 then
		return 0
	end
	local aptitude_level = aptitude_level_rtn()
	if aptitude_level == 0 then
		return
	end
	if ability_diff == 1 then
		Say(Npc_name.."Linh t輓h mu鑞 k輈h ho箃 l?: "..ability_cost_string_rtn(ability_diff).."Ch? ?, n誹 Linh Ph竎h m蕋 甶, Linh t輓h c騨g m蕋 甶! Trc khi k輈h ho箃 Linh t輓h v? kh? hi謓 t筰, nh? t譵 hi觰 th玭g tin Linh Ph竎h, mu鑞 k輈h ho箃 kh玭g?",
		2,
		"Ta mu鑞 k輈h ho箃/#add_ability_dtm(1)",
		"в ta suy ngh? l筰/end_dialog"
		)
	elseif ability_diff == 2 then
		Say(Npc_name.."Linh t輓h mu鑞 k輈h ho箃 l?: "..ability_cost_string_rtn(ability_diff).."Ch? ?, n誹 Linh Ph竎h m蕋 甶, Linh t輓h c騨g m蕋 甶! Trc khi k輈h ho箃 Linh t輓h v? kh? hi謓 t筰, nh? t譵 hi觰 th玭g tin Linh Ph竎h, mu鑞 k輈h ho箃 kh玭g?",
		2,
		"Ta mu鑞 k輈h ho箃/#add_ability_dtm(7)",
		"в ta suy ngh? l筰/end_dialog"
		)
	else
		local player_route = GetPlayerRoute()
		Say(Npc_name.."Linh t輓h mu鑞 k輈h ho箃 l?: "..ability_cost_string_rtn(ability_diff).."Ch? ?, n誹 Linh Ph竎h m蕋 甶, Linh t輓h c騨g m蕋 甶! Trc khi k輈h ho箃 Linh t輓h v? kh? hi謓 t筰, nh? t譵 hi觰 th玭g tin Linh Ph竎h, xin ch鋘 甶觤 thu閏 t輓h l璾 ph竔 mu鑞 k輈h ho箃.",
		3,
		"Ta mu鑞 t╪g"..Tb_point_name[Tb_route_point_info[player_route][1]].." 甶觤/#add_ability_dtm("..Tb_route_point_info[player_route][1]..")",
		"Ta mu鑞 t╪g"..Tb_point_name[Tb_route_point_info[player_route][2]].." 甶觤/#add_ability_dtm("..Tb_route_point_info[player_route][2]..")",
		"в ta suy ngh? l筰/end_dialog"
		)
	end
end
--灵能增加确认
function add_ability_dtm(point_diff)
	--灵能区分
	local aptitude_diff = 3
	if point_diff == 1 then
		aptitude_diff = 1
	elseif point_diff == 7 then
		aptitude_diff = 2
	end
	--灵能等级活动区
	local aptitude_level = aptitude_level_rtn()
	if aptitude_level == 0 then
		return
	elseif aptitude_level > 5 then
		aptitude_level = aptitude_level - 4
	end
	--材料携带检测
	if ability_cost_deal(1,aptitude_diff) ~= 1 then
		return
	end
	--材料删除检测
	if ability_cost_deal(2,aptitude_diff) ~= 1 then
		return
	end
	--灵能增加
	if AddWeaponEffectAttribute(point_diff,aptitude_level) == 1 then
		Talk(1,"",Npc_name.."Ch骳 m鮪g k輈h ho箃 Linh t輓h th祅h c玭g!")
		return
	else
		WriteLog("Hi謚 鴑g v? kh?: Ngi ch琲["..GetName().."]g緉 th猰 "..aptitude_level.."C蕄 "..aptitude_diff.."T╪g Linh t輓h th蕋 b筰!")
	end
end
--灵魄等级回调
function aptitude_level_rtn()
	--是否携带了武器
	local weapon_index = GetPlayerEquipIndex(2)
	if weapon_index == nil then
		Talk(1,"",Npc_name.."Hi謓 kh玭g mang v? kh?, kh玭g th? th猰 <color=yellow>Linh t輓h<color>!")
		return 0
	end
	--武器是否已经附了灵魄
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name == nil or aptitude_name == "" then
		Talk(1,"",Npc_name.."V? kh? c莕 ph秈 th猰 <color=yellow>Linh Ph竎h<color> xong m韎 c? th? th猰 <color=yellow>Linh t輓h<color>, "..Zgc_pub_sex_name().."h穣 甧m v? kh? th猰 <color=yellow>Linh Ph竎h<color> r錳 quay l筰!")
		return 0
	end
	--撼天特殊处理
	if aptitude_name == "H竚 Thi猲" then
		return 5
	end
	--返回灵魄等级
	for i = 1,getn(Tb_aptitude_info) do
		if Tb_aptitude_info[i][7] == aptitude_name then
			return Tb_aptitude_info[i][4]
		end
	end
	Talk(1,"",Npc_name.."V? kh? c莕 ph秈 th猰 <color=yellow>Linh Ph竎h<color> xong m韎 c? th? th猰 <color=yellow>Linh t輓h<color>, "..Zgc_pub_sex_name().."h穣 甧m v? kh? th猰 <color=yellow>Linh Ph竎h<color> r錳 quay l筰!")
	return 0
end
--灵能需要材料字符串返回
function ability_cost_string_rtn(deal_diff)
	--deal_diff:1为增加生命，2为增加单属性，3为增加全属性
	local aptitude_level = aptitude_level_rtn()
	local attribute_level_real = aptitude_level
	if attribute_level_real > 5 then
		attribute_level_real =  attribute_level_real - 4
	end
	local cost_string_rtn ="<color=yellow>"..Tb_lin_ability_info[deal_diff][1]..(Tb_lin_ability_info[deal_diff][2] + (Tb_lin_ability_info[deal_diff][3] * (attribute_level_real - 1))).."<color> 甶觤, c莕 ti猽 hao: "
	cost_string_rtn = cost_string_rtn.."<color=yellow>"..Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff].."<color> v祅g; "
	local mertiral_seq = 3
	if deal_diff == 2 then
		mertiral_seq = 5
	elseif deal_diff == 3 then
		mertiral_seq = 4
	end
	if Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level] ~= 0 then
		cost_string_rtn = cost_string_rtn.."<color=yellow>"..Tb_add_mertiral[mertiral_seq][4]..Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level].."<color>;"
	end
	return cost_string_rtn
end
--材料检测
function ability_cost_deal(deal_flag,deal_diff)
	--deal_flag:1为携带检测，2为删除检测
	--deal_diff:1为增加生命，2为增加全属性，3为增加单属性
	if weapon_cha_chk() ~= 1 then
		return 0
	end
	local mertiral_seq = 3
	if deal_diff == 2 then
		mertiral_seq = 5
	elseif deal_diff == 3 then
		mertiral_seq = 4
	end
	--灵魄等级获取
	local aptitude_level = aptitude_level_rtn()
	--材料携带检测
	if deal_flag == 1 then
		if GetCash() < (Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff]*10000)  then
			Talk(1,"", Npc_name.."Ngi mang <color=yellow>ti襫 v祅g<color> kh玭g  <color=yellow>"..Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff].."<color> v祅g")
			return 0
		end
		if GetItemCount(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3]) < Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level] then
			Talk(1,"",Npc_name.."Ngi mang <color=yellow>"..Tb_add_mertiral[mertiral_seq][4].."<color> kh玭g  <color=yellow>"..Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level].."<color>.")
			return 0
		end
	else
		if Pay(Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff]*10000) ~= 1  then
			Talk(1,"", Npc_name.."Ngi mang <color=yellow>ti襫 v祅g<color> kh玭g  <color=yellow>"..Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff].."<color> v祅g")
			return 0
		end
		if DelItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level]) ~= 1 then
			Talk(1,"",Npc_name.."Ngi mang <color=yellow>"..Tb_add_mertiral[mertiral_seq][4].."<color> kh玭g  <color=yellow>"..Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level].."<color>.")
			return 0
		end
	end
	return 1
end
--=====================灵魄删除==================
function soul_del()
	--是否附了灵魄
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name == nil or aptitude_name == "" then
		Talk(1,"main",Npc_name.."ng a v韎 b莕 o, ta kh玭g th? th蕐 頲 Linh Ph竎h tr猲 v? kh? c馻 ngi.")
		return
	end
	--储物箱是否锁定
	if IsBoxLocking() == 1 then
		Talk(1,"main",Npc_name.."Rng ch鴄   kh鉧, m? kh鉧 trc r錳 m韎 n b莕 o thng lng x鉧 b? Linh Ph竎h!")
		return
	end
	--武器是否锁定
	if GetItemSpecialAttr(GetPlayerEquipIndex(2),"LOCK") == 1 then
		Talk(1,"main",Npc_name.."<color=yellow>V? kh?<color> c馻 b筺  b? kh鉧, m? kh鉧 trc r錳 m韎 n b莕 o thng lng x鉧 b? Linh Ph竎h!")
		return
	end
	Say(Npc_name.."Mu鑞 x醓 b? Linh Ph竎h <color=yellow>"..aptitude_name.."<color> kh玭g? N誹 x鉧 Linh t輓h c騨g m蕋 theo! Ngi c? th? suy ngh? k?!",
		2,
		"Ta suy ngh? r錳/soul_del_dtm",
		"Kh玭g, ta mu鑞 ngh? l筰/end_dialog"
	)
end
--再次确认
function soul_del_dtm()
	Say(Npc_name.."Зy l? chuy謓 l韓, ng tr竎h b莕 o n鉯 nhi襲. Ngi  h? quy誸 t﹎ ch璦?",
	2,
	"Ta th藅 mu鑞 x鉧 b?/soul_del_deal",
	"Kh玭g, ta i ? r錳/end_dialog"
	)
end
--删除操作
function soul_del_deal()
	--武器是否更换
	if weapon_cha_chk() ~= 1 then
		return
	end
	--是否附了灵魄
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name == nil or aptitude_name == "" then
		Talk(1,"main",Npc_name.."ng a v韎 b莕 o, ta kh玭g th? th蕐 頲 <color=yellow>Linh Ph竎h<color> tr猲 v? kh? c馻 ngi.")
		return
	end
	--储物箱是否锁定
	if IsBoxLocking() == 1 then
		Talk(1,"main",Npc_name.."Rng ch鴄   kh鉧, m? kh鉧 trc r錳 m韎 n b莕 o thng lng x鉧 b? <color=yellow>Linh Ph竎h<color>!")
		return
	end
	--武器是否锁定
	if GetItemSpecialAttr(GetPlayerEquipIndex(2),"LOCK") == 1 then
		Talk(1,"main",Npc_name.."<color=yellow>V? kh?<color> c馻 b筺  b? kh鉧, m? kh鉧 trc r錳 m韎 n b莕 o thng lng x鉧 b? Linh Ph竎h!")
		return
	end
	--删除处理
	UnbindWeaponEffect()
end
--==================灵能删除=====================
function ability_del()
	local ability_num,tb_ability_id = GetWeaponEffectAttributes()
	if ability_num == 0 then
		Talk(1,"",Npc_name.."ng a v韎 b莕 o, ta kh玭g th? th蕐 頲 <color=yellow>Linh t輓h<color> tr猲 v? kh? c馻 ngi.")
		return
	end
--储物箱是否锁定
	if IsBoxLocking() == 1 then
		Talk(1,"main",Npc_name.."Rng ch鴄   kh鉧, m? kh鉧 trc r錳 m韎 n b莕 o thng lng x鉧 b? <color=yellow>Linh t輓h<color>!")
		return
	end

	Say(Npc_name.."Mu鑞 x鉧 <color=yellow>Linh t輓h<color> tr猲 v? kh? hi謓 t筰 kh玭g?",
	2,
	"Ta mu鑞 x鉧/ability_del_dtm",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--删除确认
function ability_del_dtm()
	--武器是否更换
	if weapon_cha_chk() ~= 1 then
		return
	end
	local ability_num,tb_ability_id = GetWeaponEffectAttributes()
	for i = 1 ,getn(tb_ability_id)  do
		RemoveWeaponEffectAttribute(tb_ability_id[i].id)
		WriteLog("Linh t輓h k蘭 theo: Ngi ch琲["..GetName().."] x鉧 "..tb_ability_id[i].id.."Linh Ph竎h!")
	end
	Msg2Player("B筺  x鉧 th祅h c玭g Linh t輓h tr猲 v? kh? hi謓 t筰!")
end
--==================灵魄和灵能信息===============
function soul_info()
	local tb_dia = {
		"L祄 sao k輈h ho箃 Linh Ph竎h v? Linh t輓h/Say1_4_1",
		"Ъng c蕄, m祏 s綾, 甶襲 ki謓 k輈h ho箃 Linh Ph竎h/#Say1_4_2(1)",
		"V藅 li謚 c莕  k輈h ho箃 Linh Ph竎h/Say1_4_3",
		"Tr? s?, thu閏 t輓h, ng c蕄 Linh t輓h/Say1_4_4",
		"V藅 li謚 c莕  k輈h ho箃 Linh t輓h/Say1_4_5",
		"Ta mu鑞 tra 甶觤 t輈h l騳 ti猽 d飊g c馻 m譶h/Say_1_4_6",
		"Kh玭g t譵 hi觰/main"
	}
	Say(Npc_name.."Ngi mu鑞 t譵 hi觰 g??",
		getn(tb_dia),
		tb_dia
	)
end
--对话1-4-1
function Say1_4_1()
	Talk(1,"soul_info",Npc_name.."<color=yellow>Linh Ph竎h<color> l? 1 lo筰 h祇 quan c馻 v? kh?, ch? khi t? ch蕋 ch? nh﹏ t n 甶襲 ki謓 nh蕋 nh m韎 c? th? k輈h ho箃. N誹 sau khi k輈h ho箃 t? ch蕋 kh玭g p 鴑g  y猽 c莡 <color=yellow>Linh Ph竎h<color> n鱝, s? kh玭g th? k輈h ho箃, ch? c? t? c竎h c? th? p 鴑g y猽 c莡 c馻 <color=yellow>Linh Ph竎h<color> l莕 n鱝 m韎 c? th? k輈h ho箃. <color=yellow>Linh t輓h<color> v? <color=yellow>Linh Ph竎h<color> tng sinh, c蕄 <color=yellow>Linh t輓h<color> tng 鴑g c蕄 <color=yellow>Linh Ph竎h<color>. Ch? khi k輈h ho箃 <color=yellow>Linh Ph竎h<color> th? <color=yellow>Linh t輓h<color> m韎 c? t竎 d鬾g. <color=yellow>Linh Ph竎h<color> ch? c? th? duy tr? <color=red>30<color> ng祔, <color=yellow>Linh Ph竎h<color> m蕋 甶, <color=yellow>Linh t輓h<color> c騨g s? m蕋 甶. L骳  t譵 b莕 o k輈h ho箃 l筰. Ngo礽 ra, khi  b襫 v? kh? l? <color=red>0<color>, Linh Ph竎h c騨g m蕋 甶.")
end
function Say1_4_2(att_seq)
	local attitude_string = Npc_name.."襲 ki猲 tng 鴑g Linh Ph竎h v? kh? kh竎 nhau nh? sau:"
	local for_num_min = ((att_seq -1) * 5 +1)
	local for_num_max = min((for_num_min + 4),getn(Tb_aptitude_info))
	for i = for_num_min ,for_num_max do
		attitude_string =attitude_string.. "\n<color=yellow>"..Tb_aptitude_info[i][3].."<color>: Linh l鵦 "..Tb_aptitude_info[i][5].." 甶觤, 甶襲 ki謓 "..Tb_aptitude_info[i][6]..", th阨 h筺 "..Tb_aptitude_info[i][8].." ng祔."
	end
	if for_num_max == getn(Tb_aptitude_info) then
		attitude_string = attitude_string.."\n<color=red>H竚 Thi猲, ch飉 s竛g s蕀 s衪 t輒 lam (Linh Ph竎h c蕄 5)<color>: Y猽 c莡 tr? cung c蕄 cho Linh Ph竎h t n ho芻 vt qua <color=red>26<color>, th阨 h筺 30 ng祔!"
		Talk(1,"soul_info",attitude_string)
	else
		Talk(1,"#Say1_4_2("..(att_seq+1)..")",attitude_string)
	end
end
function Say1_4_3()
	local mertiral_needs_string = ""
	for i = 1,5 do
		mertiral_needs_string = mertiral_needs_string.."\n<color=yellow>"..i.."<color> c蕄: "
		mertiral_needs_string = mertiral_needs_string ..Tb_aptitude_cost_info[Sever_diff][i][1].." Kim     "
		if Tb_aptitude_cost_info[Sever_diff][i][2] ~= 0 then
			mertiral_needs_string = mertiral_needs_string .."<color=yellow>"..Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][i][3]][4].."<color><color=red>"..Tb_aptitude_cost_info[Sever_diff][i][2].."<color> c竔"
		end
	end
	Talk(1,"soul_info",Npc_name.."V藅 li謚  k輈h ho箃 Linh Ph竎h nghe n鉯 u r琲 v祇 tay v礽 cao th? T﹜ V鵦, v藅 qu? nh蕋 l? <color=red>Th蕋 Huy詎 L璾 V╪<color> r琲 v祇 tay <color=green>L? Nguy猲 Kh竛h<color>, khi t譵 ki誱 th? c莕 c萵 th薾! S? lng nh? sau "..mertiral_needs_string)
end
function Say1_4_4()
	Talk(1,"soul_info",Npc_name.."Sau khi th猰 <color=yellow>Linh t輓h<color> v祇 v? kh?, thu閏 t輓h tng 鴑g t╪g nh? sau\nT╪g <color=yellow>sinh l鵦<color>: 500/1000/1500/2000/2500 甶觤\nT╪g <color=yellow>thu閏 t輓h n<color>: 6/12/18/24/30 甶觤\nT╪g <color=yellow>to祅 thu閏 t輓h<color>: 3/6/9/12/15 甶觤")
end
function Say1_4_5()
	local talk_string =" \n<color=yellow>ч Nguy謙 Th莕 Sa<color>: 秈 T﹜ B綾, t╪g <color=yellow>sinh l鵦 t鑙 產<color>, ti猽 hao theo ng c蕄 "..Tb_ability_magic_goods_cost_num[Sever_diff][3][1].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][2].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][3].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][4].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][5]
	talk_string =talk_string.." \n<color=yellow>Ph莕 Quang Th莕 Sa<color>: i ? m藅 th蕋 s? m玭, t╪g <color=yellow>thu閏 t輓h l璾 ph竔<color>, ti猽 hao theo ng c蕄 "..Tb_ability_magic_goods_cost_num[Sever_diff][4][1].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][2].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][3].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][4].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][5]
	talk_string =talk_string.." \n<color=yellow>Tr秏 Tinh Th莕 Sa<color>: i 甶觤 t輈hl騳 chi課 trng, t╪g <color=yellow>to祅 thu閏 t輓h<color>, ti猽 hao theo ng c蕄 "..Tb_ability_magic_goods_cost_num[Sever_diff][5][1].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][2].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][3].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][4].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][5]
	Talk(1,"soul_info",Npc_name.."V藅 li謚 c bi謙 c莕 l?: "..talk_string)
end
--消费积分查询
function Say_1_4_6()
	local consume_cent = GetTask(IB_cost_num)
	if consume_cent == nil then
		consume_cent = 0 
	end
	Talk(1,"",Npc_name.."觤 t輈h l騳 ti猽 d飊g hi謓 t筰 l? <color=yellow>"..consume_cent.."<color>! Ch? c莕 mua t筰 Ng? C竎 l? 頲 t苙g!"..Tb_aptitude_info[getn(Tb_aptitude_info)][6] .."C? th? d飊g <color=yellow>"..Tb_aptitude_info[getn(Tb_aptitude_info)][8] .."<color> ng祔! <color=red>Ch? ?: ? Ng? C竎 d飊g  "..Tb_ib_money[Sever_diff].." c? th? nh薾 頲 1 甶觤 t輈h l騳.<color>")
end

tUpgradableClothes =
{
				{0,108,510},
				{0,109,510},
				{0,110,510},
				{0,108,511},
				{0,109,511},
				{0,110,511},
				{0,108,513},
				{0,109,513},
				{0,110,513},
				{0,108,512},
				{0,109,512},
				{0,110,512},	
				{0,108,207},
				{0,108,208},
				{0,108,209},
				{0,108,210},
				{0,108,211},
				{0,108,212},
				{0,108,213},
				{0,108,214},
				{0,108,215},
				{0,108,216},
				{0,108,217},
				{0,108,218},	
				{0,109,281},
				{0,109,282},
				{0,109,283},
				{0,109,284},
				{0,109,285},
				{0,109,286},
				{0,109,287},
				{0,109,288},
				{0,109,289},
				{0,109,290},
				{0,109,291},
				{0,109,292},
				{0,110,281},
				{0,110,282},
				{0,110,283},
				{0,110,284},
				{0,110,285},
				{0,110,286},
				{0,110,287},
				{0,110,288},
				{0,110,289},
				{0,110,290},
				{0,110,291},
				{0,110,292},	
				{0,108,199},
				{0,108,200},
				{0,108,201},
				{0,108,202},
				{0,109,277},
				{0,109,278},
				{0,109,279},
				{0,109,280},
				{0,110,89},
				{0,110,90},
				{0,110,91},
				{0,110,92},	
				{0,108,195},
				{0,108,196},
				{0,108,197},
				{0,108,198},
				{0,109,255},
				{0,109,256},
				{0,109,257},
				{0,109,258},
				{0,110,85},
				{0,110,86},
				{0,110,87},
				{0,110,88},
				{0,108,139},
				{0,109,185},
				{0,110,81},
				{0,108,140},
				{0,109,186},
				{0,110,82},
				{0,108,141},
				{0,109,187},
				{0,110,83},
				{0,108,142},
				{0,109,188},
				{0,110,84},
				{0,108,30001},
				{0,108,30002},
				{0,108,30003},
				{0,108,30004},
				{0,108,30005},
				{0,108,30006},
				{0,108,30007},
				{0,108,30008},
				{0,108,30009},
				{0,108,30010},
				{0,108,30011},
				{0,108,30012},
				{0,109,30001},
				{0,109,30002},
				{0,109,30003},
				{0,109,30004},
				{0,109,30005},
				{0,109,30006},
				{0,109,30007},
				{0,109,30008},
				{0,109,30009},
				{0,109,30010},
				{0,109,30011},
				{0,109,30012},
				{0,110,30001},
				{0,110,30002},
				{0,110,30003},
				{0,110,30004},
				{0,110,30005},
				{0,110,30006},
				{0,110,30007},
				{0,110,30008},
				{0,110,30009},
				{0,110,30010},
				{0,110,30011},
				{0,110,30012},
				{0, 108, 109},
				{0, 108, 110},
				{0, 108, 111},
				{0, 108, 112},
				{0, 109, 109},
				{0, 109, 110},
				{0, 109, 111},
				{0, 109, 112},
				{0, 110, 73},
				{0, 110, 74},
				{0, 110, 75},
				{0, 110, 76},
				{0, 108, 1},
				{0, 108, 2},
				{0, 108, 3},
				{0, 108, 4},
				{0, 108, 5},
				{0, 108, 6},
				{0, 108, 7},
				{0, 108, 8},
				{0, 108, 9},
				{0, 108, 10},
				{0, 108, 11},
				{0, 108, 12},
				{0, 108, 13},
				{0, 108, 14},
				{0, 108, 15},
				{0, 108, 16},
				{0, 108, 17},
				{0, 108, 18},
				{0, 108, 518},
				{0, 108, 522},
				{0, 108, 526},
				{0, 108, 19},
				{0, 108, 20},
				{0, 108, 21},
				{0, 108, 22},
				{0, 108, 23},
				{0, 108, 24},
				{0, 108, 25},
				{0, 108, 26},
				{0, 108, 27},
				{0, 108, 28},
				{0, 108, 29},
				{0, 108, 30},
				{0, 108, 31},
				{0, 108, 32},
				{0, 108, 33},
				{0, 108, 34},
				{0, 108, 35},
				{0, 108, 36},
				{0, 108, 519},
				{0, 108, 523},
				{0, 108, 527},
				{0, 108, 37},
				{0, 108, 38},
				{0, 108, 39},
				{0, 108, 40},
				{0, 108, 41},
				{0, 108, 42},
				{0, 108, 43},
				{0, 108, 44},
				{0, 108, 45},
				{0, 108, 46},
				{0, 108, 47},
				{0, 108, 48},
				{0, 108, 49},
				{0, 108, 50},
				{0, 108, 51},
				{0, 108, 52},
				{0, 108, 53},
				{0, 108, 54},
				{0, 108, 520},
				{0, 108, 524},
				{0, 108, 528},
				{0, 108, 55},
				{0, 108, 56},
				{0, 108, 57},
				{0, 108, 58},
				{0, 108, 59},
				{0, 108, 60},
				{0, 108, 61},
				{0, 108, 62},
				{0, 108, 63},
				{0, 108, 64},
				{0, 108, 65},
				{0, 108, 66},
				{0, 108, 67},
				{0, 108, 68},
				{0, 108, 69},
				{0, 108, 70},
				{0, 108, 71},
				{0, 108, 72},
				{0, 108, 521},
				{0, 108, 525},
				{0, 108, 529},
				{0, 109, 1},
				{0, 109, 2},
				{0, 109, 3},
				{0, 109, 4},
				{0, 109, 5},
				{0, 109, 6},
				{0, 109, 7},
				{0, 109, 8},
				{0, 109, 9},
				{0, 109, 10},
				{0, 109, 11},
				{0, 109, 12},
				{0, 109, 13},
				{0, 109, 14},
				{0, 109, 15},
				{0, 109, 16},
				{0, 109, 17},
				{0, 109, 18},
				{0, 109, 518},
				{0, 109, 522},
				{0, 109, 526},
				{0, 109, 19},
				{0, 109, 20},
				{0, 109, 21},
				{0, 109, 22},
				{0, 109, 23},
				{0, 109, 24},
				{0, 109, 25},
				{0, 109, 26},
				{0, 109, 27},
				{0, 109, 28},
				{0, 109, 29},
				{0, 109, 30},
				{0, 109, 31},
				{0, 109, 32},
				{0, 109, 33},
				{0, 109, 34},
				{0, 109, 35},
				{0, 109, 36},
				{0, 109, 519},
				{0, 109, 523},
				{0, 109, 527},
				{0, 109, 37},
				{0, 109, 38},
				{0, 109, 39},
				{0, 109, 40},
				{0, 109, 41},
				{0, 109, 42},
				{0, 109, 43},
				{0, 109, 44},
				{0, 109, 45},
				{0, 109, 46},
				{0, 109, 47},
				{0, 109, 48},
				{0, 109, 49},
				{0, 109, 50},
				{0, 109, 51},
				{0, 109, 52},
				{0, 109, 53},
				{0, 109, 54},
				{0, 109, 520},
				{0, 109, 524},
				{0, 109, 528},
				{0, 109, 55},
				{0, 109, 56},
				{0, 109, 57},
				{0, 109, 58},
				{0, 109, 59},
				{0, 109, 60},
				{0, 109, 61},
				{0, 109, 62},
				{0, 109, 63},
				{0, 109, 64},
				{0, 109, 65},
				{0, 109, 66},
				{0, 109, 67},
				{0, 109, 68},
				{0, 109, 69},
				{0, 109, 70},
				{0, 109, 71},
				{0, 109, 72},
				{0, 109, 521},
				{0, 109, 525},
				{0, 109, 529},
				{0, 110, 1},
				{0, 110, 2},
				{0, 110, 3},
				{0, 110, 4},
				{0, 110, 5},
				{0, 110, 6},
				{0, 110, 7},
				{0, 110, 8},
				{0, 110, 9},
				{0, 110, 10},
				{0, 110, 11},
				{0, 110, 12},
				{0, 110, 13},
				{0, 110, 14},
				{0, 110, 15},
				{0, 110, 16},
				{0, 110, 17},
				{0, 110, 18},
				{0, 110, 518},
				{0, 110, 522},
				{0, 110, 526},
				{0, 110, 19},
				{0, 110, 20},
				{0, 110, 21},
				{0, 110, 22},
				{0, 110, 23},
				{0, 110, 24},
				{0, 110, 25},
				{0, 110, 26},
				{0, 110, 27},
				{0, 110, 28},
				{0, 110, 29},
				{0, 110, 30},
				{0, 110, 31},
				{0, 110, 32},
				{0, 110, 33},
				{0, 110, 34},
				{0, 110, 35},
				{0, 110, 36},
				{0, 110, 519},
				{0, 110, 523},
				{0, 110, 527},
				{0, 110, 37},
				{0, 110, 38},
				{0, 110, 39},
				{0, 110, 40},
				{0, 110, 41},
				{0, 110, 42},
				{0, 110, 43},
				{0, 110, 44},
				{0, 110, 45},
				{0, 110, 46},
				{0, 110, 47},
				{0, 110, 48},
				{0, 110, 49},
				{0, 110, 50},
				{0, 110, 51},
				{0, 110, 52},
				{0, 110, 53},
				{0, 110, 54},
				{0, 110, 520},
				{0, 110, 524},
				{0, 110, 528},
				{0, 110, 55},
				{0, 110, 56},
				{0, 110, 57},
				{0, 110, 58},
				{0, 110, 59},
				{0, 110, 60},
				{0, 110, 61},
				{0, 110, 62},
				{0, 110, 63},
				{0, 110, 64},
				{0, 110, 65},
				{0, 110, 66},
				{0, 110, 67},
				{0, 110, 68},
				{0, 110, 69},
				{0, 110, 70},
				{0, 110, 71},
				{0, 110, 72},
				{0, 110, 521},
				{0, 110, 525},
				{0, 110, 529},				
}

tUpgradeClothCost =
{
	[1] = {3, 100, 1000000},
	[2] = {3, 150, 1000000},
	[3] = {3, 200, 1000000},
}

function upgrade_clothes()
	local tSay = {}
	tinsert(tSay, "Ta mu鑞 n﹏g c蕄 M穙 Ngo筰 Trang/#upgrade_choose_1(6)")
	tinsert(tSay, "Ta mu鑞 n﹏g c蕄 Thng Y Ngo筰 Trang/#upgrade_choose_1(7)")
	tinsert(tSay, "Ta mu鑞 n﹏g c蕄 H? Y Ngo筰 Trang/#upgrade_choose_1(8)")
	tinsert(tSay, "в ta suy ngh? l筰/end_dialog")
	
	Say(Npc_name.."C竎 h? h穣 ch鋘 lo筰 ngo筰 trang mu鑞 n﹏g c蕄:", getn(tSay), tSay)
end

function upgrade_choose_1(nCloth)
	local tSay = {}
	tinsert(tSay, format("Ta mu鑞 n﹏g c蕄 S鴆 M筺h/#upgrade_choose_2(%d, 246)",nCloth))
	tinsert(tSay, format("Ta mu鑞 n﹏g c蕄 N閕 C玭g/#upgrade_choose_2(%d, 249)",nCloth))
	tinsert(tSay, format("Ta mu鑞 n﹏g c蕄 G﹏ C鑤/#upgrade_choose_2(%d, 245)",nCloth))
	tinsert(tSay, format("Ta mu鑞 n﹏g c蕄 Th﹏ Ph竝/#upgrade_choose_2(%d, 247)",nCloth))
	tinsert(tSay, format("Ta mu鑞 n﹏g c蕄 Linh Ho箃/#upgrade_choose_2(%d, 248)",nCloth))
	tinsert(tSay, "в ta suy ngh? l筰/end_dialog")
	
	Say(Npc_name.."C竎 h? mu鑞 n﹏g c蕄 thu閏 t輓h n祇:", getn(tSay), tSay)
end

function upgrade_choose_2(nCloth, nType1)
	local tSay = {}
	tinsert(tSay, format("C蕄 1 - 5 甶觤 (C莕 3 ч Nguy謙 Th莕 Sa, 100 甶觤 s? m玭, 100 v祅g)/#confirm_upgrade_cloth(%d, %d, 1)",nCloth,nType1))
	tinsert(tSay, format("C蕄 2 - 10 甶觤 (C莕 3 ч Nguy謙 Th莕 Sa, 150 甶觤 s? m玭, 100 v祅g)/#confirm_upgrade_cloth(%d, %d, 2)",nCloth,nType1))
	tinsert(tSay, format("C蕄 3 - 15 甶觤 (C莕 3 ч Nguy謙 Th莕 Sa, 200 甶觤 s? m玭, 100 v祅g)/#confirm_upgrade_cloth(%d, %d, 3)",nCloth,nType1))
--	tinsert(tSay, format("C蕄 4 - 20 甶觤 (C莕 3 ч Nguy謙 Th莕 Sa, 250 甶觤 s? m玭, 1 T? Kim H錸g Bao)/#confirm_upgrade_cloth(nCloth, nType1, 4)",nCloth,nType1))
	tinsert(tSay, "в ta suy ngh? l筰/end_dialog")
	
	Say(Npc_name.."H穣 ch鋘 lo筰 n﹏g c蕄::", getn(tSay), tSay)
end

function confirm_upgrade_cloth(nCloth, nType1, nType2)
	local nG, nD, nP  = GetPlayerEquipInfo(nCloth)
	local cloth_index = GetPlayerEquipIndex(nCloth)

	if  cloth_index == 0 then
		Talk(1,"",Npc_name.."H穣 trang b? ngo筰 trang trc r錳 n t譵 ta!")
		return
	end
	
	local nCheck = 0
	for i = 1, getn(tUpgradableClothes) do
		if nG  == tUpgradableClothes[i][1] and nD == tUpgradableClothes[i][2] and nP == tUpgradableClothes[i][3] then
			nCheck = 1
			break
		end
	end
	if nCheck == 0 then
		Talk(1,"",Npc_name.."Ngo筰 trang n﹏g c蕄 kh玭g ph? h頿!")
		return
	end
	
	local cloth_name = GetItemName(cloth_index)
	if AbradeItem(cloth_index, 0) == 0 then
		Talk(1,"", Npc_name.."  "..cloth_name.."  h誸  b襫, kh玭g th? n﹏g c蕄!")
		return
	end

	if GetPlayerRoute() == 0 then
		Talk(1,"", Npc_name.."Ch璦 gia nh藀 h? ph竔 kh玭g th? n﹏g c蕄 ngo筰 trang!")
		return
	end

	if GetTask(336) < 10000 then
		Talk(1,"",Npc_name.."Kh玭g  甶觤 s? m玭  n﹏g c蕄!")
		return
	end
	
	if GetLevel() < 79 then
		Talk(1,"",Npc_name.."C蕄 79 tr? l猲 m韎 c? th? n﹏g c蕄 ngo筰 trang!")
		return
	end
	
	if GetCash()  < tUpgradeClothCost[nType2][3] then
		Talk(1,"",Npc_name.."Kh玭g  ng﹏ lng  n﹏g c蕄!")
		return
	end
	
	if GetItemCount(2, 1, 3332) <  tUpgradeClothCost[nType2][1] then
		Talk(1,"", "Kh玭g  ч Nguy謙 Th莕 Sa  n﹏g c蕄")
		return
	end
	
	local nCustomExpire = 30 * 24 * 3600
	local nExpire = GetItemExpireTime(cloth_index)
	if nExpire <= 0 or nExpire == nil then
		nExpire = nCustomExpire
	end
	UnEquipAtPosition(nCloth)
	if DelItemByIndex(cloth_index, -1) == 1 and DelItem(2, 1, 3332,  tUpgradeClothCost[nType2][1]) == 1 then
		Pay(tUpgradeClothCost[nType2][3])
		SetTask(336, GetTask(336) - tUpgradeClothCost[nType2][2])
		gf_AddItemEx2({nG, nD, nP, 1, 1, nType2, nType1}, cloth_name, "Nang cap ngoai trang Uan Linh", "n﹏g c蕄 頲", nExpire)
	else
		Talk(1,"", Npc_name.."N﹏g c蕄 th蕋 b筰!")
		return
	end	
end

function soul_upgrade()
	local tSay = {}
	
	tinsert(tSay, "Ta mu鑞 k輈h ho箃 Danh T骳/#confirm_soul_upgrade(1)")
	tinsert(tSay, "Ta mu鑞 k輈h ho箃 Уo L?/#confirm_soul_upgrade(2)")
	tinsert(tSay, "Ta mu鑞 k輈h ho箃 Tu蕁 D藅/#confirm_soul_upgrade(3)")
	tinsert(tSay, "Ta mu鑞 k輈h ho箃 Chc Nh藅/#confirm_soul_upgrade(4)")
	tinsert(tSay, "Ta mu鑞 k輈h ho箃 B竎h Chi課/#confirm_soul_upgrade(5)")
	tinsert(tSay, "в ta suy ngh? l筰/end_dialog")
	
	Say(Npc_name.."Kh玭g th? k輈h ho箃 nhi襲 <color=yellow>Linh Ph竎h<color>, ngi ch? c? th? k輈h ho箃 1 <color=yellow>Linh Ph竎h<color> cho 1 v? kh?. Ch? ?: khi  b襫 v? kh? l? <color=yellow>0<color> ho芻 <color=yellow>h誸 h筺 sau 7 ng祔<color>, Linh Ph竎h s? b? m蕋, ngi c莕 n ch? ta  k輈h ho箃 Linh Ph竎h l筰. Ngi mu鑞 k輈h ho箃 Linh Ph竎h n祇?", getn(tSay), tSay)
end

function confirm_soul_upgrade(nType)
	if GetPlayerRoute() == 0 or GetLevel() < 73 or gf_Check55MaxSkill() == 0 then
		Talk(1,"", Npc_name.."Чi hi謕 c莕 ph秈 gia nh藀 m玭 ph竔, ng c蕄 73 tr? l猲 v?  th玭g th筼 v? c玭g c蕄 55 m韎 c? th? 衟 Linh Ph竎h cho v? kh?!")
		return
	end
	if GetItemCount(2,1,30230) < 70 or GetCash() < 2000000 then
		Talk(1,"", Npc_name.."Чi hi謕 c莕 ph秈 mang  70 v藅 ph萴 Xu v? 200 v祅g n m韎 c? th? 衟 Linh Ph竎h cho v? kh?!")
		return
	end
	local weapon_index = GetPlayerEquipIndex(2)
	if  weapon_index == 0 then
		Talk(1,"",Npc_name.."H穣 trang b? v? kh? trc r錳 n t譵 ta!")
		return
	end
	local weapon_name = "<color=yellow>"..GetItemName(weapon_index).."<color>"
	if AbradeItem(weapon_index, 0) == 0 then
		Talk(1,"",Npc_name.."  "..weapon_name.."  h誸  b襫, kh玭g th? k輈h ho箃 <color=yellow>Linh Ph竎h<color>!")
		return
	end
	
	local tSoulType =
	{
		[1] = "Danh T骳",
		[2] = "Уo L?",
		[3] = "Tu蕁 D藅",
		[4] = "Chc Nh藅",
		[5] = "B竎h Chi課",
	}
	
	if DelItem(2,1,30230, 70) == 1 and Pay(2000000) == 1 then
		BindWeaponEffect(tSoulType[nType], 7 * 24 * 3600)
		Talk(1,"", Npc_name.."Ch骳 m鮪g i hi謕  衟 Linh Ph竎h th祅h c玭g cho "..weapon_name.."!")
	end
end