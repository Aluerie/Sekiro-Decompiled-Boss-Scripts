RegisterTableGoal(GOAL_Kensei_543000_Battle, "GOAL_Kensei_543000_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Kensei_543000_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
end

Goal.Activate = function (self, ai, goal)
    Init_Pseudo_Global(ai, goal)
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local paramDoAdmire = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local staminaRatioSelf = ai:GetSpRate(TARGET_SELF)
    local f2_local7 = ai:GetNinsatsuNum()
    local random = ai:GetRandam_Int(1, 100)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5031)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5032)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5033)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5034)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5035)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5036)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5037)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5038)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5039)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 3540040)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110111)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110112)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110113)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110114)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110010)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110450)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110620)
    Set_ConsecutiveGuardCount_Interrupt(ai)
    if self.Kengeki_Activate(self, ai, goal) then
        return
    end
    if ai:HasSpecialEffectId(TARGET_ENE_0, 110060) or ai:HasSpecialEffectId(TARGET_ENE_0, 110010) then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) then
            probabilities[21] = 1
            probabilities[28] = 100
        else
            probabilities[21] = 100
        end
    elseif Common_ActivateAct(ai, goal, 0, 1) then
    elseif f2_local7 <= 1 and ai:GetNumber(11) == 0 then
        probabilities[42] = 100
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) then
        if distanceEnemy <= 3.2 - ai:GetMapHitRadius(TARGET_SELF) then
            probabilities[11] = 100
            probabilities[22] = 50
            probabilities[21] = 50
        else
            probabilities[21] = 100
            probabilities[22] = 100
        end
    elseif ai:IsFinishTimer(7) == false and distanceEnemy <= 5 then
        probabilities[31] = 100
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 90) then
        if distanceEnemy <= 4 - ai:GetMapHitRadius(TARGET_SELF) and distanceEnemy >= 1.5 then
            probabilities[16] = 100
            probabilities[21] = 50
            probabilities[22] = 50
        elseif distanceEnemy <= 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 4 then
            probabilities[21] = 100
            probabilities[22] = 100
            if ai:GetNumber(11) == 1 then
                probabilities[47] = 200
            end
        else
            probabilities[21] = 100
            probabilities[22] = 100
        end
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
        if distanceEnemy <= 4.5 - ai:GetMapHitRadius(TARGET_SELF) and distanceEnemy >= 1.5 then
            probabilities[21] = 1
            probabilities[22] = 50
        elseif distanceEnemy <= 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 5 then
            probabilities[21] = 1
            probabilities[22] = 100
            if ai:GetNumber(11) == 1 then
                probabilities[47] = 200
            end
        else
            probabilities[21] = 1
            probabilities[22] = 100
        end
    elseif distanceEnemy >= 9 then
        probabilities[29] = 100
    elseif distanceEnemy >= 8 then
        probabilities[1] = 1
        probabilities[4] = 1
        probabilities[7] = 100
    elseif distanceEnemy >= 5 then
        probabilities[1] = 1
        probabilities[2] = 100
        probabilities[7] = 100
        probabilities[23] = 10
        probabilities[41] = 200
        if ai:GetNumber(11) == 1 then
            probabilities[42] = 100
            probabilities[44] = 100
        end
    elseif distanceEnemy > 3 then
        probabilities[1] = 100
        probabilities[4] = 100
        probabilities[6] = 100
        probabilities[23] = 10
        probabilities[41] = 300
        if staminaRatioSelf <= 0.8 then
            probabilities[10] = 100
        end
        if ai:GetNumber(11) == 1 then
            probabilities[42] = 100
            probabilities[44] = 300
            probabilities[45] = 300
        end
        if ai:HasSpecialEffectId(TARGET_ENE_0, 110621) then
            probabilities[6] = 400
        end
    else
        probabilities[1] = 100
        probabilities[4] = 50
        probabilities[6] = 60
        if staminaRatioSelf <= 0.8 then
            probabilities[10] = 100
        end
        if ai:GetNumber(11) == 1 then
            probabilities[44] = 300
            probabilities[45] = 300
        end
        if ai:HasSpecialEffectId(TARGET_ENE_0, 110621) then
            probabilities[6] = 400
        end
    end
    ai:SetNumber(NUMBER_SLOT_AFTER_SIDEWAY_RUN_FLAG, 0)
    if ai:HasSpecialEffectId(TARGET_ENE_0, 109900) then
        probabilities[7] = 300
        probabilities[2] = 0
        probabilities[41] = 0
    end
    if ai:GetNumber(1) == 1 then
        probabilities[23] = 100000
    end
    if SpaceCheck(ai, goal, 45, 2) == false and SpaceCheck(ai, goal, -45, 2) == false then
        probabilities[22] = 0
    end
    if SpaceCheck(ai, goal, 90, 1) == false and SpaceCheck(ai, goal, -90, 1) == false then
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 180, 2) == false then
        probabilities[24] = 0
    end
    if SpaceCheck(ai, goal, 180, 1) == false then
        probabilities[25] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 15, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3006, 15, probabilities[2], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3007, 15, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3037, 15, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3083, 15, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3007, 8, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3004, 15, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3029, 15, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3027, 8, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3004, 15, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3013, 15, probabilities[10], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3071, 15, probabilities[10], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3029, 15, probabilities[12], 1)
    probabilities[13] = SetCoolTime(ai, goal, 3005, 15, probabilities[13], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3044, 120, probabilities[14], 1)
    probabilities[15] = SetCoolTime(ai, goal, 3045, 120, probabilities[15], 1)
    probabilities[16] = SetCoolTime(ai, goal, 3000, 15, probabilities[16], 1)
    probabilities[23] = SetCoolTime(ai, goal, 405002, 15, probabilities[23], 1)
    probabilities[23] = SetCoolTime(ai, goal, 405003, 15, probabilities[23], 1)
    probabilities[31] = SetCoolTime(ai, goal, 405012, 20, probabilities[31], 1)
    probabilities[32] = SetCoolTime(ai, goal, 405013, 30, probabilities[32], 1)
    probabilities[41] = SetCoolTime(ai, goal, 3104, 45, probabilities[41], 1)
    probabilities[42] = SetCoolTime(ai, goal, 3032, 30, probabilities[42], 1)
    probabilities[44] = SetCoolTime(ai, goal, 3035, 15, probabilities[44], 1)
    probabilities[45] = SetCoolTime(ai, goal, 3030, 30, probabilities[45], 1)
    probabilities[46] = SetCoolTime(ai, goal, 3050, 10, probabilities[46], 1)
    probabilities[48] = SetCoolTime(ai, goal, 3078, 10, probabilities[48], 1)
    probabilities[49] = SetCoolTime(ai, goal, 3080, 20, probabilities[49], 0)
    acts[1] = REGIST_FUNC(ai, goal, self.Act01)
    acts[2] = REGIST_FUNC(ai, goal, self.Act02)
    acts[3] = REGIST_FUNC(ai, goal, self.Act03)
    acts[4] = REGIST_FUNC(ai, goal, self.Act04)
    acts[5] = REGIST_FUNC(ai, goal, self.Act05)
    acts[6] = REGIST_FUNC(ai, goal, self.Act06)
    acts[7] = REGIST_FUNC(ai, goal, self.Act07)
    acts[8] = REGIST_FUNC(ai, goal, self.Act08)
    acts[9] = REGIST_FUNC(ai, goal, self.Act09)
    acts[10] = REGIST_FUNC(ai, goal, self.Act10)
    acts[11] = REGIST_FUNC(ai, goal, self.Act11)
    acts[12] = REGIST_FUNC(ai, goal, self.Act12)
    acts[13] = REGIST_FUNC(ai, goal, self.Act13)
    acts[14] = REGIST_FUNC(ai, goal, self.Act14)
    acts[15] = REGIST_FUNC(ai, goal, self.Act15)
    acts[16] = REGIST_FUNC(ai, goal, self.Act16)
    acts[17] = REGIST_FUNC(ai, goal, self.Act17)
    acts[18] = REGIST_FUNC(ai, goal, self.Act18)
    acts[19] = REGIST_FUNC(ai, goal, self.Act19)
    acts[20] = REGIST_FUNC(ai, goal, self.Act20)
    acts[21] = REGIST_FUNC(ai, goal, self.Act21)
    acts[22] = REGIST_FUNC(ai, goal, self.Act22)
    acts[23] = REGIST_FUNC(ai, goal, self.Act23)
    acts[24] = REGIST_FUNC(ai, goal, self.Act24)
    acts[25] = REGIST_FUNC(ai, goal, self.Act25)
    acts[26] = REGIST_FUNC(ai, goal, self.Act26)
    acts[27] = REGIST_FUNC(ai, goal, self.Act27)
    acts[28] = REGIST_FUNC(ai, goal, self.Act28)
    acts[29] = REGIST_FUNC(ai, goal, self.Act29)
    acts[30] = REGIST_FUNC(ai, goal, self.Act30)
    acts[31] = REGIST_FUNC(ai, goal, self.Act31)
    acts[39] = REGIST_FUNC(ai, goal, self.Act39)
    acts[41] = REGIST_FUNC(ai, goal, self.Act41)
    acts[42] = REGIST_FUNC(ai, goal, self.Act42)
    acts[43] = REGIST_FUNC(ai, goal, self.Act43)
    acts[44] = REGIST_FUNC(ai, goal, self.Act44)
    acts[45] = REGIST_FUNC(ai, goal, self.Act45)
    acts[46] = REGIST_FUNC(ai, goal, self.Act46)
    acts[47] = REGIST_FUNC(ai, goal, self.Act47)
    acts[48] = REGIST_FUNC(ai, goal, self.Act48)
    acts[49] = REGIST_FUNC(ai, goal, self.Act49)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Act01 = function (ai, goal, paramTbl)
    local stopDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 3.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, successDist_2, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(3, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local stopDist = 8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 8 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 8 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetTimer(2, 30)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local stopDist = 5.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 5.2 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 5.2 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF)
    local f5_local9 = 3.8 - ai:GetMapHitRadius(TARGET_SELF)
    local upAngleThreshold = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if ai:GetNumber(11) == 1 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3030, TARGET_ENE_0, 9999, 0, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3031, TARGET_ENE_0, 9999, upAngleThreshold, turnFaceAngle, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3037, TARGET_ENE_0, successDist, upAngleThreshold, turnFaceAngle, 0, 0)
    end
    ai:SetNumber(3, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local stopDist = 2.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2.6 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 2.6 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3083, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3041, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(3, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act05 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 0.5, 3007, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
end

Goal.Act06 = function (ai, goal, paramTbl)
    local stopDist = 3.7 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.7 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 3.7 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3004, TARGET_ENE_0, 8, 0, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    ai:SetNumber(3, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    local stopDist = 10.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 10.5 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 10.5 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 4
    local runLife = 4
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 3.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3029, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    if random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3016, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, successDist_2, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 9999, 0, 0)
    end
    ai:SetNumber(3, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    local stopDist = 9 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 9 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 9 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 4
    local runLife = 4
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local distanceEnemy_2 = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local goalLife = 10
    local guardStateId = -1
    local random_2 = ai:GetRandam_Int(30, 60)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, 0, 45, false, true, guardStateId)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3028, TARGET_ENE_0, 4.4, TurnTime, FrontAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act09 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3009, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3044, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local stopDist = 3.9 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.9 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 3.9 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 3 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 2 - ai:GetMapHitRadius(TARGET_SELF)
    local f12_local10 = 3 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3013, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, successDist_2, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(3, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act11 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3076, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act12 = function (ai, goal, paramTbl)
    local stopDist = 10.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 10.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 10.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 4
    local runLife = 4
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF)
    local f14_local9 = 3.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3029, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3016, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(3, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act13 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3027, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3028, TARGET_ENE_0, 4.4, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(NUMBER_SLOT_AFTER_SIDEWAY_RUN_FLAG, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act14 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3044, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3045, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3047, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act15 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3045, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3047, TARGET_ENE_0, 4.4, TurnTime, FrontAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act16 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3025, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act17 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3026, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act18 = function (ai, goal, paramTbl)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act19 = function (ai, goal, paramTbl)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act20 = function (ai, goal, paramTbl)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act21 = function (ai, goal, paramTbl)
    local goalLife = 3
    local stopAngleWidth = 45
    goal:AddSubGoal(GOAL_COMMON_Turn, goalLife, TARGET_ENE_0, stopAngleWidth, -1, GOAL_RESULT_Success, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act22 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local f24_local2 = -1
    local f24_local3 = 0
    if SpaceCheck(ai, goal, -135, 1) == true then
        if SpaceCheck(ai, goal, 135, 1) == true then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                f24_local3 = 0
            else
                f24_local3 = 1
            end
        else
            f24_local3 = 0
        end
    elseif SpaceCheck(ai, goal, 90, 1) == true then
        f24_local3 = 1
    else
    end
    local f24_local4 = 1.8
    local random = ai:GetRandam_Int(30, 45)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5202 + f24_local3, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
    ai:SetNumber(1, 1)
    return GETWELLSPACE_ODDS
end

Goal.Act23 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaRatioSelf = ai:GetSpRate(TARGET_SELF)
    local f25_local2 = 20
    local random = ai:GetRandam_Int(1, 100)
    local guardStateId = -1
    local right = 0
    if SpaceCheck(ai, goal, -90, 1) == true then
        if SpaceCheck(ai, goal, 90, 1) == true then
            if ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_R, 180, 999) then
                right = 1
            else
                right = 0
            end
        else
            right = 0
        end
    elseif SpaceCheck(ai, goal, 90, 1) == true then
        right = 1
    else
    end
    local goalLife = 4
    local angleThreshold = ai:GetRandam_Int(30, 45)
    ai:SetNumber(10, right)
    ai:SetNumber(1, 0)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId):TimingSetNumber(2, 1, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act24 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local turnTime = 0
    local animationId = 5201
    if SpaceCheck(ai, goal, 180, 2) ~= true or SpaceCheck(ai, goal, 180, 4) ~= true or distanceEnemy > 4 then
    else
        animationId = 5211
        if false then
        else
        end
    end
    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act25 = function (ai, goal, paramTbl)
    local goalLife = ai:GetRandam_Float(2, 4)
    local stopDist = ai:GetRandam_Float(5, 7)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local guardStateId = -1
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, guardStateId)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act26 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_SELF, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act27 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local stopDist = 8
    local stopDist_2 = 5
    local goalLife = ai:GetRandam_Float(2, 4)
    local angleThreshold = ai:GetRandam_Int(30, 45)
    if distanceEnemy >= 8 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, -1)
    elseif distanceEnemy <= 5 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist_2, TARGET_ENE_0, true, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, ai:GetRandam_Int(0, 1), angleThreshold, true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act28 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local goalLife_2 = 3
    local angleThreshold = ai:GetRandam_Int(30, 45)
    local guardStateId = -1
    local right = ai:GetRandam_Int(0, 1)
    if distanceEnemy <= 3 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId)
    elseif distanceEnemy <= 8 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife_2, TARGET_ENE_0, 3, TARGET_SELF, true, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife_2, TARGET_ENE_0, 8, TARGET_SELF, false, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act29 = function (ai, goal, paramTbl)
    local goalLife = 2
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, 8.1, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act30 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5200, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 3):TimingSetTimer(4, 30, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act31 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaRatioSelf = ai:GetSpRate(TARGET_SELF)
    local f33_local2 = 20
    local random = ai:GetRandam_Int(1, 100)
    local guardStateId = 9910
    local right = 0
    if SpaceCheck(ai, goal, -90, 1) == true then
        if SpaceCheck(ai, goal, 90, 1) == true then
            if ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_R, 180, 999) then
                right = 1
            else
                right = 0
            end
        else
            right = 0
        end
    elseif SpaceCheck(ai, goal, 90, 1) == true then
        right = 1
    else
    end
    local goalLife = 1
    local angleThreshold = ai:GetRandam_Int(30, 45)
    ai:SetNumber(10, right)
    ai:SetNumber(1, 0)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId):TimingSetNumber(7, 0, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act32 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 10
    local random = ai:GetRandam_Int(1, 100)
    local guardStateId = -1
    local random_2 = ai:GetRandam_Int(30, 90)
    local right = 1
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, 90, false, true, guardStateId)
    ai:SetNumber(NUMBER_SLOT_AFTER_SIDEWAY_RUN_FLAG, 20)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act35 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 10
    local random = ai:GetRandam_Int(1, 100)
    local guardStateId = -1
    local random_2 = ai:GetRandam_Int(30, 90)
    local right = 1
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, 90, false, true, guardStateId)
    ai:SetNumber(NUMBER_SLOT_AFTER_SIDEWAY_RUN_FLAG, 20)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act39 = function (ai, goal, paramTbl)
    local goalLife = 3
    local turnTime = 0
    local goalLife_2 = 4.5
    local angleThreshold = ai:GetRandam_Int(30, 45)
    if SpaceCheck(ai, goal, 180, 5) then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5201, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
        goalLife_2 = 3.5
    end
    local right = 0
    if SpaceCheck(ai, goal, -90, 1) == true then
        if SpaceCheck(ai, goal, 90, 1) == true then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                right = 0
            else
                right = 1
            end
        else
            right = 0
        end
    elseif SpaceCheck(ai, goal, 90, 1) == true then
        right = 1
    else
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife_2, TARGET_ENE_0, right, angleThreshold, true, true, -1)
    return GETWELLSPACE_ODDS
