--filename:����ѩ�̴�����out.lua
--create date:2006-01-12
--author:yanjun
--describe:����ѩ�̴����ˣ��볡���ű�
function main()
	local selTab = {
			"Ta mu�n quay v�./gohome",
			"Ta mu�n mua tuy�t c�u./buysnowball",
			"Ta qu�n c�ch ch�i r�i, h�y n�i l�i l�n n�a./know_detail",
			"Th�t v�t v� cho ng��i!/nothing"
			}
	Say("Ch�i vui kh�ng? Ta c� th� gi�p g�?",4,selTab)
end

function gohome()
	NewWorld(350,1575,2970)
	if GetWorldPos() == 350 then
		SetDeathPunish(1)
		SetFightState(0)
		UseScrollEnable(1)
		SetTempRevPos(0,0,0)
		for SkillID=843,851 do
			RemoveSkill(SkillID)	--���Ǵ�ѩ�̼���
		end
		SetDeathScript("")
	end
end

function buysnowball()
	Sale(52)
end

function know_detail()
	Talk(6,"","V�o khu n�m tuy�t ng��i s� c� m�t s� k� n�ng trong � k� n�ng b�n ph�i (kh�ng ph�i b�ng k� n�ng F5)","K� n�ng kh�c nhau s� ti�u hao Tuy�t C�u kh�c nhau. M�i ng�y v�o khu n�m tuy�t s� ���c ph�t 20 ��n Ti�u Tuy�t C�u v� 20 Ti�u Tuy�t C�u mi�n ph�, c�ng c� th� mua t�i ti�m t�p h�a ho�c Tuy�t Gi�.","5 th�nh th� m�i th�nh ��u c� 1 Tuy�t Gi�, t��ng �ng v�i 5 khu n�m tuy�t kh�c nhau.","Khu n�m tuy�t c� r�t nhi�u b�o r��ng ch�a nhi�u �� qu� ch� ng��i ��n m�.","M�i ng�y 12h, 18h, 21h t�i 5 khu n�m tuy�t s� ph�t 100 ph�n qu� n�m m�i. M�i ng��i h�y nhanh ch�n ��n l�y!","Ch� �: Trong khu v�c n�m tuy�t kh�ng th� s� d�ng H�i Th�nh ph� hay M�t H�m c�a s� ph�.")
end

function nothing()

end