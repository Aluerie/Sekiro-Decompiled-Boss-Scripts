RegisterTableGoal(GOAL_Hakaisou500000_Battle, "Hakaisou500000_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Hakaisou500000_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
end

Goal.Activate = function (self, ai, goal)
    Init_Pseudo_Global(ai, goal)
    ai:SetStringIndexedNumber("Dist_SideStep", 0)
    ai:SetStringIndexedNumber("Dist_BackStep", 0)
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local maxDistance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local paramDoAdmire = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local eventRequest = ai:GetEventRequest()
    local eventRequest_2 = ai:GetEventRequest(1)
    local eventRequest_3 = ai:GetEventRequest(2)
    local f2_local11 = ai:GetNinsatsuMaxNum()
    local f2_local12 = ai:GetNinsatsuNum()
    local f2_local13 = ai:GetNinsatsuMaxNum()
    local f2_local14 = ai:GetNinsatsuNum()
    local f2_local15 = false
    if f2_local14 < f2_local13 then
        f2_local15 = true
    end
    local hasEffect200031 = ai:HasSpecialEffectId(TARGET_SELF, 200031)
    ai:SetStringIndexedNumber("IsHU2", ai:HasSpecialEffectId(TARGET_SELF, 200031))
    local number2 = ai:GetNumber(2)
    ai:DeleteObserve(1)
    ai:SetNumber(11, 0)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5020)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5021)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5035)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5038)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110010)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110125)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 107900)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 3500051)
    Set_ConsecutiveGuardCount_Interrupt(ai)
    if self.Kengeki_Activate(self, ai, goal) then
        return
    end
    local f2_local18 = 0
    if hasEffect200031 then
        f2_local18 = 1
    end
    if ai:HasSpecialEffectId(TARGET_ENE_0, 110060) or ai:HasSpecialEffectId(TARGET_ENE_0, 110010) then
        probabilities[39] = 100
    elseif Common_ActivateAct(ai, goal, f2_local18, 1) then
    elseif eventRequest_2 == 10 then
        probabilities[25] = 100
    elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 9622850) == true or ai:IsInsideTargetRegion(TARGET_ENE_0, 2502853) == true or ai:IsInsideTargetRegion(TARGET_ENE_0, 2502868) == true or ai:IsInsideTargetRegion(TARGET_ENE_0, 2512853) == true then
        if ai:IsInsideTargetRegion(TARGET_ENE_0, 2502868) then
            probabilities[11] = 0
            probabilities[17] = 100
            probabilities[18] = 0
            probabilities[19] = 100
            probabilities[43] = 200
        elseif maxDistance >= 5.8 then
            probabilities[11] = 0
            probabilities[17] = 0
            probabilities[18] = 0
            probabilities[19] = 300
            probabilities[43] = 300
        else
            probabilities[11] = 100
            probabilities[17] = 300
            probabilities[18] = 300
            probabilities[19] = 0
            probabilities[43] = 600
        end
        if hasEffect200031 then
            probabilities[11] = 0
        end
    elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1502810) == true then
        if maxDistance >= 6 then
            probabilities[19] = 300
            probabilities[43] = 300
        elseif maxDistance >= 4 then
            probabilities[17] = 300
            probabilities[18] = 300
            probabilities[43] = 600
        else
            probabilities[11] = 300
            probabilities[17] = 100
            probabilities[43] = 400
        end
    elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 9622851) == true or ai:IsInsideTargetRegion(TARGET_ENE_0, 2502854) == true or ai:IsInsideTargetRegion(TARGET_ENE_0, 2512854) == true then
        probabilities[20] = 200
        probabilities[3] = 100
        probabilities[43] = 150
    elseif ai:IsFinishTimer(0) == true and f2_local15 and not hasEffect200031 then
        probabilities[16] = 100
    elseif ai:IsFinishTimer(2) == true and f2_local14 == 1 then
        probabilities[22] = 100
    else
        if ai:GetNumber(3) == 0 then
            probabilities[27] = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 2502869) then
            probabilities[17] = 300
            probabilities[31] = 100
        elseif not ai:IsExistMeshOnLine(TARGET_ENE_0, AI_DIR_TYPE_ToB, maxDistance) and ai:CheckDoesExistPath(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 0) == true then
            probabilities[30] = 100
        elseif ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_BREAK) then
            probabilities[4] = 100
        elseif maxDistance >= 10 then
            probabilities[1] = 100
            probabilities[2] = 200
            probabilities[3] = 0
            probabilities[4] = 0
            probabilities[5] = 0
            probabilities[6] = 0
            probabilities[7] = 0
            probabilities[8] = 0
            probabilities[9] = 0
            probabilities[10] = 0
            probabilities[11] = 0
            probabilities[12] = 0
            probabilities[13] = 0
            probabilities[14] = 200
            probabilities[24] = 300
        elseif maxDistance >= 7 then
            probabilities[1] = 150
            probabilities[2] = 0
            probabilities[3] = 0
            probabilities[4] = 0
            probabilities[5] = 0
            probabilities[6] = 0
            probabilities[7] = 0
            probabilities[8] = 100
            probabilities[9] = 0
            probabilities[10] = 0
            probabilities[11] = 0
            probabilities[12] = 0
            probabilities[13] = 0
            probabilities[14] = 300
            probabilities[24] = 200
        elseif maxDistance >= 5 then
            probabilities[1] = 50
            probabilities[2] = 0
            probabilities[3] = 200
            probabilities[4] = 200
            probabilities[5] = 100
            probabilities[6] = 0
            probabilities[7] = 0
            probabilities[8] = 100
            probabilities[9] = 0
            probabilities[10] = 0
            probabilities[11] = 0
            probabilities[12] = 0
            probabilities[13] = 0
            probabilities[14] = 0
        elseif maxDistance > 3 then
            probabilities[1] = 0
            probabilities[2] = 0
            probabilities[3] = 150
            probabilities[4] = 150
            probabilities[5] = 100
            probabilities[6] = 0
            probabilities[7] = 0
            probabilities[8] = 0
            probabilities[9] = 0
            probabilities[10] = 0
            probabilities[11] = 0
            probabilities[12] = 0
            probabilities[13] = 100
            probabilities[14] = 0
            probabilities[26] = 50
        elseif maxDistance > 1 then
            probabilities[1] = 0
            probabilities[2] = 0
            probabilities[3] = 100
            probabilities[4] = 100
            probabilities[5] = 150
            probabilities[6] = 0
            probabilities[7] = 0
            probabilities[8] = 0
            probabilities[9] = 0
            probabilities[10] = 0
            probabilities[11] = 0
            probabilities[12] = 0
            probabilities[13] = 100
            probabilities[14] = 0
            probabilities[21] = 50
            probabilities[26] = 100
        else
            probabilities[1] = 0
            probabilities[2] = 0
            probabilities[3] = 50
            probabilities[4] = 50
            probabilities[5] = 20
            probabilities[6] = 150
            probabilities[7] = 150
            probabilities[8] = 0
            probabilities[9] = 0
            probabilities[10] = 0
            probabilities[11] = 0
            probabilities[12] = 0
            probabilities[13] = 0
            probabilities[14] = 0
            probabilities[21] = 100
            probabilities[26] = 100
        end
        if ai:IsTargetGuard(TARGET_ENE_0) then
            probabilities[5] = probabilities[5] * 10
        end
        if not hasEffect200031 then
            probabilities[4] = 0
            probabilities[24] = 0
            probabilities[26] = 0
        end
        if hasEffect200031 then
            probabilities[1] = 0
            probabilities[5] = 0
            probabilities[6] = 0
            probabilities[7] = 0
            probabilities[8] = 0
            probabilities[10] = 0
            probabilities[11] = 0
            probabilities[12] = 0
            probabilities[21] = 0
        end
        if not (ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_L, 2) and ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_R, 2)) and maxDistance <= 5 and not hasEffect200031 then
            probabilities[42] = 400
        end
        if ai:HasSpecialEffectId(TARGET_ENE_0, 109900) then
            probabilities[1] = probabilities[1] * 1.5
            probabilities[3] = probabilities[3] * 0.5
            probabilities[5] = probabilities[5] * 1.5
            probabilities[24] = probabilities[24] * 1.5
            probabilities[43] = 150
        end
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 8, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3001, 8, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3003, 10, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3009, 8, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3010, 8, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3012, 8, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3013, 8, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3015, 8, probabilities[8], 1)
    probabilities[13] = SetCoolTime(ai, goal, 3022, 8, probabilities[13], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3023, 8, probabilities[14], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3038, 8, probabilities[14], 1)
    probabilities[24] = SetCoolTime(ai, goal, 3039, 8, probabilities[24], 1)
    probabilities[26] = SetCoolTime(ai, goal, 3040, 10, probabilities[26], 1)
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
    acts[30] = REGIST_FUNC(ai, goal, self.Act30)
    acts[31] = REGIST_FUNC(ai, goal, self.Act31)
    acts[39] = REGIST_FUNC(ai, goal, self.Act39)
    acts[40] = REGIST_FUNC(ai, goal, self.Act40)
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

