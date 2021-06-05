--filename:�ɶ�����¥�ϰ�.lua
--create date:2006-01-12
--author:yanjun
--describe:�ɶ�����¥�ϰ�ű�

RING_COUNTER = 0	--���������

Include("\\script\\online\\���ڻ\\newyear_head.lua")	

function main()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20060216 then
		Say("Ch�c m�i ng��i n�m m�i vui v�, v�o <color=red>ng�y 16/02/2008<color> b�n ti�m s� ch�nh th�c m� c�a, c�c v�"..strSex.."nh� gh� nh�!",0)
		return 0
	end
	if nDate > 20060221 then
		Say("T�t qua r�i, b�n ti�m xin ph�p ��ng c�a ngh�! C�c v�"..strSex.."Nh� t�t n�m sau ��n �ng h� b�n ti�m nh�!",0)
		return 0
	end
	if NEWYEAR_SWITCH == 1 then
		local selTab = {
					"Ch� bi�n s�i c�o./make_dumpling",
					"��i ph�n th��ng/request_award",
					"Ti�m s�i c�o/know_detail",
					"Ta ch� gh� ngang qua th�i./nothing"
					}
		Say("�i ch�!"..strSex.."m�i v�o trong, h�y gi�p �� qu�n nh�!",4,selTab)
	else
		Say("B�n ti�m ch�a m� c�a,"..strSex.."h�y ��i v�i ng�y.",0)
		return 0
	end
end

function make_dumpling()
	local selTab = {
		"S�i c�o b�p c�i/select_baicai",
		"S�i c�o c� r�t/select_luobo",
		"S�i c�o rau c�n/select_qincai",
		"S�i c�o kim chi/select_suancai",
		"S�i c�o rau h�/select_jiucai",
		"Trang sau./see_nextpage",
		"Ta ch�a mu�n �n!/nothing"
		}
	Say("Kh�ch quan mu�n �n s�i c�o lo�i n�o?",7,selTab)
end

function see_nextpage()
	local selTab = {
		"S�i c�o th�t heo/select_zhurou",
		"S�i c�o th�t b�/select_niurou",
		"S�i c�o t�m/select_xiaren",
		"Tam Ti�n s�i c�o/select_sanxian",
		"S�i c�o may m�n/select_xingyun",
		"S�i c�o th�y tinh/select_shuijing",
		"Trang tr��c./see_prepage",
		"Ta ch�a mu�n �n!/nothing"
		}
	Say("Kh�ch quan mu�n �n s�i c�o lo�i n�o?",8,selTab)
end

function see_prepage()
	make_dumpling()
end

function request_award()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	local selTab = {
		"Ta mu�n ��i s�i c�o may m�n l�y 1 quy�n m�t t�ch./want_miji",
		"Ta mu�n ��i s�i c�o th�y tinh v� Long c�t l�y 1 m�n trang s�c./want_shipin",
		"Ta ch�a mu�n ��i l�y ph�n th��ng./nothing"
		}
	Say("Kh�ch quan mu�n d�ng s�i c�o lo�i n�o �� ��i ph�n th��ng?",3,selTab)
end

function know_detail()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	Say("S�i c�o c�a b�n ti�m n�i ti�ng kh�p n�i, n�m x�a Th�i t� ho�ng �� �� ��ch th�n t�n th��ng m�i v� th�m ngon c�a s�i c�o. Nh�ng b�n ti�m c� 2 quy t�c: m�i n�m ch� b�n m�y ng�y t�t v� s�i c�o ch� l�m gi�p ch� kh�ng b�n, nguy�n li�u ph�i t� chu�n b�."..strSex.."N�u �� n�m r� quy t�c, sao kh�ng tranh th� thu th�p nguy�n li�u, b�n ti�m b�o ��m s� l�m ra nh�ng s�i c�o th�m ngon, �n v�o nh� m�i h��ng v�.",0)
end

function nothing()

end

function want_miji()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(2,1,252) >= 1 then
		if DelItem(2,1,252,1) == 1 then
			if AddItem(0,107,155,1) == 1 then
				WriteLog("[Ho�t ��ng m�a xu�n d�ng s�i c�o ��i ph�n th��ng]:"..GetName().."��i s�i c�o may m�n l�y 1 quy�n m�t t�ch.")
				Msg2Player("Ch�c m�ng b�n nh�n ���c 1 quy�n m�t t�ch.")
			end
		end
	else
		Say("D��ng nh�"..strSex..", qu�n mang hay l� �� �n h�t r�i?",0)
	end
