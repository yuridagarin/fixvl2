--脚本名称：第五关的五行提示脚本
--脚本功能：在闯关时给进入TRAP点的玩家给予对应对应的五行提示信息
--功能策划：阿为
--功能开发：村长
--开发时间：2008-11-07
--修改记录：
Tb_5_element_coordinate = {
	{5,4," Kim "},
	{1,5,"Th駓"},
	{2,1,"M閏"},	
	{3,2,"H醓"},	
	{4,3,"Th?"},	
}
--关卡进度存放
MS_TIMMER_LOOP_ID = 5
--初始位置存放
Ms_element_gold_seq = 17
--不同的阵眼顺序不同
trap_seq = 5
function main()
	--废闯关时间直接返回
	local mission_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	if mission_loop_num >= 186 or mission_loop_num <= 6 or mission_loop_num == nil then
		return
	end
	--位置生成
	local golden_element_seq = mod(5 + trap_seq - (GetMissionV(Ms_element_gold_seq)),5)
	if golden_element_seq == 0 then
		golden_element_seq = 5
	end
	--提示
	Msg2Player("B筺  v祇 "..Tb_5_element_coordinate[golden_element_seq][3].." t﹎ tr薾, c? th? ch鑞g "..Tb_5_element_coordinate[Tb_5_element_coordinate[golden_element_seq][1]][3].."Khi課 Ng? h祅h lu﹏ h錳-sinh v? "..Tb_5_element_coordinate[Tb_5_element_coordinate[golden_element_seq][2]][3].."Khi課 Ng? h祅h lu﹏ h錳-hi謚 qu? kh綾!")
end
