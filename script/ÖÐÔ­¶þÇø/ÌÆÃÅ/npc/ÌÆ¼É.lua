--文件说明
--与唐忌对话的脚本
--created by lizhi
--2005-8-12 15:11

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_成都\\task_main.lua");

function main()
    local nStep = GetTask(TASK_CD_TWO);
    if nStep == 101 then
        task_two_01();
        return
    elseif nStep == 102 then
        task_two_02();
        return
    elseif nStep == 103 then
        task_two_03();
        return
    end;

    i=random(1,3)
	if i == 1 then
		Say("T鑞 nhi襲 ti襫 n H醓 kh? ph遪g nh璶g c騨g kh玭g r蘮 頲 m鉵 H醓 kh? n祇 c?. T鎛g qu秐 s韒 nghe l阨 ta u t? s? ti襫  v祇 竚 kh? ph遪g c馻 ta th? kh玭g n n鏸 n祔.",0)
	elseif	i == 2 then
		Say("Giang h? c? th藀 i m玭 ph竔 nh璶g ph竔 n祇 l筰 kh玭g s? 竚 kh? Л阯g M玭 ta.",0)
	else
		Say("Thi猲 H秈 h鋍 nhi襲 hi觰 r閚g, hi誹 th秓 v韎 trng b鑙, tng lai s? tr? th祅h T鎛g qu秐 i k? ti誴.",0)
	end
end;