end

function want_shipin()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if RING_COUNTER >= 50 then
		Say("Ho�t ��ng s�i c�o x�y ra l�i h� th�ng, h�y li�n h� GM �� kh�c ph�c!",0)
		return 0
	end
	if GetItemCount(2,1,253) >= 1 and GetItemCount(2,1,116) >= 1 then
		if DelItem(2,1,253,1) == 1 and DelItem(2,1,116,1) == 1 then
			if AddItem(0,102,24,1,1,-1,-1,-1,-1,-1,-1) == 1 then
				RING_COUNTER = RING_COUNTER + 1
				WriteLog("[Ho�t ��ng m�a xu�n d�ng s�i c�o ��i ph�n th��ng]:"..GetName().."d�ng s�i c�o th�y tinh v� Long c�t ��i ��ng Ph��ng Long Ch�u.")
				Msg2Player("Ch�c m�ng b�n nh�n ���c 1 m�n trang s�c.")
				AddGlobalNews("Ch�c m�ng"..GetName().."Nh�n ���c ��ng Ph��ng Long Ch�u.")
			end
		end
	else
		Say("D��ng nh�"..strSex..", qu�n mang theo �?",0)
	end
end
--===========================================================================
--===========================================================================
--===========================================================================
--===========================================================================
function select_niurou()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o th�t b�./make_niurou",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o th�t b�<color>: <color=red>1 S�i c�o th�t heo, 1 th�t b�, 1 b�t m�<color>, 30 l��ng b�c, n�u th�t b�i nguy�n li�u s� m�t h�t. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_zhurou()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o th�t heo./make_zhurou",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o th�t heo<color>: <color=red>1 S�i c�o rau h�, 1 th�t heo, 1 b�t m�<color>, 20 l��ng b�c, n�u th�t b�i nguy�n li�u s� m�t h�t. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_xiaren()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o t�m./make_xiaren",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o t�m<color>: <color=red>1 s�i c�o th�t b�, 1 t�m n�n, 1 b�t m�<color>, 40 l��ng b�c, n�u th�t b�i nguy�n li�u s� m�t h�t. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_luobo()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o c� c�i./make_luobo",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o c� c�i<color>: <color=red>1 S�i c�o c�i tr�ng, 1 c� c�i, 1 b�t m�, 1 th�p tam h��ng<color>, 1 l��ng b�c, n�u th�t b�i nguy�n li�u s� m�t h�t. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_suancai()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o d�a chua./make_suancai",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o d�a chua<color>: <color=red>1 S�i c�o c�n t�y, 1 c�i tr�ng, 1 b�t m�, 1 th�p tam h��ng<color>, 4 l��ng b�c, n�u th�t b�i nguy�n li�u s� m�t h�t. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_baicai()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o c�i tr�ng./make_baicai",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o c�i tr�ng<color>: <color=red>1 c�i tr�ng, 1 b�t m�, 1 th�p tam h��ng<color>, 1 l��ng b�c, n�u th�t b�i nguy�n li�u s� m�t h�t. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_qincai()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o c�n t�y./make_qincai",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o c�n t�y<color>: <color=red>1 s�i c�o c� c�i, 1 c�n t�y, 1 b�t m�, 1 th�p tam h��ng<color>, 2 l��ng b�c, n�u th�t b�i nguy�n li�u s� m�t h�t. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_jiucai()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o rau h�./make_jiucai",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o rau h�<color>: <color=red>1 s�i c�o d�a chua, 1 rau h�, 1 b�t m�, 1 th�p tam h��ng<color>, 8 l��ng b�c, n�u th�t b�i nguy�n li�u s� m�t h�t. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_sanxian()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o ba m�n./make_sanxian",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o ba m�n<color>: <color=red>3 S�i c�o t�m<color>, 1 l��ng v�ng, n�u th�t b�i nguy�n li�u s� m�t 1 s�i c�o t�m. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_xingyun()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o may m�n./make_xingyun",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o may m�n<color>: <color=red>3 S�i c�o ba m�n<color>, 4 l��ng v�ng, n�u th�t b�i nguy�n li�u s� m�t 1 S�i c�o ba m�n. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end