Goal.Act49 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 999
    local walk = false
    local goalLife = 3
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3012
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act01 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 11.6 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 1
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3000
    local successDist = 11.6 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 1)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 17.9 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 1
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    ai:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 5)
    local animationId = 3001
    local f5_local5 = 3002
    local successDist = 8 - ai:GetMapHitRadius(TARGET_SELF)
    local f5_local7 = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 2)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF) - 1
    local walk = false
    local goalLife = 3
    local eventRequest = ai:GetEventRequest()
    local f6_local5 = ai:GetNinsatsuMaxNum()
    local f6_local6 = ai:GetNinsatsuNum()
    local f6_local7 = false
    if f6_local6 < f6_local5 then
        f6_local7 = true
    end
    local hasEffect200031 = ai:HasSpecialEffectId(TARGET_SELF, 200031)
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    local random = 2
    local random_2 = ai:GetRandam_Int(1, 100)
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    if hasEffect200031 then
        random = ai:GetRandam_Int(3, 6)
    elseif f6_local7 then
        random = ai:GetRandam_Int(1, 2)
    else
        random = ai:GetRandam_Int(1, 2)
    end
    local animationId = 3003
    local animationId_2 = 3004
    local animationId_3 = 3005
    local f6_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
    local f6_local15 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f6_local16 = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    if random == 1 then
        animationId_2 = 3004
        animationId_3 = 3006
        f6_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f6_local15 = 7 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 2 then
        animationId_2 = 3004
        animationId_3 = 3005
        f6_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f6_local15 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 3 then
        animationId_2 = 3007
        animationId_3 = 3008
        f6_local14 = 7.3 - ai:GetMapHitRadius(TARGET_SELF)
        f6_local15 = 6.2 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 4 then
        animationId_2 = 3004
        animationId_3 = 3040
        f6_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f6_local15 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 5 then
        animationId_2 = 3007
        animationId_3 = 3040
        f6_local14 = 7.3 - ai:GetMapHitRadius(TARGET_SELF)
        f6_local15 = 6.2 - ai:GetMapHitRadius(TARGET_SELF)
    else
        animationId_2 = 3004
        animationId_3 = 3005
        f6_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f6_local15 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(2, 3)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3009
    local successDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 4)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act05 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 7 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3010
    local animationId_2 = 3011
    local f8_local6 = 9 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, successDist, 0, 0)
    ai:SetNumber(2, 5)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act06 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3012
    local successDist = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 6)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3013
    local animationId_2 = 3014
    local f10_local6 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, successDist, 0, 0)
    ai:SetNumber(2, 7)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3015
    local successDist = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 8)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act09 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 5.3 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3016
    local successDist = 5.3 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 9)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 4.4 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3017
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 10)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act11 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 6.5 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3018
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 11)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act12 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 5.8 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3019
    local animationId_2 = 3020
    local successDist = 5.8 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, successDist_2, 0, 0)
    ai:SetNumber(2, 12)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act13 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3022
    local successDist = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 13)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act14 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 11 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 1
    local eventRequest = ai:GetEventRequest()
    local f17_local5 = ai:GetNinsatsuMaxNum()
    local f17_local6 = ai:GetNinsatsuNum()
    local f17_local7 = false
    if f17_local6 < f17_local5 then
        f17_local7 = true
    end
    local hasEffect200031 = ai:HasSpecialEffectId(TARGET_SELF, 200031)
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3023
    local successDist = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    if hasEffect200031 then
        animationId = 3038
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 14)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act15 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 999 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3030
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 15)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act16 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f19_local1 = 999 - ai:GetMapHitRadius(TARGET_SELF)
    local f19_local2 = false
    local f19_local3 = 3
    local random = ai:GetRandam_Int(1, 100)
    local eventRequest = ai:GetEventRequest()
    local f19_local6 = ai:GetNinsatsuMaxNum()
    local f19_local7 = ai:GetNinsatsuNum()
    local f19_local8 = false
    if f19_local7 < f19_local6 then
        f19_local8 = true
    end
    local hasEffect200031 = ai:HasSpecialEffectId(TARGET_SELF, 200031)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    if distanceEnemy < 2 and ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_B, 2) and not hasEffect200031 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5210, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
    elseif distanceEnemy < 5 and ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_B, 2) and not hasEffect200031 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
    end
    local f19_local10 = 3031
    local f19_local11 = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3032, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0):TimingSetTimer(0, 70, AI_TIMING_SET__UPDATE_SUCCESS)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3033, TARGET_ENE_0, 999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3034, TARGET_ENE_0, 999, 0, 0)
    ai:SetNumber(2, 16)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act17 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 2.5
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3024
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 17)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act18 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 1
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3025
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 18)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act19 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 12 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 1
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3026
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 19)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act20 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 8 - ai:GetMapHitRadius(TARGET_SELF) + 2.5
    local walk = false
    local goalLife = 1
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3027
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 20)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act21 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f24_local1 = 1 - ai:GetMapHitRadius(TARGET_SELF)
    local f24_local2 = false
    local f24_local3 = 1
    if f24_local1 < distanceEnemy then
    end
    local animationId = 3028
    local f24_local5 = 3029
    local successDist = 0 - ai:GetMapHitRadius(TARGET_SELF)
    local f24_local7 = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 21)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act22 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3035
    local animationId_2 = 3036
    local animationId_3 = 3037
    local successDist = 9999
    local successDist_2 = 9999
    local successDist_3 = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetTimer(2, 50, AI_TIMING_SET__UPDATE_SUCCESS)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId_2, TARGET_ENE_0, successDist_2, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId_2, TARGET_ENE_0, successDist_2, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, successDist_3, 0, 0)
    ai:SetNumber(2, 22)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act23 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 14.5 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3038
    local successDist = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 23)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act24 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 15.7 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 3
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3039
    local successDist = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 24)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act25 = function (ai, goal, paramTbl)
    local animationId = 3034
    local successDist = 999
    local f28_local2 = 0
    local f28_local3 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId, TARGET_ENE_0, successDist, 0, 0)
    ai:SetNumber(2, 25)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act26 = function (ai, goal, paramTbl)
    local animationId = 3040
    local f29_local1 = 0
    local f29_local2 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId, TARGET_ENE_0, 999, 0, 0)
    ai:SetNumber(2, 26)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act27 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 17.9 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = true
    local goalLife = 5
    local animationId = 3001
    local animationId_2 = 3004
    local animationId_3 = 3006
    local turnTime = 0
    local turnFaceAngle = 0
    local hasEffect200031 = ai:HasSpecialEffectId(TARGET_SELF, 200031)
    if IsHU2 then
        animationId_3 = 3005
    end
    if distanceEnemy >= 10 then
        stopDist = 17.9 - ai:GetMapHitRadius(TARGET_SELF)
        animationId = 3001
        ai:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 5)
    elseif distanceEnemy >= 5 then
        stopDist = 11 - ai:GetMapHitRadius(TARGET_SELF)
        animationId = 3023
    else
        stopDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF)
        animationId = 3003
    end
    if stopDist + 1 < distanceEnemy then
        stopDist = stopDist + 1
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1):SetLifeEndSuccess(true):TimingSetNumber(3, 1, AI_TIMING_SET__UPDATE_SUCCESS)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 0.1, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    if distanceEnemy < 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    end
    ai:SetNumber(2, 27)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act28 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 1
    local walk = false
    local goalLife = 1
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, POINT_UnreachTerminate, stopDist, TARGET_SELF, walk, -1)
    end
    local animationId = 3024
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 17)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act30 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 1.2
    local walk = false
    local goalLife = 1
    local eventRequest = ai:GetEventRequest()
    local f32_local5 = ai:GetNinsatsuMaxNum()
    local f32_local6 = ai:GetNinsatsuNum()
    local f32_local7 = false
    if f32_local6 < f32_local5 then
        f32_local7 = true
    end
    local hasEffect200031 = ai:HasSpecialEffectId(TARGET_SELF, 200031)
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    local random = 2
    local random_2 = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    if hasEffect200031 then
        random = ai:GetRandam_Int(3, 6)
    elseif f32_local7 then
        random = ai:GetRandam_Int(1, 2)
    else
        random = ai:GetRandam_Int(1, 2)
    end
    local animationId = 3003
    local animationId_2 = 3004
    local animationId_3 = 3005
    local f32_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
    local f32_local15 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f32_local16 = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    if random == 1 then
        animationId_2 = 3004
        animationId_3 = 3006
        f32_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f32_local15 = 7 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 2 then
        animationId_2 = 3004
        animationId_3 = 3005
        f32_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f32_local15 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 3 then
        animationId_2 = 3007
        animationId_3 = 3008
        f32_local14 = 7.3 - ai:GetMapHitRadius(TARGET_SELF)
        f32_local15 = 6.2 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 4 then
        animationId_2 = 3004
        animationId_3 = 3040
        f32_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f32_local15 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 5 then
        animationId_2 = 3007
        animationId_3 = 3040
        f32_local14 = 7.3 - ai:GetMapHitRadius(TARGET_SELF)
        f32_local15 = 6.2 - ai:GetMapHitRadius(TARGET_SELF)
    else
        animationId_2 = 3004
        animationId_3 = 3005
        f32_local14 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f32_local15 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(2, 3)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act31 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF)
    local walk = false
    local goalLife = 1
    local eventRequest = ai:GetEventRequest()
    local f33_local5 = ai:GetNinsatsuMaxNum()
    local f33_local6 = ai:GetNinsatsuNum()
    local f33_local7 = false
    if f33_local6 < f33_local5 then
        f33_local7 = true
    end
    local hasEffect200031 = ai:HasSpecialEffectId(TARGET_SELF, 200031)
    if ai:GetNumber(2) == 0 then
        walk = true
        goalLife = 5
    end
    local moveTarget = TARGET_ENE_0
    if ai:CheckDoesExistPathWithSetPoint(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 0) == false then
        moveTarget = POINT_UnreachTerminate
        stopDist = 0.3
    end
    local random = 2
    local random_2 = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, moveTarget, stopDist, TARGET_SELF, walk, -1)
    if hasEffect200031 then
        random = ai:GetRandam_Int(3, 6)
    elseif f33_local7 then
        random = ai:GetRandam_Int(1, 2)
    else
        random = ai:GetRandam_Int(1, 2)
    end
    local animationId = 3003
    local animationId_2 = 3004
    local animationId_3 = 3005
    local f33_local15 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
    local f33_local16 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f33_local17 = 9999
    local turnTime = 0
    local turnFaceAngle = 0
    if random == 1 then
        animationId_2 = 3004
        animationId_3 = 3006
        f33_local15 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f33_local16 = 7 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 2 then
        animationId_2 = 3004
        animationId_3 = 3005
        f33_local15 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f33_local16 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 3 then
        animationId_2 = 3007
        animationId_3 = 3008
        f33_local15 = 7.3 - ai:GetMapHitRadius(TARGET_SELF)
        f33_local16 = 6.2 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 4 then
        animationId_2 = 3004
        animationId_3 = 3040
        f33_local15 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f33_local16 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    elseif random == 5 then
        animationId_2 = 3007
        animationId_3 = 3040
        f33_local15 = 7.3 - ai:GetMapHitRadius(TARGET_SELF)
        f33_local16 = 6.2 - ai:GetMapHitRadius(TARGET_SELF)
    else
        animationId_2 = 3004
        animationId_3 = 3005
        f33_local15 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
        f33_local16 = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(2, 3)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act39 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local stopDist = 8
    local stopDist_2 = 5
    local goalLife = ai:GetRandam_Float(2, 4)
    local angleThreshold = ai:GetRandam_Int(30, 45)
    local goalLife_2 = ai:GetRandam_Float(3, 5)
    if distanceEnemy >= 8 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, -1)
    elseif distanceEnemy <= 5 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist_2, TARGET_ENE_0, true, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, ai:GetRandam_Int(0, 1), angleThreshold, true, true, -1)
    if random <= 60 then
        goal:AddSubGoal(GOAL_COMMON_Wait, goalLife_2, TARGET_ENE_0, 0, 0, 0)
    end
    ai:SetNumber(2, 39)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act40 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f35_local1 = 999 - ai:GetMapHitRadius(TARGET_SELF)
    local f35_local2 = false
    local f35_local3 = 3
    local random = ai:GetRandam_Int(1, 100)
    if distanceEnemy < 2 and ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_B, 2) then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5210, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
    elseif distanceEnemy < 5 and ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_B, 2) then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
    end
    local animationId = 3030
    local successDist = 999
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(2, 40)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act41 = function (ai, goal, paramTbl)
    local goalLife = 3
    local stopAngleWidth = 45
    goal:AddSubGoal(GOAL_COMMON_Turn, goalLife, TARGET_ENE_0, stopAngleWidth, -1, GOAL_RESULT_Success, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act42 = function (ai, goal, paramTbl)
    local goalLife = 3
    local turnTime = 0
    local distSpaceCheck = 3
    if InsideRange(ai, goal, 90, 180, -9999, 9999) and ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_L, 2) or InsideRange(ai, goal, -90, 180, -9999, 9999) and not ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_R, 2) then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5202, TARGET_ENE_0, turnTime, AI_DIR_TYPE_L, distSpaceCheck)
    elseif InsideRange(ai, goal, -90, 180, -9999, 9999) and ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_R, 2) or InsideRange(ai, goal, 90, 180, -9999, 9999) and not ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_L, 2) then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5203, TARGET_ENE_0, turnTime, AI_DIR_TYPE_R, distSpaceCheck)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act43 = function (ai, goal, paramTbl)
    local goalLife = ai:GetRandam_Float(2, 2.5)
    local angleThreshold = ai:GetRandam_Int(30, 45)
    if InsideRange(ai, goal, 90, 180, -9999, 9999) then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, 0, angleThreshold, true, true, -1)
    elseif InsideRange(ai, goal, -90, 180, -9999, 9999) then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, 1, angleThreshold, true, true, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act44 = function (ai, goal, paramTbl)
    local goalLife = 3
    local turnTime = 0
    local distSpaceCheck = 3
    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5201, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, distSpaceCheck)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act45 = function (ai, goal, paramTbl)
    local goalLife = ai:GetRandam_Float(3, 5)
    local stopDist = 5
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act46 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, stopDist, TARGET_SELF, false, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, 999, 0, 0, 0, 0)
    ai:SetNumber(11, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act47 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, stopDist, TARGET_SELF, false, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3004, TARGET_ENE_0, 999, 0, 0, 0, 0)
    ai:SetNumber(11, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act48 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 3
    if stopDist < distanceEnemy then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, stopDist, TARGET_SELF, false, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3069, TARGET_ENE_0, 999, 0, 0, 0, 0)
    ai:SetNumber(11, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Interrupt = function (self, ai, goal)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local eventRequest = ai:GetEventRequest()
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    local f44_local4 = ai:GetNinsatsuMaxNum()
    local f44_local5 = ai:GetNinsatsuNum()
    local f44_local6 = false
    if f44_local5 < f44_local4 then
        f44_local6 = true
    end
    local hasEffect200031 = ai:HasSpecialEffectId(TARGET_SELF, 200031)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if ai:IsInterupt(INTERUPT_Inside_ObserveArea) and ai:IsInsideObserve(1) then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 1, 3021, TARGET_ENE_0, 8 - ai:GetMapHitRadius(TARGET_SELF), 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 999, 0, 0)
        ai:DeleteObserve(1)
        return true
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) and not ai:HasSpecialEffectId(TARGET_SELF, 200031) then
        return Common_Parry(ai, goal, 50, 0)
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
    end
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    local random_3 = ai:GetRandam_Int(1, 100)
    if Interupt_PC_Break(ai) then
        ai:Replanning()
        return true
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if ai:GetSpecialEffectActivateInterruptType(0) == 5035 then
            ai:Replanning()
            ai:DeleteObserve(1)
            return true
        end
        if ai:GetSpecialEffectActivateInterruptType(0) == 5020 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 10, 3034, TARGET_ENE_0, 9999, 0)
            return true
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5021 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 10, 3038, TARGET_ENE_0, 9999, 0)
            return true
        end
        if ai:GetSpecialEffectActivateInterruptType(0) == 5027 then
            ai:SetNumber(1, 0)
            ai:SetNumber(5, 0)
        end
        if ai:GetSpecialEffectActivateInterruptType(0) == 110125 then
        end
        if interruptEffect == 3500051 and ai:HasSpecialEffectId(TARGET_SELF, 6023) == false then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 10, 3028, TARGET_ENE_0, 9999, 0)
            return true
        end
        if interruptEffect == 107900 then
            ai:SetNumber(12, 1)
            goal:ClearSubGoal()
            ai:Replanning()
            return true
        end
        return false
    end
    if Interupt_Use_Item(ai, 4, 10) then
        if ai:HasSpecialEffectId(TARGET_SELF, 200031) then
            if distanceEnemy <= 6 - ai:GetMapHitRadius(TARGET_SELF) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3009, TARGET_ENE_0, 9999, 0, 0, 0, 0)
                return true
            elseif distanceEnemy <= 14.5 - ai:GetMapHitRadius(TARGET_SELF) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3038, TARGET_ENE_0, 9999, 0, 0, 0, 0)
                return true
            else
                ai:Replanning()
                return true
            end
        elseif distanceEnemy <= 4 - ai:GetMapHitRadius(TARGET_SELF) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3022, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        elseif distanceEnemy <= 11 - ai:GetMapHitRadius(TARGET_SELF) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3023, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        else
            ai:Replanning()
            return true
        end
    end
    return false
