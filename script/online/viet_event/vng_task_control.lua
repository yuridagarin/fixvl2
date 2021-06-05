-- TaskID for VNG
-- Created by TuanNA5
--Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua");
local nDate = tonumber(date("%y%m%d"))
--**************************************************************************************************************
-- Global Task
--**************************************************************************************************************
GLB_TSK_SERVER_ID = 1023 -- ServerID
GLB_TASK_NEWRES_SONG = 1024 -- Th�i gian T�ng Nguy�n So�i k�ch ho�t x2 T�i Nguy�n Chi�n
GLB_TASK_NEWRES_LIAO = 1025 -- Th�i gian Li�u Nguy�n So�i k�ch ho�t x2 T�i Nguy�n Chi�n
GLB_TASK_SUMMON_SONG = 1034 -- Th�i gian k�ch ho�t g�i boss phe T�ng
GLB_TASK_SUMMON_LIAO = 1035 -- Th�i gian k�ch ho�t g�i boss phe T�ng
GLB_TASK_PROMOTION = 1037 --l�u th�i gian khi mua v�t ph�m khuy�n m�i h�ng ng�y



--**************************************************************************************************************
-- Temp Task
--**************************************************************************************************************
-- D� �o�n thi ��u
--TSK_TMP_SELECT_COUNT = 108 -- S� ��i �� ch�n
--TSK_TEAM_LIST_1 = 109 -- List team �� ch�n 1
--TSK_TEAM_LIST_2 = 110 -- List team �� ch�n 2
--TSK_TMP_CHOICE = 117 -- Lo�i h�nh d� �o�n �� ch�n

-- T�i nguy�n chi�n
TSK_TIME_KICHHOAT_TNC =  2285 --l�u time k�ch ho�t h� tr� ��o nhanh t�i nguy�n chi�n
TSK_TMP_NEWRES = 108 -- Thu th�p t�i nguy�n
TSK_TEMP_SONGLIAO_BET = 109 -- D� �o�n T�ng Li�u

TSK_TMP_TRANS_NEILI = 110 -- B�c ��u truy�n c�ng thu�t
TSK_TMP_PRACTICE_NEILI = 117 -- B�c ��u d��ng sinh thu�t
TSK_TMP_NEILI_TYPE_SP = 205 -- Ph�n lo�i D��ng Sinh & Truy�n C�ng ��c bi�t

TSK_TMP_BHTA6_VOTE = 118 -- Vote BHTA 5

TSK_TMP_PET_INDEX = 119 -- L�u index c�a pet
TSK_TMP_PET_ENEMY_INDEX= 129 -- L�u index pet c�a ��i th�
TSK_TMP_ENEMY_INDEX= 201 -- L�u index c�a ��i th�
TSK_TMP_FRUIT_INDEX = 208 -- Mua tr�i c�y NPC ���ng Minh Th�nh
TSK_TMP_CHUYENDOITRANGBI = 209
--**************************************************************************************************************
-- Task ID
--**************************************************************************************************************
-- TASK BAO HIEM: 2665

-- TASK NEW SERVER
if nDate >= 141021 and nDate <= 141202 then
	TSK_HOATDONGNEWSERVER = 1534
	TSK_HOATDONGNEWSERVER_NHANTHUONG = 2157
	TSK_CONGHIENBANG = 2185
	TSK_TOP_LEVEL = 2545
	TSK_TOP_AWARD = 2276
	TSK_BONUS_CONLON = 2185
else
	TSK_HOATDONGNEWSERVER = 2665
	TSK_HOATDONGNEWSERVER_NHANTHUONG = 2665
	TSK_CONGHIENBANG = 2665
	TSK_TOP_LEVEL = 2665
	TSK_TOP_AWARD = 2665
	TSK_BONUS_CONLON = 2665
end

-- X�a Khu�t Nguy�n B�i
TSK_XOA_KHUATNGUYENBOI = 2188 -- Bit 1: first login; Bit 2: Nhan lai 1 lan mien phi
-- Kim x� th�ng 1
TSK_KIMXATHANG1 = 2188
--================= Ph�c Sinh 2
TSK_PHUCSINH2 = 2175	-- ABB
-- A: tr�ng th�i nh�n th� th�ch
-- BB: t�ng s� l�n ho�n th�nh nhi�m v�
TSK_PHUCSINH2_COUNT = 2176	-- ABBCDDD
-- A: S� l�n ho�n th�nh nv trong ng�y
-- BB: ID nhi�m v� �ang nh�n
-- C: tr�ng th�i ho�n th�nh nhi�m v�
-- DDD: b� ��m b��c nhi�m v�
-- Event trang b� Kim X�
--TSK_EVENTKIMXA = 2540 -- Expired
TSK_EVENTKIMXA_NHANTHUONG = 2545 -- Expired

-- Event trang b� Kim X� Li�n Server
TSK_KIMXA_ALLSERVER_POINT = 2660
TSK_KIMXA_ALLSERVER_AWARD = 2540

-- Sinh t� v� ng�
TSK_SINHTUVONGA1 = 2700 -- GAABCCDDD
	-- AA: B� ��m ph�n th��ng 
	-- B: Tr�ng th�i nh�n h� tr� m�i ng�y
	-- CC: �i�m n�p m�i ng�y
	-- DDD: �i�m hi�n c�
	--G: x�c ��nh qua n�y reset �i�m n�p m�i ng�y
TSK_SINHTUVONGA2 = 2701 -- YYMMDD: ng�y h�t h�n
TSK_SINHTUVONGA3 = 2713 -- AxxxxxxxB; A: tr�ng th�i nh�n n.v�; B: nhi�m v� C�ng T�
-- Nhi�m v� ��ng h�nh
TSK_DONGHANH = 2189
	-- Byte 1 + Byte2: s� l��ng nhi�m v� ho�n th�nh; 
	-- Byte 3: Lo�i nhi�m v� �ang nh�n; 
	-- Bit 25: Tr�ng th�i ho�n th�nh nhi�m v�.
	-- Bit 26: Tr�ng th�i nh�n th��ng m�i ng�y
	-- Bit 27: Tr�ng th�i nh�n th��ng cu�i
TSK_DONGHANH_COUNT = 2283
	-- Byte 1: S� l�n nh�n nv ��ng h�nh trong ng�y, reset m�i ng�y
	-- Byte 2: S� l�n ho�n th�nh c�n l�i c�a nhi�m v� c� y�u c�u s� l��ng
-- Nh�n h� tr� qu�n c�ng
TSK_HOTROQUANCONG = 2284
-- Thu ��i nguy�n li�u Qu�n D�ng
TSK_THUQUANDUNG = 2187 -- ABCDDE
	 -- A: Ph�n th��ng cu�i m� r�ng event
	 -- B: S� l�n n�p kem que m�i ng�y
	 -- C: S� l�n n�p siro m�i ng�y
	 -- DD: S� l�n n�p qu�n d�ng m�i ng�y
	 -- E: Ph�n th��ng cu�i qu�n d�ng m�i ng�y
	 
-- ��i th��ng Th�i H� Huy�n C�nh (daily resset); Byte1: ��i trang s�c; Byte2: ��i ph�n th��ng;
TSK_THAIHU_DOITHUONG = 1794
-- 16/4 den 21/4
TSK_DOINGUYENLIEU = 2743  -- ABBB: A=>0/1: check nh�n th��ng cu�i; BBB=> s� l�n ��i nguy�n li�u
-- Task nh�n th��ng CNDSK
TSK_GIVE_AWARD_CNDSK = 2669
BIT_KARAOKE2011 = 1

-- Task ��i v�t ph�m event h�ng th�ng
--TSK_GIVE_EVENT_ITEM = 2430	--==> d�ng cho nhi�m v� VBonus 7/2014

-- Task ��ng k� Long H� Tranh H�ng
--TASK_DANGKY_BHTA9 = 2743			
-- TASK_LHTH = 2283 -- D�ng ��n h�t ng�y 2013-07-03
---- Task nh�n th��ng Bang Ch� Tinh Anh
--TSK_BANGCHUTINHANH = 2743 -- 1: �� nh�n; 0: ch�a nh�n

-- Task n�p tr�i c�y nh�n ch�n kh�
TSK_GETQIBYFRUIT = 2747 -- Byte 1: reset ng�y; Bit 9: nh�n th��ng n�p nhi�u tr�i c�y; Bit 10 ��n 30: n�p m�i lo�i tr�i c�y
--Task nhi�m v� l�m gi�u m�i ng�y (ko gi�i h�n th�i gian)						--Task support chuy�n sinh mi�n ph� �ng T� v� Ph�ng T�							-- Task VBonus: mua v�t ph�m gi�m gi� 
TSK_LAMGIAU = 2693																			--TSK_SUPPORT_CHUYENSINH = 2693													
-- VBonus: ��nh d�ng: ABCDmmdd; A, B, C, D: S� l��ng item �� mua theo t�ng lo�i; H�t h�n 01/8/2013
TSK_VBONUS_SaleOff = 2282
TSK_SUPPORT_CHUYENSINH = 2188
--Bit 1(N� oa), 2(Th�i h� huy�n c�nh), 3(T�ng ki�m), 4(L��ng S�n), 5(Th�y L�i), 6(H�t gi�ng), 7(B�t Nh� Nh�), 8(B�t Nh� L�n), 9(C�y T� Linh), 10(Nh�n M�n R�c L�a), 11(gh�p T�ng R��ng), 12(tr�ng th�i nh�n nhi�m v�), 13(trang th�i nh�n th��ng)
-- Chuy�n sinh
TRANSLIFE_MISSION_ID = 1537
TRANSLIFE_TASK_ID = 1538
TRANSLIFE_BYTE_COUNT = 1
TRANSLIFE_BYTE_FACTION = 2
TRANSLIFE_BYTE_FLAG_LEVEL = 3
TRANSLIFE_BYTE_SAVE_LEVEL = 4
--- Chuy�n sinh 5
-- 80 TMT , 45 LSB , 69 C�y T� Linh
TRANSLIFE_TASK_5_1 = 2677
-- N� Oa B�o H�p , ��nh d�u ti�u di�t L�nh H��ng L�ng
TRANSLIFE_TASK_5_2 = 2678