function select_shuijing()
	local selTab = {
				"���ng nhi�n, ta �ang mu�n �n s�i c�o th�y tinh./make_shuijing",
				"�� ta suy ngh� l�i./noting"
				}
	Say("Nguy�n li�u �� l�m <color=yellow>S�i c�o th�y tinh<color>: <color=red>3 S�i c�o may m�n<color>, 20 l��ng v�ng, n�u th�t b�i nguy�n li�u s� m�t 1 s�i c�o may m�n. Ng�i c� mu�n l�m kh�ng?",2,selTab)
end
--===========================================================================
--===========================================================================
--===========================================================================
--===========================================================================
function make_niurou()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(1,0,33) == 0 or GetItemCount(2,1,258) == 0  or GetItemCount(2,1,255) == 0 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end
	if GetCash() < 3000 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if DelItem(1,0,33,1) == 1 and DelItem(2,1,258,1) == 1 and DelItem(2,1,255,1) == 1 then
		Pay(3000)
		if nRandomNum <= 50 then
			if AddItem(1,0,34,1) == 1 then
				WriteLog("[Ho�t ��ng m�a xu�n Ch� bi�n s�i c�o]:"..GetName().."Nh�n ���c 1 s�i c�o th�t b�.")
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o th�t b�")
			end
		else
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i!",0)
			Msg2Player("Ch� bi�n s�i c�o th�t b� th�t b�i.")
		end
	end
end

function make_zhurou()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(2,1,247) == 0 or GetItemCount(2,1,257) == 0  or GetItemCount(2,1,255) == 0 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end		
	if GetCash() < 2000 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end
	if DelItem(2,1,247,1) == 1 and DelItem(2,1,257,1) == 1 and DelItem(2,1,255,1) == 1 then
		Pay(2000)
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			if AddItem(1,0,33,1) == 1 then
				WriteLog("[Ho�t ��ng m�a xu�n Ch� bi�n s�i c�o]:"..GetName().."Nh�n ���c 1 s�i c�o th�t heo.")
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o th�t heo")
			end
		else
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i!",0)
			Msg2Player("Ch� bi�n s�i c�o th�t heo th�t b�i.")
		end	
	end
end

function make_xiaren()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(2,1,259) == 0 or GetItemCount(1,0,34) == 0  or GetItemCount(2,1,255) == 0 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end		
	if GetCash() < 4000 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end
	if DelItem(2,1,259,1) == 1 and DelItem(1,0,34,1) == 1 and DelItem(2,1,255,1) == 1 then
		Pay(4000)
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			if AddItem(1,0,35,1) == 1 then
				WriteLog("[Ho�t ��ng m�a xu�n Ch� bi�n s�i c�o]:"..GetName().."Nh�n ���c 1 s�i c�o t�m.")
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o t�m")
			end
		else
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i!",0)
			Msg2Player("Ch� bi�n s�i c�o t�m th�t b�i.")
		end		
	end
end

