--�ű����ƣ�ʦ�ž�Ҫ��ʹ�ýű�
--�ű����ܣ����ʹ�ýű�������������������һ�����ɵ�����������Ҫ
--�����д�ˣ��峤
--�����дʱ�䣺2007-01-28
--�޸ļ�¼��С���򲹶�
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--=================================��������������============================
jue_list = {
		{{"Thi�u L�m �ao quy�t",2,6,1},
		{"Thi�u L�m C�n quy�t",2,6,2},
		{"Tr�m Ma �ao quy�t",2,6,3},
		{"Phong C�n quy�t",2,6,4},
		{"Kim Chung Tr�o quy�t",2,6,5},
		{"Nhi�n M�c �ao quy�t",2,6,6},
		{"V� Th��ng C�n quy�t",2,6,7},
		{"X� Th�n Quy�t",2,6,8},
		{"��i Nh� Lai quy�t",2,6,9},
		{"��t Ma V� quy�t",2,6,10},
		{"Th�t B�o Chi�u quy�t",2,6,11},
		{"La H�n Quy�n quy�t",2,6,12},
		{"Ca Di�p Th�i quy�t",2,6,13},
		{"Hu� Nh�n quy�t",2,6,14},
		{"Vi �� quy�t",2,6,15},
		{"V�n V�n quy�t",2,6,16},
		{"La H�n Tr�n quy�t",2,6,17},
		{"��i Tu Di Ch��ng",2,6,18},
		{"V� �nh quy�t",2,6,19},
		{"Long Tr�o Th� quy�t",2,6,20},
		{"Ph�c H� quy�t",2,6,21},
		{"Tu T�m quy�t",2,6,22},
		{"Ng� Chuy�n Ch� quy�t",2,6,23},
		{"Ph� Ma Ch� quy�t",2,6,24},
		{"Kim Cang y�u quy�t",2,6,25},
		{"La L�i quy�t",2,6,26},
		{"Ph�c Ma Th�n quy�t",2,6,27},
		{"V� T��ng quy�t",2,6,28},
		{"S� T� H�ng",2,6,29},
		{"Minh Ch� quy�t",2,6,30},
		{"Kim Cang Ch� quy�t",2,6,31}},
		{{"Ch� �m y�u quy�t",2,6,32},
		{"T�m Nh�n quy�t",2,6,33},
		{"��c Th�ch C�t quy�t",2,6,34},
		{"Gi�i ��c B� quy�t",2,6,35},
		{"C�u H�n T�nh quy�t",2,6,36},
		{"Ph� Quan quy�t",2,6,37},
		{"Truy T�m Ti�n quy�t",2,6,38},
		{"Thu Minh quy�t",2,6,39},
		{"Xuy�n T�m quy�t",2,6,40},
		{"Th�i ��c quy�t",2,6,41},
		{"�o�n Ph�ch quy�t",2,6,42},
		{"B�o Ch�m quy�t",2,6,43},
		{"H�m Xa quy�t",2,6,44},
		{"T�a M�nh Ch�m quy�t",2,6,45},
		{"M�n Thi�n V� quy�t",2,6,46}},
		{{"Quan �m Quy�t",2,6,47},
		{"Nga My Ph�t quy�t",2,6,48},
		{"Ng�c N� Ki�m quy�t",2,6,49},
		{"�� Nguy�n Quy�t",2,6,50},
		{"Ph�t Ph� quy�t",2,6,51},
		{"Li�n Hoa quy�t",2,6,52},
		{"Thanh Ph�n quy�t",2,6,53},
		{"L�u Th�y y�u quy�t",2,6,54},
		{"Ph� T� quy�t",2,6,55},
		{"B�t Di�t quy�t",2,6,56},
		{"Ph�t Chi�n quy�t",2,6,57},
		{"Ph�t �m quy�t",2,6,58},
		{"��i Bi quy�t",2,6,59},
		{"T�y Kh�c quy�t",2,6,60},
		{"Kh�c Ngh� quy�t",2,6,61},
		{"Nguy�t Th�c Kh�c quy�t",2,6,62},
		{"�o�n Th�y quy�t",2,6,63},
		{"T�nh D� T� quy�t",2,6,64},
		{"D� Nhi�u quy�t",2,6,65},
		{"D��ng Tam quy�t",2,6,66},
		{"Ph�c Th�y ph�p",2,6,67},
		{"Ph�n C�m quy�t",2,6,68},
		{"� D� �� quy�t",2,6,69},
		{"M� T�m Kh�c quy�t",2,6,70}},
		{{"C�i Bang Ch��ng quy�t",2,6,71},
		{"Th�ng T� quy�t",2,6,72},
		{"Thi�n C�n quy�t",2,6,73},
		{"B� V��ng quy�t",2,6,74},
		{"T�a H�u Th� quy�t",2,6,75},
		{"Ti�u Dao Du quy�t",2,6,76},
		{"L�c H�p y�u quy�t",2,6,77},
		{"T�y �i�p",2,6,78},
		{"T�y Quy�n",2,6,79},
		{"C�i Bang C�n quy�t",2,6,80},
		{"Khu X� quy�t",2,6,81},
		{"Kh�t Th�o quy�t",2,6,82},
		{"N� Thu quy�t",2,6,83},
		{"Di�u Th� Quy�t",2,6,84},
		{"Th�u Chuy�n quy�t",2,6,85},
		{"T� Gi�p quy�t",2,6,86},
		{"Th�u Ho�n quy�t",2,6,87},
		{"�� C�u quy�t",2,6,88}},
		{{"V� �ang Ki�m quy�t",2,6,89},
		{"L�u Quang Ki�m quy�t",2,6,90},
		{"V� ��ng Ki�m quy�t",2,6,91},
		{"Nhu V�n Ki�m quy�t",2,6,92},
		{"Li�t Di�m Ki�m quy�t",2,6,93},
		{"B�n Ph�p quy�t",2,6,94},
		{"V� Ng� Ph�p quy�t",2,6,95},
		{"Th�i Thanh Ki�m quy�t",2,6,96},
		{"Tri�n Ki�m quy�t",2,6,97},
		{"L�c Ki�m quy�t",2,6,98},
		{"T�ch D��ng Ki�m quy�t",2,6,99},
		{"Huy�n Ki�m Tr�n quy�t",2,6,100},
		{"Ng� Ki�m quy�t",2,6,101},
		{"Ch�nh L��ng ki�m quy�t",2,6,102},
		{"Th�i �t Ki�m quy�t",2,6,103},
		{"Th�p Tam Ki�m quy�t",2,6,104},
		{"Huy�n �m Ki�m quy�t",2,6,105},
		{"Thi�n Thu�n ki�m quy�t",2,6,106},
		{"B�t Qu�i Ki�m quy�t",2,6,107},
		{"Th�t Ti�t Ki�m quy�t",2,6,108},
		{"B�t Ph�p quy�t",2,6,109},
		{"Th�i Ti�u C�ng quy�t",2,6,110},
		{"L�c H�a C�ng quy�t",2,6,111},
		{"Th� V�n Tung quy�t",2,6,112},
		{"Th�t Tinh Tr�n",2,6,113},
		{"Thi�u D��ng Quy�t",2,6,114},
		{"Thi�u �m Quy�t",2,6,115},
		{"B�c ��u Tr�n quy�t",2,6,116},
		{"T�n �nh Quy�t",2,6,117},
		{"C�n Kh�n Quy�t",2,6,118},
		{"Th��ng Thanh C�ng quy�t",2,6,119}},
		{{"Th��ng Ph�p quy�t",2,6,120},
		{"Ph� Phong Th��ng quy�t",2,6,121},
		{"Ng� M� quy�t",2,6,122},
		{"B�n Lang Th��ng quy�t",2,6,123},
		{"Chi�n ��nh quy�t",2,6,124},
		{"X�o Chi�n quy�t",2,6,125},
		{"Thi�n Ho�nh Th��ng quy�t",2,6,126},
		{"Anh H�ng quy�t",2,6,127},
		{"��o H�i Th��ng quy�t",2,6,128},
		{"Ng� M� quy�t",2,6,129},
		{"B�ch Th��ng quy�t",2,6,130},
		{"Cung Ph�p quy�t",2,6,131},
		{"Li�n X� Thu�t quy�t",2,6,132},
		{"Tr�n Li�u quy�t",2,6,133},
		{"H�i Long Ti�n quy�t",2,6,134},
		{"Tri�n V�n Ti�n quy�t",2,6,135},
		{"K� M�n ��n quy�t",2,6,136},
		{"Kh� Ti�n quy�t",2,6,137},
		{"To�i Ti�n quy�t",2,6,138},
		{"Huy�n Th�n quy�t",2,6,139},
		{"T�c M�nh quy�t",2,6,140},
		{"L�u Tuy�t Ti�n quy�t",2,6,141}},
		{{"B� ki�p Ng� ��c �ao Ph�p",2,6,142},
		{"B� ki�p D�n H�n Ch�",2,6,143},
		{"B� ki�p Thao Thi Thu�t",2,6,144},
		{"B� ki�p Thi ��c Thu�t",2,6,145},
		{"B� ki�p Thi B�c ��i Ph�p",2,6,146},
		{"B� ki�p T�p Thi T� Kh�",2,6,147},
		{"B� ki�p Ng� Thi Thu�t",2,6,148},
		{"B� ki�p V�n ��c �o�t M�nh �ao",2,6,149},
		{"B� ki�p �m T� H�p H�n Kh�",2,6,150},
		{"B� ki�p Th�i Thi T� Kh�",2,6,151},
		{"B� ki�p T� Linh ��i Ph�p",2,6,152},
		{"B� ki�p T� ��c C�ng",2,6,153},
		{"B� ki�p Thi Li�t Ma C�ng",2,6,154},
		{"B� ki�p H� C� M�t Ph��ng",2,6,155},
		{"B� ki�p Phong C�",2,6,156},
		{"B� ki�p D��ng C� B� Thu�t",2,6,157},
		{"B� ki�p Cu�ng Phong Tr�o",2,6,158},
		{"B� ki�p ��c C�",2,6,159},
		{"B� ki�p Huy�t ��nh C�ng",2,6,160},
		{"B� ki�p Huy�t C�",2,6,161},
		{"B� ki�p H��ng C�",2,6,162},
		{"B� ki�p Thi C�",2,6,163},
		{"B� ki�p Y�u C�",2,6,164},
		{"B� ki�p T�m C�",2,6,165},
		{"B� ki�p V�n C� Th�c Thi�n",2,6,166},
		{"B� ki�p Huy�n C�",2,6,167},
		{"B� ki�p T�m C�",2,6,168}},
}
jue_id = {	{607,"T�i b� ki�p Thi�u L�m"},
			{608,"T�i b� ki�p ���ng M�n"},
			{609,"T�i b� ki�p Nga My"},
			{610,"T�i b� ki�p C�i Bang"},
			{611,"T�i b� ki�p V� �ang"},
			{612,"T�i b� ki�p D��ng M�n"},
			{613,"T�i b� ki�p Ng� ��c"}}