TRANSLIFE_TASK_34 = 2279 -- Nhi�m v� chuy�n sinh 3,4
-- ��nh d�u s� l�n ho�n th�nh theo h� s� 10
TRANSLIFE_TASK_34_FLAG = 2542
TRANSLIFE_BYTE_TASK1 = 1 -- T�i nguy�n chi�n
TRANSLIFE_BYTE_TASK2 = 2 -- H�t gi�ng
TRANSLIFE_BYTE_TASK3 = 3 -- B�t nh� nh�
TRANSLIFE_BYTE_TASK4 = 4 -- B�t nh� l�n

TSK_SETQC_NEWSERVER = 2158

TSK_SERVER_ID = 2280 -- ��nh danh Server ID cho role
TSK_SERVER_ID_CUR = 1
TSK_SERVER_ID_NEW = 2
TSK_SERVER_ID_JUNGONG = 3
TSK_SERVER_ID_TIME = 2281

-- Bang h�i tinh anh 
TSK_BHTA6_6E8 = 2665
TSK_BHTA6_2E8 = 2666
TSK_BHTA6_WEEKLYAWARD = 2667
TASK_BHTA6 = 2668
BYTE_BHTA6_GET_TALK = 1
BYTE_BHTA6_GET_TOP10 = 2
TASKID_JYBHZ_USE_HONGBAO = 2702
TASKID_JYBHZ_GET_HONGBAO = 2703

-- Task nh�n th��ng tr�ng C�y T� Linh
TSK_AWARD_4SOUL = 2183
TSK_AWARD_4SOUL_DATE = 2182

-- Task s� d�ng tr�i c�y
TSK_USEFRUIT_DATE = 2184
TSK_USEFRUIT_EXP = 2177
TSK_USEFRUIT_FLAG_1 = 2178
TSK_USEFRUIT_FLAG_2 = 2179
TSK_USEFRUIT_FLAG_3 = 2180
TSK_USEFRUIT_FLAG_4 = 2181

-- Task ��n b� qu�n c�ng
TSK_JUNGONG_PUNISH = 2152
TSK_JUNGONG_PUNISH_DATE = 2153
TSK_JUNGONG_LIMIT = 2155

-- Ng�i Sao May M�n
TSK_LUCKY_STAR_201011 = 2661

-- Tr�ng ng�u nhi�n
TSK_RANDOMIZE_EGG = 2172

-- Ph�o hoa CNDSK
FIREWORK_CNDSK_USE = 2493
FIREWORK_CNDSK_TIME = 2494

-- NV STD
KH_QUEST_TSK = 1533
FIREWORK_IDOL_USE = 2495
FIREWORK_IDOL_TIME = 2496

-- ��n b� qu�n c�ng
TSK_SET_QUANCONG = 2660

-- Valentine 2011
--TSK_VALENTINE_GET_FLAG_2011 = 2662
--TSK_VALENTINE_USE_FLAG_2011 = 2663
TSK_VALENTINE_USED_EXP_2011 = 2664
TRIGGER_USER_DEFINE_VALENTINE_2011 = 2517
TRIGGER_TB_DEFINE_VALENTINE_2011 = 1506

-- B�n ��ng H�nh
TASK_VNG_PET = 2560 -- 2 s� ��u l�u c�p c�a pet, c�c s� sau l�u �i�m n�ng c�p
TASK_VNG_PET_QUEST = 2561 -- C� ch�a ng�y th�ng �� reset task c�a pet
TASK_VNG_PET_TIME = 2562
TASK_VNG_PET_GODPOINT = 1535 -- 2 s� ��u l�u s� l�n ho�n th�nh nhi�m v� linh l�c, c�c s� sau l�u �i�m linh l�c
TASK_VNG_PET_INFO = 1536 -- L�u s� l�n nhi�m v� train pet,  l�u gi�i t�nh pet,  l�u lo�i pet
BYTE_PET_INFO_TRAIN = 1
BYTE_PET_INFO_SEX = 2
BYTE_PET_INFO_TYPE = 3
TASK_PET_TRAIN_TIME = 1541

TASK_ROSE_WAR = 2157

-- V� L�m B�o H�p
TSK_VLBH_EXP = 2744		--old: 2674
-- L�u th�ng reset  th�ng tu�n 
TSK_VLBH_MARK = 2745		--old: 2672
-- L�u th�i gian gi�n c�ch
TSK_VLBH_TIME = 2673
--L�u �i�m ch�n kh�
TSK_VLBH_QI = 2729
--L�u �i�m c�ng tr�ng
TSK_VLBH_QUANCONG = 2756
--S� l�n nh�n VLBH trong ng�y & tu�n
TSK_VLBH_Qty = 2730 -- ��nh d�ng: xxxyyy; xxx: s� l�n nh�n trong tu�n; yyy: s� l�n nh�n trong ng�y
-- L�u th�i gian gi�n c�ch 2
TSK_VLBH_TIME2 = 2732 

-- Ni�n th� T12/2010
TSK_NIENTHU20101201_TIME = 2175
TSK_NIENTHU20101201_INFO = 2176

-- B�n ��ng H�nh chi�n ��u
TASK_PET_FIGHT = 1542 -- S� ��u l�u k�t qu� tr�n ��u, c�c s� c�n l�i l�u index c� thi ��u

-- B�n ��ng H�nh v��t Th�i H�
TSK_PET_TAIXU_DATE = 2173  -- S� ��u ti�n ch�a tr�ng th�i pet trong Th�i H�, s� th� 2 ghi s� l�n tham gia mi�n ph�, s� th� 3 ghi s� l�n tham gia tr� ph�, 6 ch� s� ti�p theo ghi ng�y th�ng n�m tham gia
TSK_PET_TAIXU_POINT = 2174 -- S� th� 1 t�i th� 3 ch�a t�ng l�n nh�t,�� v��t qua, c�c s� c�n l�i ch�a �i�m v��t �i
TSK_PET_TAIXU_INFO = 2177
-- ��nh d�u 
TSK_THAIHU_DAY = 2706

-- Bo sung event thang 8/2010
--EVENT201009_GIVE_CAKE = 2430
--VET_201009_01_TASK_FLAG = 2429
--VET_201009_01_BIT_LIMIT = 1
--VET_201009_01_BIT_METHOD = 2
--VET_201009_01_BIT_METHOD_CONFIRM = 3
--VET_201009_01_BYTE_TYPE = 2
--VET_1000_THANGLONG_TIME = 2428

-- T�i Nguy�n Chi�n
TSK_TRANS_POINT_ALLOW = 2711 --l�u gi� tr� b�o l�u, ko cho ph�p tham gia chi�n tr��ng
TSK_NEWRES_CALC_DAILY = 2712 -- l�u gi� tr� �� ��nh gi� qu�n h�m �� tham gia TNC h�ng ng�y
TSK_GET_THUOC_TIME = 2663 --l�u gi� tr� reset ng�y c�a l�y thu�c v� kick ho�t x2
TSK_GET_THUOC = 2662 -- L�y s� cu�i l�u l�i vi�c �� nh�n thu�c
TSK_NEWRES_DATE = 2148 -- Th�i gian nh�n nhi�m v�
TSK_NEWRES_POINT = 2149 -- S� �i�m t�ch l�y ���c
TSK_NEWRES_FINISH = 2161 -- Flag ho�n th�nh nhi�m v�
BYTE_NEWRES_STATE = 1 -- Tr�ng th�i c�a nhi�m v� 0: ko c� nhi�m v�, 1: �� nh�n nhi�m v�, 2: �� ho�n th�nh nhi�m v�
BYTE_NEWRES_DONE = 2 -- S� l�n ho�n th�nh nhi�m v� trong ng�y
BYTE_NEWRES_DOUBLE_EXP = 3 -- S� l�n k�ch ho�t x2 exp trong ng�y, ch� d�nh cho Nguy�n So�i

TSK_GET_DHTN = 2164	--TSK_SONGLIAO_BET_1 = 2164 -- D� �o�n T�ng Li�u ��t 1
TSK_GIVE_DHTN = 2165	--TSK_SONGLIAO_BET_2 = 2165 -- D� �o�n T�ng Li�u ��t 2

TSK_GET_NEILI_EXP = 2166 -- B�c ��u Truy�n C�ng - nh�n
TSK_GIVE_NEILI_EXP = 2167 -- B�c ��u Truy�n C�ng - cho

TSK_GET_NEILI_EXP_SP = 2679 -- B�c ��u Truy�n C�ng ��c Bi�t - nh�n
TSK_GIVE_NEILI_EXP_SP = 2680 -- B�c ��u Truy�n C�ng ��c Bi�t - cho

TSK_PRATICE_NEILI_EXP_TYPE_1 = 2168 -- B�c ��u D��ng Sinh - lo�i 1
TSK_PRATICE_NEILI_EXP_TYPE_2 = 2169 -- B�c ��u D��ng Sinh - lo�i 2
TSK_PRATICE_NEILI_EXP_TYPE_3 = 2170 -- B�c ��u D��ng Sinh - lo�i 3
TSK_PRATICE_NEILI_EXP_TYPE_4 = 2171 -- B�c ��u D��ng Sinh - lo�i 4