function make_luobo()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(2,1,243) == 0 or GetItemCount(2,1,260) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end
	if GetCash() < 100 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end
	if DelItem(2,1,243,1) == 1 and DelItem(2,1,260,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(100)
		local nRandomNum = random(1,100)
		if nRandomNum <= 70 then	
			if AddItem(2,1,244,1) == 1 then
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o c� c�i")
			end
		else
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i!",0)
			Msg2Player("Ch� bi�n s�i c�o c� c�i th�t b�i.")
		end
	end
end

function make_suancai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(2,1,245) == 0 or GetItemCount(2,1,262) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end	
	if GetCash() < 400 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end	
	if DelItem(2,1,245,1) == 1 and DelItem(2,1,262,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(400)
		local nRandomNum = random(1,100)
		if nRandomNum <= 60 then
			if AddItem(2,1,246,1) == 1 then
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o d�a chua")
			end
		else
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i! .",0)
			Msg2Player("Ch� bi�n s�i c�o d�a chua th�t b�i.")
		end		
	end
end

function make_baicai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(2,1,262) == 0 or GetItemCount(2,1,255) == 0  or GetItemCount(2,1,256) == 0 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end		
	if GetCash() < 100 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end
	if DelItem(2,1,262,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(100)
		local nRandomNum = random(1,100)
		if nRandomNum <= 70 then
			if AddItem(2,1,243,1) == 1 then
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o c�i tr�ng")
			end
		else
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i!",0)
			Msg2Player("Ch� bi�n s�i c�o c�i tr�ng th�t b�i.")
		end		
	end
end

function make_qincai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(2,1,244) == 0 or GetItemCount(2,1,263) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end		
	if GetCash() < 200 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end
	if DelItem(2,1,244,1) == 1 and DelItem(2,1,263,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(200)
		local nRandomNum = random(1,100)
		if nRandomNum <= 70 then
			if AddItem(2,1,245,1) == 1 then
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o c�n t�y")
			end
		else
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i!",0)
			Msg2Player("Ch� bi�n s�i c�o c�n t�y th�t b�i.")
		end			
	end
end

function make_jiucai()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(2,1,246) == 0 or GetItemCount(2,1,264) == 0  or GetItemCount(2,1,255) == 0 or GetItemCount(2,1,256) == 0 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end	
	if GetCash() < 800 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end	
	if DelItem(2,1,246,1) == 1 and DelItem(2,1,264,1) == 1 and DelItem(2,1,255,1) == 1 and DelItem(2,1,256,1) == 1 then
		Pay(800)
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			if AddItem(2,1,247,1) == 1 then
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o rau h�")
			end
		else
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i! .",0)
			Msg2Player("Ch� bi�n s�i c�o rau h� th�t b�i.")
		end		
	end
end

function make_sanxian()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(1,0,35) < 3 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end		
	if GetCash() < 10000 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if nRandomNum <= 33 then
		if DelItem(1,0,35,3) == 1 then
			Pay(10000)
			if AddItem(2,1,251,1) == 1 then
				WriteLog("[Ho�t ��ng m�a xu�n Ch� bi�n s�i c�o]:"..GetName().."Nh�n ���c 1 s�i c�o ba m�n.")
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o ba m�n")
			end
		end
	else
			DelItem(1,0,35,1)
			Pay(10000)
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i! .",0)
			Msg2Player("Ch� bi�n s�i c�o ba m�n th�t b�i.")	
	end
end

function make_xingyun()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if GetItemCount(2,1,251) < 3 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end		
	if GetCash() < 40000 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if nRandomNum <= 33 then
		if DelItem(2,1,251,3) == 1 then
			Pay(40000)
			if AddItem(2,1,252,1) == 1 then
				WriteLog("[Ho�t ��ng m�a xu�n Ch� bi�n s�i c�o]:"..GetName().."Nh�n ���c 1 s�i c�o may m�n.")
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o may m�n")
			end
		end
	else
			DelItem(2,1,251,1)
			Pay(40000)
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i!",0)
			Msg2Player("Ch� bi�n s�i c�o may m�n th�t b�i.")	
	end
end

function make_shuijing()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	if RING_COUNTER >= 50 then	--����50���Ͳ��ٲ�����
		return 0
	end
	if GetItemCount(2,1,252) < 3 then
		Say("Xin l�i, b�n kh�ng �� v�t li�u.",0)
		return 0
	end		
	if GetCash() < 200000 then
		Say("Xin l�i, b�n kh�ng �� ti�n.",0)
		return 0
	end
	local nRandomNum = random(1,100)
	if nRandomNum <= 20 then
		if DelItem(2,1,252,3) == 1 then
			Pay(200000)
			if AddItem(2,1,253,1) == 1 then
				WriteLog("[Ho�t ��ng m�a xu�n Ch� bi�n s�i c�o]:"..GetName().."nh�n ���c 1 s�i c�o th�y tinh.")
				Say("S�i c�o th�m ngon ��y!"..strSex.."h�y th��ng th�c!",0)
				Msg2Player("B�n nh�n ���c 1 s�i c�o th�y tinh")
			end
		end
	else
			DelItem(2,1,252,1)
			Pay(200000)
			Say("Sao th�? L� n�o l�i th�t b�i? Th�t xin l�i!",0)
			Msg2Player("Ch� bi�n s�i c�o th�y tinh th�t b�i.")	
	end
end
