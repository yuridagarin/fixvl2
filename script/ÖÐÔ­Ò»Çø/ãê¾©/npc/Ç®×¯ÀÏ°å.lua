
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII Ǯׯ�ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================
GOLD_COIN_2_TIME =
{
	-- ����,	����
	{ 	7,	200 },
	{ 	28, 	600 },
};
SECONDS_ONE_DAY = 24 * 3600;

best = 0;
if GOLD_COIN_2_TIME[1][1]/GOLD_COIN_2_TIME[1][2] < GOLD_COIN_2_TIME[2][1]/GOLD_COIN_2_TIME[2][2] then
	best = 2;
else
	best = 1;
end

function main()
	Say("L�o c� th� gi�p g� cho qu� kh�ch ��y??", 1,
--		"����ʹ�ý�ҳ���Ϸʱ�䣡/select_charge_style",
		"Ta nh�n ti�n gh� th�m �ng th�i m�!/nothing" )
	return
end

function nothing()
end

function select_charge_style()
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin <= 0 then
		Say("H�nh nh� qu� kh�ch kh�ng mang theo ti�n xu!!", 0);
		return
	end
	Say("Qu� kh�ch c� th�: 1. D�ng 200 Xu ��i 7 ng�y ch�i. 2. D�ng 600 Xu ��i 28 ng�y ch�i." ,
		3,
		"Ta mu�n d�ng 200 Xu ��i 7 ng�y ch�i/#start_charge(1)",
		"Ta mu�n d�ng 600 Xu ��i 28 ng�y ch�i/#start_charge(2)",
--		"�����Լ�����Ҫʹ�õĽ������/customize_charge_input",
		"T�m th�i ch�a c�n!/nothing" );
end

function start_charge(n)
	if n < 1 or n > getn(GOLD_COIN_2_TIME) then
		return
	end
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin >= GOLD_COIN_2_TIME[n][2] then
		Say( "B�n ��ng � d�ng"..GOLD_COIN_2_TIME[n][2].." Xu ��i "..GOLD_COIN_2_TIME[n][1].." ng�y ch�i ch�?!?",
			2,
			"��ng r�i!/#finish_charge("..n..")",
			"Th�i! Kh�ng ��i n�a!/nothing" );
	else
		Say( "Xin l�i! Kh�ch quan kh�ng �� xu!", 0);
	end
end

function finish_charge(n)
	print(n, type(n))
	if n < 1 or n > getn(GOLD_COIN_2_TIME) then
		return
	end
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin >= GOLD_COIN_2_TIME[n][2] then
		ChargeTimeUseCoin( GOLD_COIN_2_TIME[n][2], GOLD_COIN_2_TIME[n][1] * SECONDS_ONE_DAY);
		WriteLog("[CoinExchange]\t"..GetAccount().."\t"..GetName().."\td�ng"..GOLD_COIN_2_TIME[n][2].." Xu ��i "..GOLD_COIN_2_TIME[n][1].." ng�y ch�i.")		
	else
		Say( "Xin l�i! Kh�ch quan kh�ng �� xu!", 0);
	end
end

function customize_charge_input()
	AskClientForNumber("customize_charge_start", 1, GetGoldCoin(), "Xin nh�p s� Xu c�n ��i!");
end

function customize_charge_start(num)
	if num == nil then
		return
	end
	if num <= 0 or num > GetGoldCoin() then
		Say( "Nh�p s� b� l�i!", 0);
		return
	end

	local n1 = floor( num / GOLD_COIN_2_TIME[best][2] );
	local m = mod( num, GOLD_COIN_2_TIME[best][2] );
	local n2 = floor( m / GOLD_COIN_2_TIME[3-best][2] );

	Say( "Qu� kh�ch v�a nh�p "..num.." Xu. Theo l�o t�nh, c� th� s� d�ng "..n1.."  "..GOLD_COIN_2_TIME[best][2].." ng�y v� "..n2.."  "..GOLD_COIN_2_TIME[3-best][1].." ng�y. Nh� v�y kh�ng c� v�n �� g� ch�?",
		2,
		format("��ng r�i! C� nh� v�y �i!/#customize_charge_finish(%d,%d)", n1, n2),
		"Khoan ��! Ta suy ngh� ch�t!/nothing" );
end

function customize_charge_finish(n1, n2)
	if n1 == nil then
		n1 = 0;
	end
	if n2 == nil then
		n2 = 0;
	end
	if n1 < 0 or  n2 < 0 then
		return
	end
	if n1 == 0 and n2 == 0 then
		return
	end
	if n1 * GOLD_COIN_2_TIME[best][2] + n2 * GOLD_COIN_2_TIME[3-best][2] > GetGoldCoin() then
		return
	end
	local d1 = n1 * GOLD_COIN_2_TIME[best][1];
	local d2 = n2 * GOLD_COIN_2_TIME[3-best][1];
	if n1 > 0 then
		ChargeTimeUseCoin( n1 * GOLD_COIN_2_TIME[best][2], d1 * SECONDS_ONE_DAY );
	end
	if n2 > 0 then
		ChargeTimeUseCoin( n2 * GOLD_COIN_2_TIME[3-best][2], d2 * SECONDS_ONE_DAY );
	end
end