TSK_PRATICE_NEILI_EXP_TYPE_1_SP = 2681 -- B�c ��u D��ng Sinh ��c Bi�t  - lo�i 1
TSK_PRATICE_NEILI_EXP_TYPE_2_SP = 2682 -- B�c ��u D��ng Sinh ��c Bi�t  - lo�i 2
TSK_PRATICE_NEILI_EXP_TYPE_3_SP = 2683 -- B�c ��u D��ng Sinh ��c Bi�t  - lo�i 3
TSK_PRATICE_NEILI_EXP_TYPE_4_SP = 2684 -- B�c ��u D��ng Sinh ��c Bi�t  - lo�i 4

TSK_GOLDEN_CARD_CREATE_TIME = 2185
TSK_MASTER_SKILL = 2186

TSK_BUY_GOLDEN_CARD = 2435

-- Task s� d�ng T�n M�o ��i H�ng Bao
TSK_DAHONGBAO_201101 = 2429
TSK_DAHONGBAO_201101_TIME = 2428

-- Task promotion CSM 5.0
TSK_AWARD_CSM5 = 2670
TSK_AWARD_CSM5_ACTIVE_TIME = 2671
-- Task Quay s� may m�n
TSK_LUCKY_DRAW = 2705

-- ��i qu�n c�ng huy ho�ng b�ng Ti�n L�
--TASK_LIMIT_JUNGONG = 2276


--TSK_SELECT_TYPE = 2148 -- Check t�ng bit xem �� d� �o�n k�t qu� n�o
--TSK_SILVER_WIN = 2149 -- S� Ti�n L� t�ch l�y ���c
--TSK_LIST_16_1 = 2161 -- List 16 ��i 1
--TSK_LIST_16_2 = 2162 -- List 16 ��i 2
--TSK_LIST_8_1 = 2163 -- List 8 ��i 1
--TSK_LIST_8_2 = 2164 -- List 8 ��i 1

-- Task ghi l�i s� ti�n �� c��c cho t�ng lo�i h�nh
--TSK_SILVER_BET_1 = 2165
--TSK_SILVER_BET_2 = 2166
--TSK_SILVER_BET_3 = 2167
--TSK_SILVER_BET_4 = 2168
--TSK_SILVER_BET_5 = 2169
--TSK_SILVER_BET_6 = 2170
--TSK_SILVER_BET_7 = 2171
--TSK_SILVER_BET_8 = 2172

-- Task ghi l�i ��i �� ch�n
--TSK_BET_01 = 2173
--TSK_BET_02 = 2174
--TSK_BET_03 = 2175
--TSK_BET_04 = 2176
--TSK_BET_05 = 2177
--TSK_BET_06 = 2178
--TSK_BET_07 = 2179
--TSK_BET_08 = 2180
--TSK_BET_09 = 2181
--TSK_BET_10 = 2182
--TSK_BET_11 = 2183
--TSK_BET_12 = 2184
--TSK_BET_13 = 2185
--TSK_BET_14 = 2186
--TSK_BET_15 = 2187

--TSK_SILVER_2_EXP = 2188

-- Vinh danh t��ng s�
TSK_GLORY = 2277
BYTE_GLORY_DATE =1 -- Ng�y nh�n th��ng
BYTE_GLORY_COUNT = 2 -- S� l�n nh�n th��ng

-- Th�nh Ch� ��i h�ng bao
--TSK_EXCHANGE_HONGBAO = 2278
--BYTE_EXCHANGE_HONGBAO_DATE = 1
--BYTE_EXCHANGE_HONGBAO_SMALL = 2
--BYTE_EXCHANGE_HONGBAO_BIG = 3

-- ��i ��nh H�n t�i D� Th�o
--TSK_EXCHANGE_DING7 = 2430

-------------------------------
-- S� l�n s� d�ng b� hoa chi�n th�ng trong ho�t ��ng karaoke
TSK_KARAOKE = 2665
-- Tasktemp l�u nType ng��i b�nh ���c b�nh ch�n
-- Task Temp l�u lev c�a item khi n�ng c�p T� quang Vi�m ��
TSK_TEMP_TQVD = 202
--TSK_KARAOKETEMP =202 

--S� l�n s� d�ng b�nh trung thu trong ho�t ��ng  B�nh ch�n s�ng t�c truy�n tranh
TSK_TRUYENTRANH = 2665

-- L�u tr�ng th�i k�ch ho�t HKLB c�a ng��i ch�i
TSK_HKLB_FLAG =  2431
BYTE_HKLB_STATUS = 1
BYTE_HKLB_LEVELAWARD = 2

--  Task nh�n th��ng h�ng ng�y
TSK_HKLB_DAILYAWARD =  2434

--  Task nh�n th��ng ng�y v�ng
--TSK_HKLB_GOLDENDAYAWARD = 2538

--  Task ��i item C�a h�ng V� L�m Ti�n B�i
TSK_HKLB_POINT = 1534
--TSK_HKLB_EXCHANGE = 2539
--TSK_HKLB_REWARD = 2540

-- Task k�ch ho�t V� L�m Chi�n H�u
TSK_HKLB_VLCH = 2187

-- Task l�u s� l�n m� r��ng trong t�n l�ng
--TSK_HKLB_OPENPBOX = 2671

--- Task s� l�n ��i kem trong ng�y Even th�ng 7 
TKS_KSOCOLA_TIMES = 2675
--  ��nh d�u reset �i�m qu�n c�ng khi chuy�n Server
TSK_CHANGE_SERVER = 2676

-- Task ��n b� ng�y 30-9-2011
--TSK_DENBU_20110930 = 2700
-- TSK_BKL_BONUS = 2700
-- Task ��n b� ng�y 30-9-2011 l�n 2
 --TSK_DENBU2_20110930 = 2701
TSK_TRAOGIAI_CS1_20120404 = 2701

-- Task tr�ng hoa
TSK_TRONGHOA = 2704
-- Task l�u ng�y v� s� l�n ��i m�t t�ch trong ng�y
--TSK_MATTICH_HIGHT = 2707
TSK_MATTICH_HIGHT_NEW = 2710
TSK_MATTICH_HIGHT_CHOOSE = 2708
TSK_XOAITEM = 2709

---------------------------------------------------------
-- L�u tr�ng th�i k�ch ho�t BKLB c�a ng��i ch�i
TSK_BKLB_FLAG =  2714
BYTE_BKLB_BOX = 1
BYTE_BKLB_LEVELAWARD = 2

--  Task nh�n th��ng h�ng ng�y
TSK_BKLB_DAILYAWARD =  2715

--  Task nh�n th��ng ng�y v�ng
TSK_BKLB_GOLDENDAYAWARD = 2716

--  Task ��i item C�a h�ng V� L�m Ti�n B�i
TSK_BKLB_POINT = 2717
TSK_BKLB_EXCHANGE = 2718
TSK_BKLB_REWARD = 2719