end

Goal.Act40 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3015, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act41 = function (ai, goal, paramTbl)
    local stopDist = 3 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 3 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3084, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act42 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    ai:SetNumber(11, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act43 = function (ai, goal, paramTbl)
    local stopDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3104, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act44 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local turnTime = 0
    local animationId = 5201
    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
    local distanceEnemy_2 = ai:GetDist(TARGET_ENE_0)
    local upAngleThreshold = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3034, TARGET_ENE_0, 9999, 0, turnFaceAngle, 0, 0):TimingSetNumber(11, 1, AI_TIMING_SET__ACTIVATE)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3035, TARGET_ENE_0, 9999, upAngleThreshold, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act45 = function (ai, goal, paramTbl)
    local stopDist = 5.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 5.2 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 5.2 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3030, TARGET_ENE_0, 9999, 0, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3031, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act46 = function (ai, goal, paramTbl)
    local stopDist = 6.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.5 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 6.5 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3050, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    ai:SetNumber(11, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act47 = function (ai, goal, paramTbl)
    local stopDist = 6.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.5 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 6.5 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3017, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    ai:SetNumber(11, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act48 = function (ai, goal, paramTbl)
    local stopDist = 10
    local canRunDist = 10
    local forceRunMinDist = 10 + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3078, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3079, TARGET_ENE_0, 9999, TurnTime, 0, 0, 0)
    ai:SetNumber(11, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act49 = function (ai, goal, paramTbl)
    local stopDist = 10 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 10 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 10 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3080, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    ai:SetNumber(11, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Interrupt = function (self, ai, goal)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local f47_local3 = ai:GetSpecialEffectInactivateInterruptType(0)
    local staminaRatioSelf = ai:GetSpRate(TARGET_SELF)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) and interruptEffect == 110450 then
        ai:SetTimer(7, 2)
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        return self.Parry(ai, goal, 100, 0)
    end
    if ai:IsInterupt(INTERUPT_Shoot) then
        return self.ShootReaction(ai, goal)
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        return self.Damaged(ai, goal)
    end
    if Interupt_PC_Break(ai) then
        ai:Replanning()
        return true
    end
    if Interupt_Use_Item(ai, 10, 10) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 180) then
        if distanceEnemy < 10 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3029, TARGET_ENE_0, 9999, 0)
            return true
        else
            ai:Replanning()
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if interruptEffect == 5025 then
            if ai:IsFinishTimer(6) == false then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF, 0, 0, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.5, 3100, TARGET_ENE_0, 999, 0, 0, 0, 0)
                return true
            elseif distanceEnemy <= 3 then
                if random < 70 then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.5, 3041, TARGET_ENE_0, 999, 0, 0, 0, 0)
                    return true
                else
                    goal:ClearSubGoal()
                    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
                    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.5, 3104, TARGET_ENE_0, 999, 0, 0, 0, 0)
                    return true
                end
            elseif distanceEnemy <= 4.5 then
                goal:ClearSubGoal()
                ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.5, 3104, TARGET_ENE_0, 999, 0, 0, 0, 0)
                return true
            end
        elseif interruptEffect == 5027 then
            if ai:GetNumber(11) == 1 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3032, TARGET_ENE_0, 999, 0, 0, 0, 0)
                return true
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3007, TARGET_ENE_0, 999, 0, 0, 0, 0)
                return true
            end
        elseif interruptEffect == 5028 and ai:GetNumber(11) == 1 and ai:HasSpecialEffectId(TARGET_ENE_0, 110060) == false and ai:HasSpecialEffectId(TARGET_ENE_0, 110010) == false then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3080, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        elseif interruptEffect == 5032 and distanceEnemy <= 3 - ai:GetMapHitRadius(TARGET_SELF) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3077, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        elseif interruptEffect == 5034 then
            if random <= 60 then
                if distanceEnemy <= 4.2 - ai:GetMapHitRadius(TARGET_SELF) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 120) then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3038, TARGET_ENE_0, 999, 0, 0, 0, 0)
                    return true
                elseif distanceEnemy <= 4.2 - ai:GetMapHitRadius(TARGET_SELF) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 120) then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3038, TARGET_ENE_0, 999, 0, 0, 0, 0)
                    return true
                elseif distanceEnemy <= 4 - ai:GetMapHitRadius(TARGET_SELF) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 240) then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3023, TARGET_ENE_0, 999, 0, 0, 0, 0)
                    return true
                end
            end
        elseif interruptEffect == 5036 then
            if random <= 100 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 3, 3041, TARGET_ENE_0, 9999, 0)
                return true
            end
        elseif interruptEffect == 5037 and distanceEnemy <= 4.5 - ai:GetMapHitRadius(TARGET_SELF) and not ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 120) then
            if random <= 100 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3104, TARGET_ENE_0, 9999, 0)
                return true
            end
        elseif interruptEffect == 5038 then
            if distanceEnemy <= 3.5 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3104, TARGET_ENE_0, 999, 0, 0, 0, 0)
            end
        elseif interruptEffect == 5039 and staminaRatioSelf <= 0.5 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3045, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        elseif interruptEffect == 110112 and ai:HasSpecialEffectId(TARGET_SELF, 3540020) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.1, 3046, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        elseif interruptEffect == 110113 and ai:HasSpecialEffectId(TARGET_SELF, 3540020) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.1, 3049, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        elseif interruptEffect == 110114 and ai:HasSpecialEffectId(TARGET_SELF, 3540020) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.1, 3048, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        elseif interruptEffect == 110620 then
            ai:Replanning()
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_ShootImpact) and self.ShootReaction(ai, goal) then
        return true
    end
    return false