--==================================�ű����߼���=============================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i =1, getn(jue_id) do
		if goods_id == jue_id[i][1] then
			goods_diff = i
			break
		end
	end
	Say("Mu�n x�c nh�n s� d�ng"..jue_id[goods_diff][2].." kh�ng? C� th� thu ���c 5 quy�n t��ng �ng c�a y�u quy�t.",2,
	"��i/#goods_use_det("..goods_diff..")",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--***********************************��Ʒʹ����******************************
function goods_use_det(goods_diff)
	if Zgc_pub_goods_add_chk(5,50) ~= 1 then		--�ռ�/�����ж�
		Talk(1,"","Xin m�i x�c nh�n h�nh trang kh�ng qu� t�i ho�c �� ch� tr�ng!")
		return
	end
	if GetItemCount(2,0,jue_id[goods_diff][1]) == 0 then
		Talk(1,"","Xin x�c nh�n trong h�nh trang c� <color=red>"..jue_id[goods_diff][2].."<color>!")
		return
	end
	if DelItem(2,0,jue_id[goods_diff][1],1) ~= 1 then
		Talk(1,"","Xin x�c nh�n trong h�nh trang c� <color=red>"..jue_id[goods_diff][2].."<color>!")
		return
	else
		for i = 1, 5 do
			local ran_num = random(1,getn(jue_list[goods_diff]))
			local add_flag = AddItem(jue_list[goods_diff][ran_num][2],jue_list[goods_diff][ran_num][3],jue_list[goods_diff][ran_num][4],1)
			if add_flag == 1 then
				Msg2Player("Nh�n ���c 1 :\""..jue_list[goods_diff][ran_num][1].."\"")
			else
				WriteLog(GetName().."Nh�n ���c ph�n th��ng:"..jue_list[goods_diff][ran_num][1].."Th�m th�t b�i, k� hi�u:"..add_flag)
			end
		end
	end	
end