-- Task k�ch ho�t V� L�m Chi�n H�u
TSK_BKLB_VLCH = 2721
-- Task kick ho�t BKLB + task count
TSK_BKLB_ACTIVE = 2722
TSK_BKLB_COUNT = 2723
TSK_BKLB_START = 2724
--Task xoa trung task HKLB
--TSK_BKLB_HAVETASK = 2725
-- Task ��i �i�m ch�n kh� h�ng ng�y
TSK_CHANGE_CHANKHI = 2726
-- Task ��nh d�u �� n�p N� Oa khi l�m nhi�m v� Th��ng H�i
TSK_CHECK_BAOHAP = 2735
--Task l�u gi� tr� reset ng�y c�a B�nh Thi�n H�
TSK_RESET_DATE = 2736
--Task l�u gi� tr� nh�n item c�a B�nh Thi�n H�
TSK_BTH_EXCHANGE = 2737
--Task l�u gi� tr� nh�n th��ng T�ng Li�u
TSK_TL_AWARD = 2741
TSK_TL_DATE = 2742
--Task reset m�i ng�y
TSK_EVERY_DATE = 2738
--Task l�u gi� tr� kick ho�t VIP c�a Th� N��ng + Ph�o Hoa
--TSK_LUCKY_DAOHUU_NEW_THANG4 = 2739		--TSK_ACTIVE_VIP_THONUONG = 2739
TSK_NHIEMVUTHANG4 = 2740		 --TSK_ACTIVE_VIP_PHAOHOA = 2740
TSK_COUNT_EVERYDAY = 2746
--Chu�i nhi�m v� Chuy�n Sinh ��n
TSK_CSD_COUNT_A = 2753		--300 nv s� m�n (x) - 30 l�n th�i h� (y) - 81 t�i nguy�n chi�n (z) - 30 l�n L��ng S�n (w)		- wwzzyyxxx
TSK_CSD_COUNT_B = 2749		--300 h�t gi�ng (x) - 33 l�n Tr� An (y) - 33 l�n Th�y l�i (z)			- zzyyxxx
TSK_CSD_COUNT_C = 2750		--181 B�t nh� nh� (x) - 99 b�t nh� to (y) - 99 c�y t� linh (z)		- zzyyxxx
TSK_CSD_ALLOW = 2751
TSK_CSD = 2752	--��nh d�u �� nh�n item csd
--Chu�i nhi�m v� M�nh Thi�n Th�ch
TSK_MTT_COUNT = 2754		--150 h�t gi�ng (x) - 10 C�ng T� (y)	- 10 l�n Th�y L�i (z) - 1 nh�n nhi�m v� (w)- 1 nh�n th��ng (b)	- bwzzyyxxx
TSK_EVERY_WEEK = 2755	--2 s� cu�i l�u s� tu�n
--Chu�i nhi�m v� Chuy�n Sinh 6
TSK_CS6_COUNTA = 2757	--30 C�ng t� (x) - 30 Tr� An (y) - 150 B�t nh� nh� (z) - 150 H�t gi�ng (w)		- wwwzzzyyxx
TSK_CS6_COUNTB = 2758	--30 Th�y l�i (x) - 30 Luy�n ��n (y) - 150 T� Linh (z) - 160 Ng�i Sao May M�n (w)		- wwwzzzyyxx
TSK_CS6_COUNTC = 2759	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)		- zzyyxx
TSK_CS6_GET1TIME = 2685		--nh�n item 1 l�n duy nh�t sau khi chuy�n sinh -- 3s� cu�i, 4 s� ti�p ghi s� N� oa
TSK_CS6_TULINH = 2687		--nh�n v� l�m ti�p nhi�m v� chuy�n sinh 6
TSK_CS6_DaoQuy_XoaQuy = 2688	--AAAABBBB:  AAAA: s� l��ng Ti�u Lam �ao Qu�; BBBB: s� l��ng Ti�u Lam Xoa Qu�
TSK_CS6_SaMac_TamBao = 2692	-- AAAABBBB: AAAA: s� l��ng Sa M�c H�nh Nh�n; BBBB: s� l��ng T�m B�o Nh�n
TSK_CS6_KiemTien_DichTien = 2690	-- AAAABBBB: AAAA: s� l��ng Ki�m Ti�n T�; BBBB: s� l��ng ��ch Ti�n T�
TSK_CS6_LiLong_HoaHo = 2691	-- AAAABBBB: AAAA: s� l��ng Li�t Nhan Li Long; BBBB: s� l��ng X�ch Luy�n H�a H�
---------------------------------------------------------
-- L�u tr�ng th�i �i�m may m�n c�a ng��i ch�i
TSK_EVENT_PHU_MOI_THANG =  2698
TSK_LUCKY_DAOHUU_NEW_THANG4 = 2739	
BYTE_POINT_LUCKY = 1
BYTE_ACCEPT_LUCKY = 2
BYTE_TIME_VM =3
-----------------------------------------------------------
TSK_PET_PS_GIAIDOAN_A = 2538	--xxxFFFcddg: x = 160 c�y t� linh, F = 160 c�y b�t nh� nh�, c = h��ng Ph�c Sinh, dd = s� l�n ph�c sinh, g = .....
TSK_PET_PS_GIAIDOAN_B = 2539	--aabbccddeg: g = (1,2,3) chu�i nhi�m v�), e = x�c ��nh c� PET Ph�c Sinh, dd = 30 l�n C�ng T�, cc = 30 l�n Tr� An, bb = 30 l�n Th�y L�i, aa = 3 l�n luy�n ��n
---------------------------------------------------------
EXT_POINT_CLTV = 5	--Ch� T�n V��ng L�nh
TSK_CTVL_START = 2664  --khai b�o Task
TSK_CTVL_ALL = 2665		--khai b�o task: 0987654321: 1:k�ch ho�t CTVL;	2: �� x�y d�ng bang trong tu�n	3: �� nh�n th��ng BHCT trong tu�n		4: nh�n th��ng t� ��i trong ng�y		65: check lev nh�n th��ng PS0 	7: nh�n trang b� HN	8: kich ho�t Bang h�i Ch� T�n		9: nh�n th��ng PS1 90	0: nh�n th��ng PS2 75
--TSK_CTVL_COUNT = 2666	--0987654321: 		321: b� ��m b��c nhi�m v�	4: tr�ng th�i ho�n th�nh nhi�m v�		65: l�u ID nhi�m v� m�i ng�y �ang th�c hi�n	7: s� l�n ho�n th�nh nhi�m v� trong ng�y		8: tr�ng th�i nh�n th� th�ch		9: nh�n th��ng m�i ng�y c�a old server
--------------------
--TSK_DUNGCHUNG = 2733
TSK_CUOCCHIENHOAHONG = 2733	--Task cu�c chi�n hoa h�ng (08/10/2014-12/10/2014)
TSK_DUATOPSERVERCANHAN = 2733 --Task �ua top bang h�i li�n server (Byte 1)(21/10/2014 - 19/11/2014)
TSK_DENBU_HOAPHUNG = 2733	-- Task ��n b� server H�a Ph�ng (byte 3 v� 4) (24/10/2014 - 5/12/2014)
TSK_NHIEMVUCDKEY = 2540 --Task nh�n th��ng m�i ng�y nhi�m v� PVP CD KEY (Byte 1)
TSK_DUDOAN_BHTA12 = 2540 -- Task d� �o�n BHTA12 (05/11/2014 - 08/11/2014) (Byte 2, 3)
-------------------
--TSK_NOEL_DIEUDUONG = 2725	--event Noel ��i di�u d��ng
------------------
--TSK_GIAPNGO_1 = 2725	--event ��o r��ng gi�p ng�: H: nh�n th��ng k�ch ho�t CDPB, gggg: s� l�n k�ch ho�t Chi�u D� Ph�p B�o, Y: nh�n th��ng k�ch ho�t TABB, xxxx: s� l�n k�ch ho�t Tuy�t Anh B� B�o
TSK_GIAPNGO_2 = 2666	-- E: nh�n th��ng cu�i khi �� nh�n th��ng 3 lo�i tr�n; H: nh�n th��ng k�ch ho�t XTCV, gggg: s� l�n k�ch ho�t xich Th� C� V�t
--===========Th�ng Ti�n Ph�c Sinh ======
TSK_THANGTIEN_PHUCSINH = 2725	--0987654321: 1:nh�n nv-ho�n th�nh nv; 32:t�ng �i�m t�ch l�y; 54:�i�m ��i trong ng�y; 6:s� l�n tham gia Th�i H�; 7: s� l�n tham gia th� n��ng; 8: s� l�n tham gia T�ng Li�u; 9: x�c ��nh reset qua ng�y
--=========== T�ch l�y online ==========
IP_ONLINE_TIME = 2536
IP_TIME_START = 2537
--=================================
--========= TAI XUAT GIANG HO =======
if nDate >= 140221 and nDate <= 140320 then
	TSK_TAIXUAT_FLAG = 2162
	TSK_TAIXUAT_MISSION1 = 2163
	TSK_TAIXUAT_MISSION2 = 2666
else
	TSK_TAIXUAT_FLAG = 2665
	TSK_TAIXUAT_MISSION1 = 2665
	TSK_TAIXUAT_MISSION2 = 2665
end
--================ 123 Pay ==========
TSK_123PAY1 = 2664
TSK_123PAY2 = 2675
--================= Nhi�m v� ��i trang b� Thi�n Chi - B�ch Kim Vi�m �� ==============
TSK_TC_BK_VD = 2707		--0987654321: 1-nh�n nv vd2tcvd; 2-nh�n nv tcvd2bkvd
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
--================= nhi�m v� VBonus 7/2014
TSK_nvVBonus = 2430		--==> d�ng cho nhi�m v� VBonus 7/2014
-- funtion reset task t�i playerloginin.lua
function ResetTask()	
	local tTask ={}
	if tonumber(date("%y%m%d%H")) >= 10070200 then
		if GetTask(2437) <= 11 then
			tTask = {
							2428,2429,2430,2431,2436,2538,2539,2540,2542,2545,1533,1534,1535,1536,1541,1542,
							2157,2158,2159,2160,2276,2279,
						}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,13)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10071400 then
		if GetTask(2437) == 13 then
			tTask = {2164,2165}	
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,14)
		end
	end
	if tonumber(date("%y%m%d%H")) >= 10080100 then
		if GetTask(2437) == 14 then
			tTask = {2166,2167}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,15)
		end
	end
	if tonumber(date("%y%m%d%H")) >= 10080500 then
		if GetTask(2437) == 15 then
			tTask = {2493,2494}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,16)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10080600 then
		if GetTask(2437) == 16 then
			tTask = {2168,2169}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,17)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10081500 then
		if GetTask(2437) == 17 then
			tTask = {2495,2496, 2595, 2596}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,18)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10082700 then
		if GetTask(2437) <= 19 then
			tTask = {2170,2171,2186,2187}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,20)
		end
	end
--	Reset �i�m tr�ng c�y	
	if tonumber(date("%y%m%d%H")) >= 10090600 then
		tTask = {2255,2275}
		if GetTask(2437) <= 20 then
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,21)
		end
	end

--	Reset task idol s� d�ng cho STD
	if tonumber(date("%y%m%d%H")) >= 10090900 then
	if GetTask(2437) <= 21 then
			tTask = {1533}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,22)
		end
	end	
	
	if tonumber(date("%y%m%d%H")) >= 10091700 then		
		if GetTask(2437) <= 22 then
			tTask = {2434}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,23)
		end
	end
--	Reset task t�ng b�nh
	if tonumber(date("%y%m%d%H")) >= 10092200 then		
		if GetTask(2437) <= 23 then
			tTask = {2430}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,24)
		end
	end
-- Reset task mua code HKLB
	if tonumber(date("%y%m%d%H")) >= 10092800 then		
		if GetTask(2437) <= 24 then
			tTask = {2435}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,25)
		end
	end	