end

Goal.Parry = function (ai, goal, f48_arg2, f48_arg3)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f48_local1 = GetDist_Parry(ai)
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    local random_3 = ai:GetRandam_Int(1, 100)
    local hasEffect109970 = ai:HasSpecialEffectId(TARGET_ENE_0, 109970)
    local hasEffectCOMMON_SP_EFFECT_PC_ATTACK_RUSH = ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_ATTACK_RUSH)
    if ai:IsFinishTimer(AI_TIMER_PARRY_INTERVAL) == false then
        return false
    end
    if ai:HasSpecialEffectId(TARGET_ENE_0, 110501) or ai:HasSpecialEffectId(TARGET_ENE_0, 110500) then
        return false
    end
    ai:SetTimer(AI_TIMER_PARRY_INTERVAL, 0.1)
    if f48_arg2 == nil then
        f48_arg2 = 50
    end
    if f48_arg3 == nil then
        f48_arg3 = 0
    end
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) and ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 180, f48_local1) then
        if ai:HasSpecialEffectId(TARGET_ENE_0, 110450) then
            ai:SetTimer(6, 1)
            goal:ClearSubGoal()
            if distanceEnemy <= 3 then
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3103, TARGET_ENE_0, 9999, 0)
            end
            return true
        elseif ai:HasSpecialEffectId(TARGET_SELF, 3540020) and not ai:HasSpecialEffectId(TARGET_ENE_0, 110440) then
            if ai:HasSpecialEffectId(TARGET_ENE_0, 109980) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
                return true
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3103, TARGET_ENE_0, 9999, 0)
                return true
            end
        elseif hasEffectCOMMON_SP_EFFECT_PC_ATTACK_RUSH then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3102, TARGET_ENE_0, 9999, 0)
            return true
        elseif hasEffect109970 then
            if ai:IsTargetGuard(TARGET_SELF) and ReturnKengekiSpecialEffect(ai) == false then
                return false
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
                return true
            end
        elseif ai:HasSpecialEffectId(TARGET_ENE_0, 109980) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
            return true
        elseif random_2 <= Get_ConsecutiveGuardCount(ai) * f48_arg2 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
            return true
        else
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3100, TARGET_ENE_0, 9999, 0)
            return true
        end
    else
        return false
    end
