Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 

szNpcName = "<color=green>Gi�o S�: <color>"
szBang = {	
	[1] = {"B�ch H�","1:1.78"},
	[2] = {"��i �ng","1:2"},
	[3] = {"K� H�","1:1.96"},
	[4] = {"M�nh H�","1:1.96"},
	[5] = {"Ng� H�","1:1.74"},
	[6] = {"Ph�c H�","1:1.97"},
	[7] = {"Th�n Long","1:1.66"},
	[8] = {"Thi�n Long","1:1.96"},
	[9] = {"X�ch Long","1:1.97"},
}
	
function main()
	local tSay = {};
	--���
	local tActivityID = {102, 104, 106, 108, 113};
	for k, v in tActivityID do
		if 200 == GetWorldPos() then
			tSay = aah_GetSayDialog(tonumber(v));
		end
	end	
	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20141103 and nDate <= 20141108 then
		tinsert(tSay,"Ta mu�n xem t�nh tr�ng ��t c��c/show_DuDoan")
		--Event D� �o�n BHTA12
		if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) == 0 then		
			for i = 1, getn(szBang) do
				tinsert(tSay,"Ta mu�n ��nh c��c Bang H�i "..szBang[i][1].."(t�n Thi�n Ki�u L�nh - T� l� "..szBang[i][2]..")/#DuDoan_02("..i..")")
			end			
		else
			local nBangHoi = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
			tinsert(tSay,"Ta mu�n ��nh c��c Bang H�i "..szBang[nBangHoi][1].."(t�n Thi�n Ki�u L�nh - T� l� "..szBang[nBangHoi][2]..")/#DuDoan_02("..nBangHoi..")")
		end
	end
	
	tinsert(tSay, "Tho�t/nothing")
	Say("<color=green>Gi�o S�:<color>Th��ng �� ch�c ph�c cho b�n!", getn(tSay), tSay);
end

function show_DuDoan()
	local nBang = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
	Talk(1,"",szNpcName.."C�c h� �� d� �o�n ���c <color=yellow>"..gf_GetTaskByte(TSK_DUDOAN_BHTA12,3).." Thi�n Ki�u L�nh<color> cho bang h�i <color=yellow>"..szBang[nBang][1].."<color>")
end

function DuDoan_02(nBang)
	if gf_CheckLevel(5,90) ~= 1 then
		Talk(1,"", szNpcName.."C�c h� c�n ��t �t nh�t chuy�n sinh 5 c�p 90 �� ���c d� �o�n!")
		return
	end
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) >= 50 then
		Talk(1,"",szNpcName.."C�c h� �� d� �o�n �� s� l��ng. Kh�ng th� ti�p t�c tham gia!")
		return
	end
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) ~= 0 then
		if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) ~= nBang then
			Talk(1,"",szNpcName.."C�c h� ch� ���c d� �o�n 1 bang duy nh�t")
			return
		end
	end	
	
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",szNpcName.."Tr�ng th�i hi�n t�i kh�ng th� d� �o�n!")
		return
	end	
	
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 
	end

	local tSay = {}
	tinsert(tSay,format("Ta mu�n ��t c��c 5 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,5))
	tinsert(tSay,format("Ta mu�n ��t c��c 10 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,10))
	tinsert(tSay,format("Ta mu�n ��t c��c 15 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,15))
	tinsert(tSay,format("Ta mu�n ��t c��c 20 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,20))
	tinsert(tSay,format("Ta mu�n ��t c��c 50 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,50))
	tinsert(tSay, "Tho�t/nothing")
	Say(szNpcName.."C�c h� mu�n ��t c��c th� n�o?", getn(tSay), tSay);
end

function DuDoan_01(nBang,nDatCuoc)

	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) + nDatCuoc > 50 then
		Talk(1,"",szNpcName.."C�c h� ch� ���c d� �o�n t�i �a <color=yellow>50<color> Thi�n Ki�u L�nh!")
		return
	end

	if GetItemCount(2,97,236) < nDatCuoc then
		Talk(1,"",szNpcName.."C�c h� kh�ng �em �� s� l��ng Thi�n Ki�u L�nh!")
		return
	end
	
	if DelItem(2,97,236,nDatCuoc) == 1 then		
		gf_SetTaskByte(TSK_DUDOAN_BHTA12,2,nBang)
		gf_SetTaskByte(TSK_DUDOAN_BHTA12,3,gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) + nDatCuoc)
		gf_WriteLogEx("DU DOAN BHTA12", "du doan thanh cong", nDatCuoc, "du doan "..szBang[nBang][1])	
		Talk(1,"",szNpcName.."C�c h� �� ��t c��c th�nh c�ng <color=yellow>"..nDatCuoc.."<color> cho bang h�i <color=yellow>"..szBang[nBang][1].."<color>")
		return
	else
		Talk(1,"",szNpcName.."��t c��c kh�ng th�nh c�ng, xin vui l�ng th�c hi�n l�i!")
		return
	end
end