-- Reset task �n B�nh N��ng Vu�ng (event T10/2010)
	if tonumber(date("%y%m%d%H")) >= 10100900 then		
		if GetTask(2437) <= 25 then
			tTask = {2607}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,26)
		end
	end	
	-- Reset pet level 2
	if tonumber(date("%y%m%d%H")) >= 10100900 then		
		if GetTask(2437) <= 26 then
			tTask = {1535,1536,1541,1542}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,27)
		end
	end
	-- Reset cu�c chi�n hoa h�ng tu�n 1
	if tonumber(date("%y%m%d%H")) >= 10101500 then		
		if GetTask(2437) <= 27 then
			tTask = {2157}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,28)
		end
	end	
	-- Reset task ch�nh qu�n c�ng Huy �ng
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 28 then
			tTask = {2158}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,29)
		end
	end	
	-- Reset cu�c chi�n hoa h�ng tu�n 2 
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 29 then
			tTask = {2157}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,30)
		end
	end	
	-- Th�i gian t�o acc HKLB
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 30 then
			tTask = {2185}
			for k,v in tTask do
				SetTask(v,0)				
			end	
			if GetExtPoint(0) >= 1 then
				if GetCreateTime() < 1287968400 then
					SetTask(2185,GetCreateTime())
				end
			end
			SetTask(2437,31)
		end
	end	
	-- Reset task s� d�ng cho BHTA4
	if tonumber(date("%y%m%d%H")) >= 10102500 then		
		if GetTask(2437) <= 31 then
			tTask = {2538,2428,2429}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,32)
		end
	end
	-- Reset cu�c chi�n hoa h�ng tu�n 3
	if tonumber(date("%y%m%d%H")) >= 10102900 then		
		if GetTask(2437) <= 32 then
			tTask = {2157}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,33)
		end
	end	
	-- Th�i gian t�o acc HKLB
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 33 then
			tTask = {2185}
			for k,v in tTask do
				SetTask(v,0)				
			end	
			if GetExtPoint(0) >= 1 then
				if GetCreateTime() < 12880710000 then
					SetTask(2185,GetCreateTime())
				end
			end
			SetTask(2437,34)
		end
	end
	-- Task s� d�ng Ng�i Sao May M�n
	if tonumber(date("%y%m%d%H")) >= 10110900 then		
		if GetTask(2437) <= 34 then
			tTask = {2160, 2172}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,35)
		end
	end
	-- Reset task chuy�n sinh 3  
	if tonumber(date("%y%m%d%H")) >= 10102900 then		
		if GetTask(2437) <= 35 then
			tTask = {2279}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,36)
		end
	end
	
	-- Reset task BHTA4 �� s� d�ng cho V� L�m B�o H�p, l�y task 2539 d�ng cho quay s� m�ng sn VL2
	if tonumber(date("%y%m%d%H")) >= 10112900 then		
		if GetTask(2437) <= 36 then
			tTask = {2538, 2539}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,37)
		end
	end
	
	-- Reset task s� d�ng Ni�n Th� con
	if tonumber(date("%y%m%d%H")) >= 10113000 then		
		if GetTask(2437) <= 37 then
			tTask = {2175, 2176}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,38)
		end
	end
	
	-- Reset task s� d�ng cho B�n ��ng H�nh v��t Th�i H�
	if tonumber(date("%y%m%d%H")) >= 10113000 then		
		if GetTask(2437) <= 38 then
			tTask = {2173, 2174, 2177}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,39)
		end
	end
	
	-- Reset task s� d�ng cho reset qu�n c�ng
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 39 then
			tTask = {2184}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,40)
		end
	end
	
	-- Reset task s� d�ng cho nh�n th��ng C�y T� Linh
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 40 then
			tTask = {2182, 2183}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,41)
		end
	end
	
	-- Reset task s� d�ng cho t�nh n�ng Tr�i C�y
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 41 then
			tTask = {2184, 2177, 2178, 2179, 2180, 2181}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,42)
		end
	end
	-- Reset task s� d�ng cho n�p C�i Kh�
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 42 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,43)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11011300 then		
		if GetTask(2437) <= 43 then
			tTask = {2428, 2429, 2430, 2158}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,44)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11011300 then		
		if GetTask(2437) <= 44 then
			tTask = {2660}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,45)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11011500 then		
		if GetTask(2437) <= 45 then
			tTask = {2661}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,46)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11012000 then		
		if GetTask(2437) <= 46 then
			tTask = {2662, 2663, 2664}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,47)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11031700 then		
		if GetTask(2437) <= 47 then
			tTask = {2665, 2666}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,48)
		end
	end
	
	-- reset task nh�n th��ng hoa h�ng BHTA5 tu�n 1
	if tonumber(date("%y%m%d%H")) >= 11032700 then		
		if GetTask(2437) <= 48 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,49)
		end
	end
	
	-- reset task nh�n th��ng hoa h�ng BHTA5 tu�n  2
	if tonumber(date("%y%m%d%H")) >= 11040400 then		
		if GetTask(2437) <= 49 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,50)
		end
	end

	-- reset task nh�n th��ng hoa h�ng BHTA5 tu�n  3
	if tonumber(date("%y%m%d%H")) >= 11041100 then		
		if GetTask(2437) <= 50 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,51)
		end
	end
	
	-- reset task s� d�ng nh�n th��ng BHTA5
	if tonumber(date("%y%m%d%H")) >= 11041400 then		
		if GetTask(2437) <= 51 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,52)
		end
	end
	
	-- reset task s� d�ng nh�n th��ng BHTA5
	if tonumber(date("%y%m%d%H")) >= 11041500 then		
		if GetTask(2437) <= 52 then
			tTask = {2669, 2670}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,53)
		end
	end
	
	-- Reset task s� d�ng cho Chuy�n Sinh 4
	if tonumber(date("%y%m%d%H")) >= 11041800 then		
		if GetTask(2437) <= 53 then
			tTask = {2542}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,54)
		end
	end

	--Reset Task Karaoke
	if tonumber(date("%y%m%d%H")) >= 11052200 then		
		if GetTask(2437) <= 54 then
			tTask = {2665}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,55)
		end
	end
	
	-- Reset Task s� d�ng cho HKLB v3
	if tonumber(date("%y%m%d%H")) >= 11053000 then		
		if GetTask(2437) <= 55 then
			tTask = {2538, 2434, 2431, 1534, 2539, 2540, 2187}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,56)
		end
	end	
	
	-- Reset Task s� d�ng cho sell HKLB v3 in-game
	if tonumber(date("%y%m%d%H")) >= 11053000 then		
		if GetTask(2437) <= 56 then
			tTask = {2435}
			for k,v in tTask do
				SetTask(v,0)
			end
			-- Reset ch� l�u string HKLB
			CustomDataSave("code_hklb","s","")
			SetTask(2437,57)
		end
	end
	
	-- Reset Task s� d�ng cho CSM5.0
	if tonumber(date("%y%m%d%H")) >= 11062800 then		
		if GetTask(2437) <= 57 then
			tTask = {2670, 2671}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,58)
		end
	end
	
	-- Reset task qu�n c�ng new server
	if tonumber(date("%y%m%d%H")) >= 11070100 then		
		if GetTask(2437) <= 58 then
			tTask = {2158}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,59)
		end
	end
	
	-- Task n�p Socola thang 7/2011
	if tonumber(date("%y%m%d%H")) >= 11072200 then		
		if GetTask(2437) <= 60 then
			tTask = {2675}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,61)
		end
	end
	
	-- S� d�ng l�u server hi�n h�nh �� ��nh d�u chuy�n server - Quang �ng
	if tonumber(date("%y%m%d%H")) >= 11072200 then
		if GetTask(2437) <= 61 then
			tTask = {2676}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,62)
		end
	end
	
	-- S� d�ng l�u server hi�n h�nh �� ��nh d�u chuy�n server - Duy Long
	if tonumber(date("%y%m%d%H")) >= 11080500 then
		if GetTask(2437) <= 62 then
			tTask = {2676}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,63)
		end
	end
	
	-- Task Ph�o Hoa
	if tonumber(date("%y%m%d%H")) >= 11082000 then
		if GetTask(2437) <= 63 then
			tTask = {2429,2428}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,64)
		end
	end
	--Reset Task V� L�m B�o h�p
	if tonumber(date("%y%m%d%H")) >= 11090600 then
		if GetTask(2437) <= 64 then
			tTask = {2672,2673,2674}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,65)
		end
	end
	-- Reset task B�nh ch�n s�ng t�c truy�n tranh
	if tonumber(date("%y%m%d%H")) >= 11090600 then
		if GetTask(2437) <= 65 then
			tTask = {2665}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,66)
		end
	end
	-- Reset VLTB c�a h�ng
	if tonumber(date("%y%m%d%H")) >= 11091200 then
		if GetTask(2437) <= 66 then
			tTask = {2539}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,67)
		end
	end
	
	--Reset Task Cu�c chi�n hoa h�ng
	if tonumber(date("%y%m%d%H")) >= 11093000 then
		if GetTask(2437) <= 67 then
			tTask = {2665,2666,2667,2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,68)
		end
	end
	
	---- Reset task nh�n th��ng BHTA6 tu�n
	if tonumber(date("%y%m%d%H")) >= 11101200 then
		if GetTask(2437) <= 68 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,69)
		end
	end
	
	---- Reset task nh�n th��ng BHTA6 tu�n 2, reset ��n b� Qu�n c�ng 30-9-2011
	if tonumber(date("%y%m%d%H")) >= 11101900 then
		if GetTask(2437) <= 69 then
			tTask = {2667, 2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,70)
		end
	end	
	
	---- Reset task ��n b� Qu�n c�ng 30-9-2011 l�n 2
	if tonumber(date("%y%m%d%H")) >= 11102000 then
		if GetTask(2437) <= 70 then
			tTask = {2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,71)
		end
	end	
	
	---- Reset nh�n th��ng BHTA6 tu�n 2,, ��ng k� thi ��u
	if tonumber(date("%y%m%d%H")) >= 11102700 then
		if GetTask(2437) <= 71 then
			tTask = {2667, 2668, 2702, 2703}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,72)
		end
	end
	
	---- Reset task quay s� may m�n
	if tonumber(date("%y%m%d%H")) >= 11103000 then
		if GetTask(2437) <= 72 then
			tTask = {2705, 2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,73)
		end
	end
	
	---- Reset task tr�ng hoa nh�n bonus t� ��i
	if tonumber(date("%y%m%d%H")) >= 11110900 then
		if GetTask(2437) <= 73 then
			tTask = {2704, 2677, 2678}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,74)
		end
	end
	
	---- Reset task ��n b� c�ng tr�ng
	if tonumber(date("%y%m%d%H")) >= 11111900 then
		if GetTask(2437) <= 74 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,75)
		end
	end
	
	---- Reset task update
	if tonumber(date("%y%m%d%H")) >= 11120200 then
		if GetTask(2437) <= 75 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,76)
		end
	end
	-- Reset ng�y , S� l�n �i Th�i H�
	if tonumber(date("%y%m%d%H")) >= 11120200 then
		if GetTask(2437) <= 76 then
			tTask = {2706}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,77)
		end
	end
	
	-- Reset task s� d�ng cho Truy�n C�ng & D��ng Sinh ��c Bi�t
	if tonumber(date("%y%m%d%H")) >= 11122900 then
		if GetTask(2437) <= 77 then
			tTask = {2679, 2680, 2681, 2682, 2683, 2684}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,78)
		end
	end
	
	--- Reset �i�m t�ch l�y  B�t Nh� Ch�ng Th�
	if tonumber(date("%y%m%d%H")) >= 12010600 then
		if GetTask(2437) <= 78 then
			tTask = {2255,2275}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,79)
		end
	end
	
	-- Reset Task nh�n th��ng server Th�nh Long
	
	if tonumber(date("%y%m%d%H")) >= 12020200 then
		if GetTask(2437) <= 79 then
			tTask = {2276}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,80)
		end
	end
	-- Reset Quay s� Ingame
	if tonumber(date("%y%m%d%H")) >= 12020600 then
		if GetTask(2437) <= 80 then
			tTask = {2705}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,81)
		end
	end
	-- Reset S� l�n nh�n m�t t�ch trong ng�y
	if tonumber(date("%y%m%d%H")) >= 12021600 then
		if GetTask(2437) <= 82 then
			tTask = {2707}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,83)
		end
	end
	-- Reset S� l�n nh�n m�t t�ch t� ch�n trong ng�y
	if tonumber(date("%y%m%d%H")) >= 12022000 then
		if GetTask(2437) <= 83 then
			tTask = {2708,2709}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,84)
		end
	end
	-- Reset task ��n b� qu�n c�ng ng�y 01/03/2012
	if tonumber(date("%y%m%d%H")) >= 12030100 then
		if GetTask(2437) <= 84 then
			tTask = {2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,85)
		end
	end
	-- Reset task ��i m�t t�ch
	if tonumber(date("%y%m%d%H")) >= 12030100 then
		if GetTask(2437) <= 85 then
			tTask = {2710}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,86)
		end
	end
		-- Reset nh�n thu�c trong t�i nguy�n chi�n
	if tonumber(date("%y%m%d%H")) >= 12030400 then
		if GetTask(2437) <= 86 then
			tTask = {2662, 2663}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,87)
		end
	end
		-- Reset nh�n thu�c trong t�i nguy�n chi�n
	if tonumber(date("%y%m%d%H")) >= 12030800 then
		if GetTask(2437) <= 87 then
			tTask = {2711,2712}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,88)
		end
	end	
	-- Reset task cho tham gia chien truong
	if tonumber(date("%y%m%d%H")) >= 12030800 then
		if GetTask(2437) <= 88 then
			tTask = {2711,2712}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,89)
		end
	end	
	-- Reset task B�ch Kim l�nh
	if tonumber(date("%y%m%d%H")) >= 12032100 then
		if GetTask(2437) <= 89 then
			tTask = {2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721, 2722, 2723, 2724, 2665, 2666, 2667, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,90)
		end
	end
	-- Reset task trao gi�i CS1 c�a server Th�nh Long
	if tonumber(date("%y%m%d%H")) >= 12040400 then
		if GetTask(2437) <= 90 then
			tTask = {2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,91)
		end
	end
	-- Reset task BONUS B�ch kim l�nh
	if tonumber(date("%y%m%d%H")) >= 12040700 then
		if GetTask(2437) <= 91 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,92)
		end
	end
	-- Reset task nh�n Thanh Phong Bao
	if tonumber(date("%y%m%d%H")) >= 12040900 then
		if GetTask(2437) <= 92 then
			tTask = {2703, 2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,93)
		end
	end
	-- Reset task ��i �i�m ch�n kh� h�ng ng�y
	if tonumber(date("%y%m%d%H")) >= 12041600 then
		if GetTask(2437) <= 93 then
			tTask = {2726}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,94)
		end
	end
	-- Reset task ��i �i�m ch�n kh� h�ng ng�y
	if tonumber(date("%y%m%d%H")) >= 12060500 then
		if GetTask(2437) <= 94 then
			tTask = {2741, 2742}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,95)
		end
	end	
	-- Reset task kick hoat VIP Th� n��ng, Ph�o hoa
	if tonumber(date("%y%m%d%H")) >= 12060600 then
		if GetTask(2437) <= 95 then
			tTask = {2738, 2739, 2740}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,96)
		end
	end	
	
	-- Reset task Trai cay 3 mien
	if tonumber(date("%y%m%d%H")) >= 12061500 then
		if GetTask(2437) <= 96 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,97)
		end
	end	
	
	-- Reset task VLBH ver 3 + m� r�ng event
	if tonumber(date("%y%m%d%H")) >= 12061900 then
		if GetTask(2437) <= 97 then
			tTask = {2674, 2672, 2673, 2729, 2730, 2732, 2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,98)
		end
	end	
	-- Reset task��i �i�m ch�n kh� � B�c ��u l�o nh�n
	if tonumber(date("%y%m%d%H")) >= 12062700 then
		if GetTask(2437) <= 98 then
			tTask = {2728}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,99)
		end
	end	
	-- Thay ��i task VLBH m�i
	if tonumber(date("%y%m%d%H")) >= 12070500 then
		if GetTask(2437) <= 99 then
			tTask = {2744, 2745}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,100)
		end
	end		
	-- Reset task nhan th��ng ch�n kh� VLBH
	if tonumber(date("%y%m%d%H")) >= 12071700 then
		if GetTask(2437) <= 100 then
			tTask = {2729}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,101)
		end
	end			
	-- Reset task nh�n th��ng ch�n kh�, Exp, VLBH
	if tonumber(date("%y%m%d%H")) >= 12072500 then
		if GetTask(2437) <= 101 then
			tTask = {2744, 2745, 2729}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,102)
		end
	end	
	-- Reset task m� r�ng event th�ng 7 v� trao gi�i
	if tonumber(date("%y%m%d%H")) >= 12072700 then
		if GetTask(2437) <= 102 then
			tTask = {2743, 2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,103)
		end
	end	
	-- Reset task nh�n th��ng m�i ng�y ? bao nhi�u c�i / l�n
	if tonumber(date("%y%m%d%H")) >= 12073100 then
		if GetTask(2437) <= 103 then
			tTask = {2746}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,104)
		end
	end	
	-- Reset task d�ng ��ng k� thi ��u Long H� Tranh H�ng
	if tonumber(date("%y%m%d%H")) >= 12081000 then
		if GetTask(2437) <= 104 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,105)
		end
	end	
	-- Reset task ��n b� 800k c�ng tr�ng
	if tonumber(date("%y%m%d%H")) >= 12081000 then
		if GetTask(2437) <= 105 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,106)
		end
	end	
		-- Reset task quay s� may m�n
	if tonumber(date("%y%m%d%H")) >= 12082300 then
		if GetTask(2437) <= 106 then
			tTask = {2705}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,107)
		end
	end	
	-- Reset task nh�n th��ng LHTH
	if tonumber(date("%y%m%d%H")) >= 12091900 then
		if GetTask(2437) <= 107 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,108)
		end
	end	
	-- Reset task chu�i nhi�m v� Chuy�n sinh ��n
	if tonumber(date("%y%m%d%H")) >= 12092000 then
		if GetTask(2437) <= 108 then
			tTask = {2753, 2749, 2750, 2751, 2752}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,109)
		end
	end	
	-- Reset task ��i th��ng LHTH
	if tonumber(date("%y%m%d%H")) >= 12091900 then
		if GetTask(2437) <= 109 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,110)
		end
	end	
	-- Reset task chu�i nhi�m v� M�nh Thi�n Th�ch
	if tonumber(date("%y%m%d%H")) >= 12100900 then
		if GetTask(2437) <= 110 then
			tTask = {2754, 2755}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,111)
		end
	end	
	-- Reset task Event thang 10
	if tonumber(date("%y%m%d%H")) >= 12101800 then
		if GetTask(2437) <= 111 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,112)
		end
	end	
	-- Reset Task BHTA8 ��t 1
	if tonumber(date("%y%m%d%H")) >= 12102600 then
		if GetTask(2437) <= 112 then
			tTask = {2703, 2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,113)
		end
	end
	-- Reset Task BHTA8 ��t 2
	if tonumber(date("%y%m%d%H")) >= 12102900 then
		if GetTask(2437) <= 113 then
			tTask = {2703, 2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,114)
		end
	end
	-- Reset Task Chuyen sinh 6
	if tonumber(date("%y%m%d%H")) >= 12110900 then
		if GetTask(2437) <= 114 then
			tTask = {2757, 2758, 2759, 2685, 2687}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,115)
		end
	end
		-- Reset Task Chuyen sinh 6 lan 2
	if tonumber(date("%y%m%d%H")) >= 12111600 then
		if GetTask(2437) <= 115 then
			tTask = {2688, 2690, 2691, 2692}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,116)
		end
	end
		-- Reset Task nh�n th��ng max event m�c 10k th�ng 11
	if tonumber(date("%y%m%d%H")) >= 12112800 then
		if GetTask(2437) <= 116 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,117)
		end
	end		
		-- Reset Task B�ch Kim L�nh version 2
	if tonumber(date("%y%m%d%H")) >= 12113000 then
		if GetTask(2437) <= 117 then
			tTask = {2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,118)
		end
	end
	-- Reset Task VBonus version 2
	if tonumber(date("%y%m%d%H")) >= 12120500 then
		if GetTask(2437) <= 118 then
			tTask = {2255, 2275, 2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,119)
		end
	end
	-- Reset TaskV�n may ��o h�u
	if tonumber(date("%y%m%d%H")) >= 12120600 then
		if GetTask(2437) <= 119 then
			tTask = {2698}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,120)
		end
	end	
	-- Reset Task ��i th��ng VLTB
	if tonumber(date("%y%m%d%H")) >= 12121300 then
		if GetTask(2437) <= 120 then
			tTask = {2718}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,121)
		end
	end	
		-- Reset Task nh�n th��ng max event m�c 5k th�ng 12
	if tonumber(date("%y%m%d%H")) >= 12123100 then
		if GetTask(2437) <= 121 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,122)
		end
	end		
	-- Reset Task nh�n th��ng max event m�c 6k, 10k th�ng 1
	if tonumber(date("%y%m%d%H")) >= 13013100 then
		if GetTask(2437) <= 122 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,123)
		end
	end	
	-- Reset Task nh�n th��ng max event m�c 4k, 6k, 10k th�ng 3
	if tonumber(date("%y%m%d%H")) >= 13031500 then
		if GetTask(2437) <= 123 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,124)
		end
	end		
	-- Reset Task nh�n chuy�n sinh mi�n ph� sang ph�ng t�, �ng t�
	if tonumber(date("%y%m%d%H")) >= 13031500 then
		if GetTask(2437) <= 124 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,125)
		end
	end		
	-- Reset Task nh�n chuy�n sinh mi�n ph� sang ph�ng t�, �ng t� l�n 2
	if tonumber(date("%y%m%d%H")) >= 13031900 then
		if GetTask(2437) <= 125 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,126)
		end
	end			
	-- Reset Task nh�n chuy�n sinh mi�n ph� sang ph�ng t�, �ng t� l�n 3
	if tonumber(date("%y%m%d%H")) >= 13040200 then
		if GetTask(2437) <= 126 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,127)
		end
	end		
	-- Reset Task nh�n nhi�m v� thang 4
	if tonumber(date("%y%m%d%H")) >= 13040900 then
		if GetTask(2437) <= 127 then
			tTask = {2740, 2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,128)
		end
	end		
	-- Reset Task di hoa tiep ngoc
	if tonumber(date("%y%m%d%H")) >= 13041000 then
		if GetTask(2437) <= 128 then
			tTask = {2164, 2165}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,129)
		end
	end	
	-- Reset Task ��ng k� BHTA9
	if tonumber(date("%y%m%d%H")) >= 13041100 then
		if GetTask(2437) <= 129 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,130)
		end
	end		
	-- Reset Task ��i nguy�n li�u th�ng 4
	if tonumber(date("%y%m%d%H")) >= 13041600 then
		if GetTask(2437) <= 130 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,131)
		end
	end						