end

Goal.ShootReaction = function (f49_arg0, goal)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3100, TARGET_ENE_0, 9999, 0)
    return true
end

Goal.Kengeki_Activate = function (self, ai, goal, f50_arg3)
    local kengekiEffect = ReturnKengekiSpecialEffect(ai)
    if kengekiEffect == 0 then
        return false
    end
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaRatioSelf = ai:GetSpRate(TARGET_SELF)
    if staminaRatioSelf <= 0 then
        probabilities[50] = 100
    else
        ai:SetNumber(12, ai:GetNumber(12) + 1)
        if kengekiEffect == 200205 or kengekiEffect == 200200 then
            probabilities[2] = 100
            if ai:GetNumber(12) >= 2 then
                probabilities[6] = 100
                probabilities[7] = 100
                probabilities[8] = 100
                probabilities[20] = 200
            end
        elseif kengekiEffect == 200206 or kengekiEffect == 200201 then
            if ai:GetNumber(12) >= 2 then
                probabilities[6] = 100
                probabilities[8] = 100
                probabilities[7] = 100
            end
        elseif kengekiEffect == 200215 then
            if distanceEnemy >= 3 then
            elseif ai:IsFinishTimer(6) == false then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF, 0, 0, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.5, 3100, TARGET_ENE_0, 999, 0, 0, 0, 0)
                return true
            else
                probabilities[1] = 100
                if ai:GetNumber(12) >= 2 then
                    probabilities[6] = 100
                    probabilities[7] = 100
                    probabilities[8] = 100
                    probabilities[20] = 200
                end
            end
        elseif kengekiEffect == 200216 then
            if distanceEnemy >= 3 then
            elseif ai:IsFinishTimer(6) == false then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF, 0, 0, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.5, 3100, TARGET_ENE_0, 999, 0, 0, 0, 0)
                return true
            else
                probabilities[4] = 100
                probabilities[6] = 100
                probabilities[20] = 200
            end
        elseif kengekiEffect == 200210 then
            if ai:IsFinishTimer(6) == false then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_Wait, 0.7, TARGET_SELF, 0, 0, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 0.5, 3100, TARGET_ENE_0, 999, 0, 0, 0, 0)
                return true
            else
                probabilities[9] = 100
                probabilities[11] = 100
                probabilities[31] = 100
                if ai:HasSpecialEffectId(TARGET_ENE_0, 110600) then
                    probabilities[8] = 500
                    probabilities[31] = 500
                elseif ai:HasSpecialEffectId(TARGET_ENE_0, 110610) then
                    probabilities[8] = 500
                    probabilities[31] = 500
                end
            end
        elseif kengekiEffect == 200226 then
            probabilities[50] = 100000000000
        elseif kengekiEffect == 200229 and ai:GetNumber(12) >= 5 then
            ai:SetNumber(12, 0)
            probabilities[8] = 500
            probabilities[31] = 500
        else
            probabilities[50] = 100
        end
    end
    if ai:GetNumber(11) == 1 then
        probabilities[20] = 0
        probabilities[42] = 100
        probabilities[45] = 150
    end
    if ai:GetNumber(3) == 0 then
        probabilities[11] = 0
    end
    if SpaceCheck(ai, goal, 45, 2) == false and SpaceCheck(ai, goal, -45, 2) == false then
        probabilities[22] = 0
    end
    if SpaceCheck(ai, goal, 180, 2) == false then
        probabilities[24] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3071, 8, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3060, 8, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3065, 8, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3007, 8, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3009, 8, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3037, 8, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3026, 8, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 5201, 15, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3071, 15, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3084, 20, probabilities[10], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3003, 15, probabilities[11], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3005, 8, probabilities[12], 1)
    probabilities[13] = SetCoolTime(ai, goal, 3016, 8, probabilities[13], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3077, 8, probabilities[14], 1)
    probabilities[15] = SetCoolTime(ai, goal, 3037, 15, probabilities[15], 1)
    probabilities[17] = SetCoolTime(ai, goal, 3009, 8, probabilities[17], 1)
    probabilities[20] = SetCoolTime(ai, goal, 5201, 15, probabilities[20], 1)
    probabilities[21] = SetCoolTime(ai, goal, 3050, 15, probabilities[21], 1)
    probabilities[22] = SetCoolTime(ai, goal, 3044, 15, probabilities[22], 1)
    probabilities[31] = SetCoolTime(ai, goal, 3072, 15, probabilities[22], 1)
    probabilities[42] = SetCoolTime(ai, goal, 3032, 30, probabilities[42], 1)
    probabilities[44] = SetCoolTime(ai, goal, 3035, 15, probabilities[44], 1)
    probabilities[45] = SetCoolTime(ai, goal, 3030, 30, probabilities[45], 1)
    probabilities[46] = SetCoolTime(ai, goal, 3050, 15, probabilities[46], 1)
    acts[1] = REGIST_FUNC(ai, goal, self.Kengeki01)
    acts[2] = REGIST_FUNC(ai, goal, self.Kengeki02)
    acts[3] = REGIST_FUNC(ai, goal, self.Kengeki03)
    acts[4] = REGIST_FUNC(ai, goal, self.Kengeki04)
    acts[5] = REGIST_FUNC(ai, goal, self.Kengeki05)
    acts[6] = REGIST_FUNC(ai, goal, self.Kengeki06)
    acts[7] = REGIST_FUNC(ai, goal, self.Kengeki07)
    acts[8] = REGIST_FUNC(ai, goal, self.Kengeki08)
    acts[9] = REGIST_FUNC(ai, goal, self.Kengeki09)
    acts[10] = REGIST_FUNC(ai, goal, self.Kengeki10)
    acts[11] = REGIST_FUNC(ai, goal, self.Kengeki11)
    acts[12] = REGIST_FUNC(ai, goal, self.Kengeki12)
    acts[13] = REGIST_FUNC(ai, goal, self.Kengeki13)
    acts[14] = REGIST_FUNC(ai, goal, self.Kengeki14)
    acts[15] = REGIST_FUNC(ai, goal, self.Kengeki15)
    acts[16] = REGIST_FUNC(ai, goal, self.Kengeki16)
    acts[17] = REGIST_FUNC(ai, goal, self.Kengeki17)
    acts[18] = REGIST_FUNC(ai, goal, self.Kengeki18)
    acts[19] = REGIST_FUNC(ai, goal, self.Kengeki19)
    acts[20] = REGIST_FUNC(ai, goal, self.Kengeki20)
    acts[21] = REGIST_FUNC(ai, goal, self.Kengeki21)
    acts[22] = REGIST_FUNC(ai, goal, self.Kengeki22)
    acts[23] = REGIST_FUNC(ai, goal, self.Kengeki23)
    acts[24] = REGIST_FUNC(ai, goal, self.Kengeki24)
    acts[25] = REGIST_FUNC(ai, goal, self.Kengeki25)
    acts[26] = REGIST_FUNC(ai, goal, self.Kengeki26)
    acts[30] = REGIST_FUNC(ai, goal, self.Kengeki30)
    acts[31] = REGIST_FUNC(ai, goal, self.Kengeki31)
    acts[42] = REGIST_FUNC(ai, goal, self.Kengeki42)
    acts[44] = REGIST_FUNC(ai, goal, self.Kengeki44)
    acts[45] = REGIST_FUNC(ai, goal, self.Kengeki45)
    acts[46] = REGIST_FUNC(ai, goal, self.Kengeki46)
    acts[50] = REGIST_FUNC(ai, goal, self.NoAction)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    return Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3070, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3060, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3065, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3007, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(12, 0)
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f55_local1 = 10
    local random = ai:GetRandam_Int(1, 100)
    local f55_local3 = -1
    local random_2 = ai:GetRandam_Int(30, 60)
    local random_3 = ai:GetRandam_Int(1, 100)
    local f55_local6 = 1
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3009, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    if random_3 <= 100 then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3044, TARGET_ENE_0, 9999, 0, 0, 0, 0):TimingSetTimer(2, 15, AI_TIMING_SET__UPDATE_SUCCESS)
    end
    ai:SetNumber(12, 0)
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    if ai:GetNumber(11) == 1 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3030, TARGET_ENE_0, 9999, 0, FrontAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3031, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3037, TARGET_ENE_0, 9999, 0, 0)
    end
    ai:SetNumber(12, 0)
