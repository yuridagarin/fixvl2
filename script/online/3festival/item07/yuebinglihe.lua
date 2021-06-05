--�±���нű�
--by vivi
--09/14/2007

tYuebing = { 
	{"Th�nh Th� Mai H�n H��ng Nguy�t",2,0	,1008,30},
	{"Th�nh Th� B�ch Ng�c Song Nguy�t",2,0	,1009,45},
	{"Th�nh Th� K� H��ng Ng� Nh�n Nguy�t",2,0	,1010,70},
	{"Th�nh Th� B�ch Hoa Th�p C�m Nguy�t",2,0	,1011,90},
	{"Th�nh Th� Th�t Tinh B�n Qu�n Nguy�t",2,0	,1012,97},
	{"Th�nh Th� H�ng Nga Th�y Tinh Nguy�t",2,0	,1013,100}
	}

function OnUse()
	Say("M� h�p b�nh Trung Thu ng�u nhi�n nh�n ���c 1 b�nh Trung Thu Th�nh Th�, m� kh�ng? ",
		3,
		"��ng �/confirm_yuebing",
		"Ta mu�n xem x�c su�t nh�n ���c b�nh Trung Thu./about_prob",
		"Kh�ng c� g�/nothing")
end

function confirm_yuebing()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if DelItem(2,0,1020,1) == 1 then
		local nRand = random(1,100)
		for i=1,getn(tYuebing) do
			if nRand <= tYuebing[i][5] then
				local add_flag = AddItem(tYuebing[i][2],tYuebing[i][3],tYuebing[i][4],1,1);
				if add_flag == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..tYuebing[i][1].." 1!");
					if i == getn(tYuebing) then
						Msg2Global("Ng��i ch�i"..GetName().."M� h�p b�nh Trung Thu nh�n ���c "..tYuebing[i][1].." 1!");
					end
				else
					WriteLog("H�p b�nh Trung Thu: "..GetName().."M� b�nh Trung Thu nh�n ���c b�nh Trung Thu th�t b�i, v� tr� th�t b�i:"..add_flag);
				end
				break
			end
		end
	end
end

function about_prob()
	local sDia = "";
	local nProb = tYuebing[1][5];
	for i=1,getn(tYuebing) do
		if i > 1 then
			nProb = tYuebing[i][5]-tYuebing[i-1][5];
		end
		sDia = sDia..tYuebing[i][1].."  <color=yellow>"..nProb.."%<color>\n";
	end
	Talk(1,"OnUse",sDia);
end 

function nothing()

end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end