-- Reset Task nh�n th��ng max event th�ng 4 n�m 2013
	if tonumber(date("%y%m%d%H")) >= 13041800 then
		if GetTask(2437) <= 131 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,132)
		end
	end			
-- Reset Task cho BHTA9
	if tonumber(date("%y%m%d%H")) >= 13042600 then
		if GetTask(2437) <= 132 then
			tTask = {2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,133)
		end
	end
-- Reset Task event �ng h� bi�n ��o, task nh�n Thanh Phong Bao BHTA l�n 9
	if tonumber(date("%y%m%d%H")) >= 13042700 then
		if GetTask(2437) <= 133 then
			tTask = {2698, 2703}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,134)
		end
	end
-- Reset Task ��i nguy�n li�u th�ng 5
	if tonumber(date("%y%m%d%H")) >= 13051200 then
		if GetTask(2437) <= 134 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,135)
		end
	end	
-- Reset Task thay ��i h��ng chuy�n sinh mi�n ph�
	if tonumber(date("%y%m%d%H")) >= 13051200 then
		if GetTask(2437) <= 135 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,136)
		end
	end		
-- Reset Task thu mua qu�n d�ng, m� r�ng event th�ng 5
	if tonumber(date("%y%m%d%H")) >= 13052800 then
		if GetTask(2437) <= 136 then
			tTask = {2187}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,137)
		end
	end		