end

Goal.Kengeki07 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3018, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3026, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    ai:SetNumber(12, 0)
end

Goal.Kengeki08 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 5201, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    ai:SetNumber(1, 1)
end

Goal.Kengeki09 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3071, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3002, TARGET_ENE_0, 9999, 0, 0, 0, 0)
end

Goal.Kengeki10 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3084, TARGET_ENE_0, 9999, 0, 0, 0, 0)
end

Goal.Kengeki11 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 10, 3003, TARGET_ENE_0, 9999, 0)
end

Goal.Kengeki20 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3009, TARGET_ENE_0, 9999, 0, 0, 0, 0)
end

Goal.Kengeki30 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3045, TARGET_ENE_0, 9999, 0, 0, 0, 0):TimingSetTimer(2, 15, AI_TIMING_SET__UPDATE_SUCCESS)
end

Goal.Kengeki31 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3072, TARGET_ENE_0, 9999, 0, 0, 0, 0)
end

Goal.Kengeki42 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    if distanceEnemy <= 4 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 5201, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
end

Goal.Kengeki44 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3034, TARGET_ENE_0, 9999, 0, FrontAngle, 0, 0):TimingSetNumber(11, 1, AI_TIMING_SET__ACTIVATE)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3035, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
end

Goal.Kengeki45 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3009, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3030, TARGET_ENE_0, 9999, 0, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3031, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
end

Goal.Kengeki46 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3050, TARGET_ENE_0, 9999, 0, 0, 0, 0)
end

Goal.NoAction = function (ai, goal, paramTbl)
    return -1
end

Goal.ActAfter_AdjustSpace = function (ai, goal, paramTbl)
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
end

Goal.Terminate = function (self, ai, goal)
end

