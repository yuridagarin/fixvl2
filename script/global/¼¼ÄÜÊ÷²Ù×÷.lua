--ǰ�Ἴ���ж�
function Calfroskill(id)
	if (HaveLearnedSkill(id)==1) then	--�Ѿ�ѧ����ǰ����
   		return 1	--����ǰ�Ἴ������
	elseif  (SKILLS[id]["levelless"][2] == 0)  then	--û��ǰ�Ἴ��
		return 1	--����ǰ�Ἴ������
	elseif	(SKILLS[id]["levelless"][3] == 0)  then	--ǰ�Ἴ�ܣ����ϵ��
			for var=1, 2 * (SKILLS[id]["levelless"][2]), 2  do
				if (GetSkillLevel(SKILLS[id]["levelless"][3 + var]) >= SKILLS[id]["levelless"][4 + var]) then
					return 1	--����ǰ�Ἴ������
				end
			end
	elseif	(SKILLS[id]["levelless"][3] == 1)  then	--ǰ�Ἴ�ܣ����ϵ��
			for var=1, 2 * (SKILLS[id]["levelless"][2]), 2  do
				if (GetSkillLevel(SKILLS[id]["levelless"][3 + var]) < SKILLS[id]["levelless"][4 + var]) then
					return 0	--������ǰ�Ἴ������
				end
			end
			return 1
	else 
	       return 0	--������ǰ�Ἴ������
   	end
end;

--��ȡѧϰ������Ҫ�ľ���
function get_learn_need_exp(id)
	local skillLevel = GetSkillLevel(id)
	if not skillLevel then
		return 2100000000
	end
	local needExp = SKILLS[id][1][3]
	if SKILLS[id][2] then
		needExp = floor(needExp + (skillLevel - 1) * skillLevel * SKILLS[id][2][3] / 2)
	end
	return needExp
end

--�����ж�
function canlearnskill(id)
  local skillLevel = GetSkillLevel(id)
  if skillLevel==nil	then
  	return 0
  end
  if (GetLevel() >= LinearValue(skillLevel + 1, 2, SKILLS[id]["levelless"][1], SKILLS[id])) then	-- �����ҵȼ�
	local needExp = get_learn_need_exp(id)
	if (GetExp() >= needExp)  then	--��龭��ֵ
		if (GetReputation() >= LinearValue(skillLevel + 1, 4, SKILLS[id]["levelless"][1], SKILLS[id])) then	--�������
			i = Calfroskill(id)	--���ǰ�Ἴ��
		 	if (i == 1) then
		 		if (GetCash() >= (needExp / 20)) then	--����Ǯ
		 			return 1	--����ѧ
		 		else
		 			return 6	--��Ǯ����
		 		end
		 	else
				return 5	--ǰ�Ἴ��ûѧ��
			end
		else
				return 4	--��������
		end
	else
				return 3	--����ֵ����
	end
  else
	return 2	--�ȼ�����
  end
end;

--ѧϰ������ѯ��
function learnskill(id)
	local skillLevel = GetSkillLevel(id)
	if (skillLevel == nil) then
		return
	end

	if (skillLevel >= SKILLS[id][SKILLS[id]["levelless"][1]][1]) then
		return
	end

	local needExp = get_learn_need_exp(id)
	
	local needRep = 0
	local needRepBefore = LinearValue(skillLevel + 1, 4, SKILLS[id]["levelless"][1], SKILLS[id])
	if (needRepBefore ~= nil) then
		needRep = floor(needRepBefore)
	end

	local tipbeforelearn = beforelearnskill(id)
	if (type(tipbeforelearn) == "string") then
		tipbeforelearn = tipbeforelearn.."<enter>"
	else
		tipbeforelearn = ""
	end

	if (HaveLearnedSkill(id) == 0) then
		Say(tipbeforelearn.."H�c v� c�ng n�y c�n "..needRep.." �i�m danh v�ng v� "..needExp.." �i�m kinh nghi�m!"..floor(needExp/20).." ��ng, x�c ��nh ch�?",2,"��ng �/yeslearn","B� qua/no")
	else
		Say(tipbeforelearn.."H�c v� c�ng n�y c�n "..needRep.." �i�m danh v�ng v� "..needExp.." �i�m kinh nghi�m!"..floor(needExp/20).." ��ng, x�c ��nh ch�?",2,"��ng �/yeslearn","B� qua/no")
	end
end

--ѧϰ������ִ��
function yeslearn()
	id = GetLearningSkill()
	if (id == nil) then
		return
	end
	
	n = canlearnskill(id)
 	if (n==0) then
 		 return
 	end	
	if (n==1) then 
		skillLevel = GetSkillLevel(id)
		if (skillLevel == nil) then
			return
		end
		
		needExp = get_learn_need_exp(id)
		ModifyExp(-needExp)	--�۳�����
 		Pay(floor(needExp/20))	--�۳���Ǯ
 
		if (HaveLearnedSkill(id)) == 0 then
 			LearnSkill(id)		--ѧ�Ἴ��
  		else
  			LevelUpSkill(id)	--��������
		end

		afterlearnskill(id)

	end
	showlimit(n)	--������Ϣ�����

end;

function no()
end;