-- Reset Task VBonus
	if tonumber(date("%y%m%d%H")) >= 13052800 then
		if GetTask(2437) <= 137 then
			tTask = {2282}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,138)
		end
	end		
-- Reset Task m� r�ng event th�ng 5
	if tonumber(date("%y%m%d%H")) >= 13062700 then
		if GetTask(2437) <= 138 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,139)
		end
	end	
-- Reset Task Long Tranh H� ��u
	if tonumber(date("%y%m%d%H")) >= 13070300 then
		if GetTask(2437) <= 139 then
			tTask = {2283}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,140)
		end
	end	
-- Reset Task nh�n h� tr� qu�n c�ng, update x2,x3 khi thu th�p t�i nguy�n chi�n
	if tonumber(date("%y%m%d%H")) >= 13070400 then
		if GetTask(2437) <= 140 then
			tTask = {2284,2285}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,141)
		end
	end		
-- Reset Task nhi�m v� ��ng H�nh
	if tonumber(date("%y%m%d%H")) >= 13071800 then
		if GetTask(2437) <= 141 then
			tTask = {2283,2189}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,142)
		end
	end	
-- Reset Task s� d�ng th�m n� oa b�o h�p
	if tonumber(date("%y%m%d%H")) >= 13072600 then
		if GetTask(2437) <= 142 then
			tTask = {2156}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,143)
		end
	end		
-- Reset Task s� d�ng c�c lo�i c�y tr�ng
	if tonumber(date("%y%m%d%H")) >= 13072700 then
		if GetTask(2437) <= 143 then
			tTask = {2651, 429, 2059}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,144)
		end
	end	
-- Reset Task m� r�ng event
	if tonumber(date("%y%m%d%H")) >= 13080100 then
		if GetTask(2437) <= 144 then
			tTask = {2731, 2713}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,145)
		end
	end
-- Reset task Sinh t� v� ng�
	if tonumber(date("%y%m%d%H")) >= 13080800 then
		if GetTask(2437) <= 145 then
			tTask = {2700, 2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,146)
		end
	end
	-- Reset task Ph�c Sinh PET
	if tonumber(date("%y%m%d%H")) >= 13090200 then
		if GetTask(2437) <= 146 then
			tTask = {2538, 2539}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,147)
		end
	end
	-- Reset task m� r�ng event th�ng 8
	if tonumber(date("%y%m%d%H")) >= 13091000 then
		if GetTask(2437) <= 147 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,148)
		end
	end	
	-- Reset task 2731 (th��ng d�ng m� r�ng event) d�ng cho nh�n th� mi�n ph� t� 18/9 - 20/9
	if tonumber(date("%y%m%d%H")) >= 13091700 then
		if GetTask(2437) <= 148 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,149)
		end
	end	
	-- Reset task event �ua top Kim X�, task 2668 BHTA
	if tonumber(date("%y%m%d%H")) >= 13092400 then
		if GetTask(2437) <= 149 then
			tTask = {2540, 2545, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,150)
		end
	end		
	-- Reset task 2731 �� s� d�ng m� r�ng event
	if tonumber(date("%y%m%d%H")) >= 13092400 then
		if GetTask(2437) <= 150 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,151)
		end
	end
	-- Reset task �ua top kim x� li�n server
	if tonumber(date("%y%m%d%H")) >= 13101000 then
		if GetTask(2437) <= 151 then
			tTask = {2660,2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,152)
		end
	end
-- Reset task Ch� T�n V��ng L�nh, Phuc Sinh 2
	if tonumber(date("%y%m%d%H")) >= 13101800 then
		if GetTask(2437) <= 152 then
			tTask = {2664,2665, 2666, 2667,2668,2669,2175,2176}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,153)
		end
	end	
-- Reset task Nh�n th��ng �ua top kim x� li�n server
	if tonumber(date("%y%m%d%H")) >= 13101800 then
		if GetTask(2437) <= 153 then
			tTask = {2660}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,154)
		end
	end
-- Reset task Nh�n th��ng �ua top kim x� li�n server
	if tonumber(date("%y%m%d%H")) >= 13103000 then
		if GetTask(2437) <= 154 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,155)
		end
	end	