end

Goal.Damaged = function (ai, goal, f45_arg2)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    local f45_local4 = 0
    if random <= 33 then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_SpinStep, StepLife, 5201, TARGET_ENE_0, TurnTime, AI_DIR_TYPE_B, 0):TimingSetTimer(3, 6, UPDATE_SUCCESS)
        return true
    elseif random <= 67 then
    end
    return false
end

Goal.Kengeki_Activate = function (self, ai, goal, f46_arg3)
    local kengekiEffect = ReturnKengekiSpecialEffect(ai)
    if kengekiEffect == 0 then
        return false
    end
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    local eventRequest = ai:GetEventRequest()
    local eventRequest_2 = ai:GetEventRequest(2)
    local f46_local9 = ai:GetNinsatsuMaxNum()
    local f46_local10 = ai:GetNinsatsuNum()
    local f46_local11 = false
    if f46_local10 < f46_local9 then
        f46_local11 = true
    end
    local hasEffect200031 = ai:HasSpecialEffectId(TARGET_SELF, 200031)
    if staminaSelf <= 0 then
        probabilities[46] = 100
    elseif kengekiEffect == 200200 then
        if distanceEnemy >= 10 then
            probabilities[46] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[46] = 100
        elseif ai:GetNumber(1) < ai:GetRandam_Int(1, 3) then
            if ai:GetNumber(0) == 0 then
                probabilities[14] = 100
                ai:SetNumber(0, 1)
            else
                probabilities[15] = 100
                ai:SetNumber(0, 0)
            end
            ai:SetNumber(1, ai:GetNumber(1) + 1)
        else
            if random <= 80 and hasEffect200031 then
                probabilities[17] = 100
            elseif random <= 60 and ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_B, 6) == true then
                probabilities[16] = 100
            else
                probabilities[18] = 100
            end
            ai:SetNumber(1, 0)
        end
    elseif kengekiEffect == 200201 then
        if distanceEnemy >= 10 then
            probabilities[46] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[46] = 100
        elseif ai:GetNumber(1) < ai:GetRandam_Int(1, 3) then
            if ai:GetNumber(0) == 0 then
                probabilities[9] = 100
                ai:SetNumber(0, 1)
            else
                probabilities[10] = 100
                ai:SetNumber(0, 0)
            end
            ai:SetNumber(1, ai:GetNumber(1) + 1)
        else
            if random <= 20 and ai:IsExistMeshOnLine(TARGET_SELF, AI_DIR_TYPE_B, 6) == true and distanceEnemy < 2.5 then
                probabilities[12] = 100
            elseif random <= 70 and hasEffect200031 then
                probabilities[30] = 100
            else
                probabilities[13] = 100
                probabilities[11] = 100
            end
            ai:SetNumber(1, 0)
        end
    elseif kengekiEffect == 200205 then
        if distanceEnemy >= 10 then
            probabilities[46] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[46] = 100
        else
            if ai:GetNumber(0) == 0 then
                probabilities[1] = 100
                ai:SetNumber(0, 1)
            else
                probabilities[2] = 100
                ai:SetNumber(0, 0)
            end
            if hasEffect200031 then
                probabilities[30] = 100
            end
        end
    elseif kengekiEffect == 200206 then
        if distanceEnemy >= 10 then
            probabilities[46] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[46] = 100
        else
            if ai:GetNumber(0) == 0 then
                probabilities[5] = 100
                ai:SetNumber(0, 1)
            else
                probabilities[6] = 100
                ai:SetNumber(0, 0)
            end
            if hasEffect200031 then
                probabilities[30] = 100
            end
        end
    elseif kengekiEffect == 200210 then
        if distanceEnemy >= 10 then
            probabilities[46] = 100
        else
            probabilities[13] = 150
            probabilities[21] = 100
            if hasEffect200031 then
                probabilities[30] = 50
            end
        end
    elseif kengekiEffect == 200211 then
        if distanceEnemy >= 10 then
            probabilities[46] = 100
        else
            probabilities[25] = 100
            probabilities[1] = 100
            if hasEffect200031 then
                probabilities[30] = 50
            end
        end
    elseif kengekiEffect == 200215 then
        if ai:IsFinishTimer(0) == true and f46_local11 and eventRequest_2 ~= 1 then
            probabilities[46] = 100
        elseif distanceEnemy >= 10 then
            probabilities[46] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[46] = 100
        else
            probabilities[46] = 100
            if ai:GetNumber(1) < ai:GetRandam_Int(2, 2) then
                probabilities[20] = 200
                ai:SetNumber(0, 1)
                ai:SetNumber(1, ai:GetNumber(1) + 1)
            else
                probabilities[21] = 200
                ai:SetNumber(0, 0)
                ai:SetNumber(1, 0)
            end
        end
    elseif kengekiEffect == 200216 then
        if ai:IsFinishTimer(0) == true and f46_local11 and eventRequest_2 ~= 1 then
            probabilities[46] = 100
        elseif distanceEnemy >= 10 then
            probabilities[46] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[46] = 100
        else
            probabilities[46] = 100
            if ai:GetNumber(1) < ai:GetRandam_Int(2, 2) then
                probabilities[24] = 200
                ai:SetNumber(0, 1)
                ai:SetNumber(1, ai:GetNumber(1) + 1)
            else
                probabilities[25] = 200
                ai:SetNumber(0, 0)
                ai:SetNumber(1, 0)
            end
        end
    end
    probabilities[13] = SetCoolTime(ai, goal, 3064, 12, probabilities[13], 1)
    probabilities[21] = SetCoolTime(ai, goal, 3072, 12, probabilities[21], 1)
    probabilities[1] = SetCoolTime(ai, goal, 3050, 12, probabilities[1], 1)
    probabilities[25] = SetCoolTime(ai, goal, 3077, 12, probabilities[25], 1)
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
    acts[41] = REGIST_FUNC(ai, goal, self.Act41)
    acts[42] = REGIST_FUNC(ai, goal, self.Act42)
    acts[43] = REGIST_FUNC(ai, goal, self.Act43)
    acts[44] = REGIST_FUNC(ai, goal, self.Act44)
    acts[45] = REGIST_FUNC(ai, goal, self.Act45)
    acts[46] = REGIST_FUNC(ai, goal, self.NoAction)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    return Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3050, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3051, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3052, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3053, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3055, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3056, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki07 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3057, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki08 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3058, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki09 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3060, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki10 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3061, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki11 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3062, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki12 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3063, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki13 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3064, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki14 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3065, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki15 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3066, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki16 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3067, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki17 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3068, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki18 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3069, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki19 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3070, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki20 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3071, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki21 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3072, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki22 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3073, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki23 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3075, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki24 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3076, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki25 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3077, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki26 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3078, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki30 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3040, TARGET_ENE_0, 9999, 0, 0)
end

Goal.NoAction = function (ai, goal, paramTbl)
    return -1
end

Goal.ActAfter_AdjustSpace = function (ai, goal, paramTbl)
end

Goal.Update = function (self, ai, goal)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    if staminaSelf <= 0 then
        ai:SetEventFlag(19625862, true)
    else
        ai:SetEventFlag(19625862, false)
    end
    return Update_Default_NoSubGoal(self, ai, goal)
end

Goal.Terminate = function (self, ai, goal)
end