-- Reset task m� r�ng event th�ng 10
	if tonumber(date("%y%m%d%H")) >= 13103000 then
		if GetTask(2437) <= 155 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,156)
		end
	end	
	-- Reset Task L�i H� L�nh 
	if tonumber(date("%y%m%d%H")) >= 13112200 then
		if GetTask(2437) <= 156 then
			tTask = {2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,157)
		end
	end	
	-- Reset Task Noel ��i di�u d��ng
	if tonumber(date("%y%m%d%H")) >= 14010200 then
		if GetTask(2437) <= 157 then
			tTask = {2725}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,158)
		end
	end	
	-- Reset Task Noel ��i di�u d��ng
	if tonumber(date("%y%m%d%H")) >= 14011000 then
		if GetTask(2437) <= 158 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,159)
		end
	end	
	-- Reset Task ��o r��ng gi�p ng�
	if tonumber(date("%y%m%d%H")) >= 14012000 then
		if GetTask(2437) <= 159 then
			tTask = {2725, 2666}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,160)
		end
	end	
	-- Reset Task x�a Khu�t Nguy�n B�i
	if tonumber(date("%y%m%d%H")) >= 14021300 then
		if GetTask(2437) <= 159 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,160)
		end
	end	
	-- Reset Task T�i xu�t giang h�
	if tonumber(date("%y%m%d%H")) >= 14022100 then
		if GetTask(2437) <= 160 then
			tTask = {2162,2163,2666}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,161)
		end
	end
	-- Reset Task 123Pay
	if tonumber(date("%y%m%d%H")) >= 14030100 then
		if GetTask(2437) <= 161 then
			tTask = {2664, 2675}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,162)
		end
	end
		-- Reset Task BHTA 11
	if tonumber(date("%y%m%d%H")) >= 14030100 then
		if GetTask(2437) <= 162 then
			tTask = {2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,163)
		end
	end
	-- Reset Task event thang 3
	if tonumber(date("%y%m%d%H")) >= 14042100 then
		if GetTask(2437) <= 163 then
			tTask = {3059 }
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,164)
		end
	end
	------------------
	-- Reset Task Sinh Tu Vo Nga
	if tonumber(date("%y%m%d%H")) >= 14051900 then
		if GetTask(2437) <= 164 then
			tTask = {2700, 2701, 2713}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,165)
		end
	end
	-- Reset Task nhi�m v� ��i trang b� Thi�n Chi - B�ch Kim vi�m ��
	if tonumber(date("%y%m%d%H")) >= 14061700 then
		if GetTask(2437) <= 165 then
			tTask = {2707}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,166)
		end
	end	
	-- Reset Task nhi�m v� VBonus 7/2014
	if tonumber(date("%y%m%d%H")) >= 14071000 then
		if GetTask(2437) <= 166 then
			tTask = {2430}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,167)
		end
	end	
	-- Reset Task nhi�m v� Th�ng Ti�n Ph�c Sinh
	if tonumber(date("%y%m%d%H")) >= 14090900 then
		if GetTask(2437) <= 167 then
			tTask = {2725}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,168)
		end
	end		
	-- Reset Task cu�c chi�n hoa h�ng
	if tonumber(date("%y%m%d%H")) >= 14100700 then
		if GetTask(2437) <= 168 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,169)
		end
	end		
	-- Reset Task BHTA 12
	if tonumber(date("%y%m%d%H")) >= 14102000 then
		if GetTask(2437) <= 169 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,170)
		end
	end		
	-- Reset Task �ua Top bang h�i li�n server
	if tonumber(date("%y%m%d%H")) >= 14102100 then
		if GetTask(2437) <= 170 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,171)
		end
	end			
	-- Reset Task Nh�n th��ng nhi�m v� PVP CDKEY
	if tonumber(date("%y%m%d%H")) >= 14102700 then
		if GetTask(2437) <= 171 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,172)
		end
	end			
	------------------
end

-----------------------------
function DelEventItem()
	local nDate = tonumber(date("%y%m%d%H"))
	if GetTask(2436) == 0 then
		BigDelItem(2,1,30039,BigGetItemCount(2,1,30039))
		SetTask(2436,1)
	end
	if nDate >= 10102500 then
		if GetTask(2436) <= 1 then
			BigDelItem(2,1,30219,BigGetItemCount(2,1,30219))
			SetTask(2436,2)
		end
	end
	if nDate >= 10102500 then
		if GetTask(2436) <= 2 then
			BigDelItem(2,1,2639,BigGetItemCount(2,1,2639))
			SetTask(2436,3)
		end
	end
	if nDate >= 10102900 then
		if GetTask(2436) <= 3 then
			BigDelItem(2,1,30221,BigGetItemCount(2,1,30221))
			SetTask(2436,4)
		end
	end
	if nDate >= 10102900 then
		if GetTask(2436) <= 4 then
			BigDelItem(0,108,514 + GetBody() - 1,BigGetItemCount(0,108,514 + GetBody() - 1))
			BigDelItem(0,109,514 + GetBody() - 1,BigGetItemCount(0,109,514 + GetBody() - 1))
			BigDelItem(0,110,514 + GetBody() - 1,BigGetItemCount(0,110,514 + GetBody() - 1))
			SetTask(2436,5)
		end
	end
	if nDate >= 11021400 then
		if GetTask(2436) <= 5 then
			BigDelItem(2,0,361,BigGetItemCount(2,0,361))
			SetTask(2436,6)
		end
	end
end

--------------------------------------------
--Date : 09/11/2011
-- Add By : PhucBDB
------------------------------------------------------

function GetBitExt(nTask,nBitStart,nBitEnd)
	if (nBitStart > nBitEnd ) or ( nBitStart <1 ) or (nBitEnd > 32) then
		return 0;
	end;

	local Value = 0;
	local iBit = 1 ;
	local iTask = GetTask(nTask);

	for i = nBitStart,nBitEnd do
		Value = SetBit(Value, iBit,GetBit(iTask,i));
		iBit = iBit + 1;
	end;
	return Value;
end;

function SetBitExt(nTask,Value,nBitStart,nBitEnd)
	if (nBitStart > nBitEnd) or (nBitStart < 1 ) or (nBitEnd > 32)then
		return 0;
	end;

	local iBit =1 ;
	for i = nBitStart,nBitEnd do
		SetTask(nTask,SetBit(GetTask(nTask),i,GetBit(Value,iBit)));
		iBit = iBit +1;
	end;

end;

function GetByteExt( nTask,nByteStart,nByteEnd)
	if (nByteStart > nByteEnd)  or ( nByteStart < 1 ) or (nByteEnd > 4) then
		return 0;
	end;
	local iByte =1;
	local iTask_Value = GetTask(nTask);
	local Value = 0;

	for i=nByteStart,nByteEnd do	
		Value = SetByte(Value,iByte,GetByte(iTask_Value,i));
		iByte = iByte + 1;
	end;	
	return Value;
end;

function SetByteExt(nTask,Value,nByteStart,nByteEnd)	
	if (nByteStart > nByteEnd) or ( nByteStart <1) or (nByteEnd > 4) then
		return 0;
	end;
	
	local iByte = 1 ;
	for i = nByteStart,nByteEnd do
		SetTask(nTask,SetByte(GetTask(nTask),i,GetByte(Value,iByte)));
		iByte = iByte + 1 ;
	end;	
end;

-- Khoang thoi gian Event
function VietCheckEventDate()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120113 and nDate <=120205   then
		return 1
	end
	return 0
end

--RESET m�i ng�y
function VietResetDate()
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = GetTask(TSK_EVERY_DATE)
	if nDate ~= nCurdate then
		SetTask(TSK_EVERY_DATE, nDate)
--		SetTask(TSK_ACTIVE_VIP_THONUONG, 0)
--		SetTask(TSK_ACTIVE_VIP_PHAOHOA, 0)
		SetTask(TSK_COUNT_EVERYDAY,0)
--		gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_BOX, 1)
		--SetTask(TSK_LUCKY_DAOHUU,0)	
--		SetTask(TSK_LUCKY_DAOHUU_NEW_THANG4,0)	
		SetTask(TSK_LAMGIAU,0)
		SetTask(TSK_THAIHU_DOITHUONG,0)
		SetTask(TSK_THUQUANDUNG, floor(GetTask(TSK_THUQUANDUNG)/1000) * 1000)
--		KF_Daily_Reset() --reset tham gia chi�n tr��ng li�n server
		gf_SetTaskByte(TSK_DONGHANH, 3, 0)
		gf_SetTaskBit(TSK_DONGHANH, 25, 0, 0)
		gf_SetTaskBit(TSK_DONGHANH, 26, 0, 0)
		gf_SetTaskByte(TSK_DONGHANH_COUNT, 1, 0)
		SetTask(TSK_THAIHU_DAY,0)
		if nDate <= 141130 then	-- Dua top cong hien bang server Vo Dang Son + Duong Gia Tuong
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)
			gf_SetTaskBit(2669, 8, 0,0)
		end
		SetTask(TSK_PHUCSINH2_COUNT,0)
--		SetTask(TSK_CTVL_COUNT,0)	--task nhi�m v� m�i ng�y c�a Ch� T�n V��ng L�nh
--		VNG_SetTaskPos(TSK_CTVL_ALL, 0, 4, 4) --CTVL 4: nh�n th��ng t� ��i trong ng�y
--		VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 0, 6, 6)	--event noel nh�n di�u d��ng 3/1/2014 - 16/1/2014
--		VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 0, 4, 4)	
--		VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 0, 5, 5)	
		if nDate <= 20140406 then
			gf_SetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG, 1, 0,0)
		end
		-- ========== Sinh tu vo nga 2 =============
		VNG_SetTaskPos(TSK_SINHTUVONGA3, 0, 6, 2) -- Reset nhiem vu hang ngay
		VNG_SetTaskPos(TSK_SINHTUVONGA1, 1, 9, 9)
		-- ========== Th�ng Ti�n Ph�c Sinh =============
--		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 0, 8, 4) -- Reset �i�m h�ng ng�y
		
		-- =====================================
		SetTask(TSK_123PAY1,0)
		SetTask(TSK_123PAY2,0)
		
		--==========Reset Cuoc Chien Hoa Hong =======
		if nDate <= 20141012 then
			SetTask(TSK_CUOCCHIENHOAHONG,0)
		end
		
		if nDate <= 20141119 then
			gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,1,0)
		end
		
		--Reset ��n b� server H�a Ph�ng
		if nDate <= 20141205 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,0)
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,0)
		end
		
		--Reset Nh�n th��ng nhi�m v� PVP CDKEY
		gf_SetTaskByte(TSK_NHIEMVUCDKEY,1,0)
	end	
	
	local nWeek = tonumber(date("%W"))
	local nCurWeek = mod(GetTask(TSK_EVERY_WEEK),100)
	local nRemain = floor(GetTask(TSK_EVERY_WEEK)/100)
	if nCurWeek ~= nWeek then
		nRemain = nRemain * 100
		SetTask(TSK_EVERY_WEEK,nRemain + nWeek)
		SetTask(TSK_MTT_COUNT,0)
--		VNG_SetTaskPos(TSK_CTVL_ALL, 00, 3, 2) --CTVL 2: �� x�y d�ng bang trong tu�n	3: �� nh�n th��ng BHCT trong tu�n
--		VNG_SetTaskPos(TSK_CTVL_ALL, 0, 8, 8)	--CTVL 8: kich ho�t Bang h�i Ch� T�n
	end
end