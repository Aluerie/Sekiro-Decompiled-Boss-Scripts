RegisterTableGoal(GOAL_OnnaSousha_700000_Battle, "OnnaSousha_700000_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_OnnaSousha_700000_Battle, true)

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
    local thinkParam = ai:GetNpcThinkParamID()
    local f2_local6 = Check_ReachAttack(ai, 0)
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    local eventRequest = ai:GetEventRequest()
    ai:SetNumber(4, distanceYEnemy)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
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
    elseif f2_local6 ~= POSSIBLE_ATTACK then
        if paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
            probabilities[27] = 100
        elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
            probabilities[27] = 100
        elseif f2_local6 == UNREACH_ATTACK then
            probabilities[27] = 100
        elseif f2_local6 == REACH_ATTACK_TARGET_HIGH_POSITION then
            probabilities[1] = 150
            probabilities[27] = 100
        elseif f2_local6 == REACH_ATTACK_TARGET_LOW_POSITION then
            probabilities[1] = 150
            probabilities[27] = 100
        else
            probabilities[27] = 100
        end
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        probabilities[28] = 100
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        probabilities[28] = 100
    elseif distanceYEnemy > 1.8 or distanceYEnemy < -1.8 then
        if distanceEnemy <= 5 then
            probabilities[24] = 100
            if distanceYEnemy < -1.8 then
                probabilities[29] = 500
            end
        else
            probabilities[1] = 100
        end
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
        if distanceEnemy >= 16 then
            probabilities[21] = 100
        elseif distanceEnemy > 7 then
            probabilities[21] = 100
        elseif distanceEnemy > 5 then
            probabilities[21] = 100
        else
            probabilities[21] = 1
            probabilities[9] = 100
        end
    elseif distanceEnemy >= 12 then
        probabilities[2] = 200
        probabilities[24] = 10
    elseif distanceEnemy >= 7 then
        probabilities[1] = 0
        probabilities[2] = 200
        probabilities[3] = 0
        probabilities[4] = 0
        probabilities[7] = 0
        probabilities[8] = 0
        probabilities[9] = 0
        probabilities[24] = 10
    elseif distanceEnemy >= 5 then
        probabilities[1] = 200
        probabilities[3] = 0
        probabilities[4] = 200
        probabilities[7] = 100
        probabilities[9] = 0
    elseif distanceYEnemy > 1.2 or distanceYEnemy < -1.2 then
        probabilities[24] = 10
        if distanceYEnemy < -1.2 then
            probabilities[29] = 100
        end
    elseif distanceEnemy > 3 then
        probabilities[1] = 100
        probabilities[3] = 0
        probabilities[4] = 100
        probabilities[7] = 0
        probabilities[9] = 100
        probabilities[10] = 100
    else
        probabilities[1] = 150
        probabilities[3] = 0
        probabilities[4] = 100
        probabilities[7] = 0
        probabilities[9] = 150
        probabilities[10] = 100
    end
    if SpaceCheck(ai, goal, 45, 5) == false and SpaceCheck(ai, goal, -45, 5) == false then
        probabilities[9] = 0
    end
    if SpaceCheck(ai, goal, 90, 1) == false and SpaceCheck(ai, goal, -45, 1) == false then
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 180, 5) == false then
    end
    if SpaceCheck(ai, goal, 0, 5) == false then
        probabilities[2] = 0
    end
    if SpaceCheck(ai, goal, 180, 1) == false then
        probabilities[25] = 0
    end
    if ai:IsFinishTimer(0) == false then
        probabilities[9] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 6, probabilities[1], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3011, 6, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3003, 6, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3006, 6, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3007, 10, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3009, 5, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3015, 6, probabilities[8], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3016, 6, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3017, 10, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3009, 6, probabilities[10], 1)
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
    acts[40] = REGIST_FUNC(ai, goal, self.Act40)
    acts[41] = REGIST_FUNC(ai, goal, self.Act41)
    acts[42] = REGIST_FUNC(ai, goal, self.Act42)
    acts[43] = REGIST_FUNC(ai, goal, self.Act43)
    acts[44] = REGIST_FUNC(ai, goal, self.Act44)
    acts[45] = REGIST_FUNC(ai, goal, self.Act45)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Act01 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 999
    local forceRunMinDist = 999
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local animationId = 3000
    local animationId_2 = 3001
    local animationId_3 = 3002
    local f3_local11 = 3008
    local f3_local12 = 3005
    local successDist = 4.1 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f3_local15 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, successDist_2, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_3, TARGET_ENE_0, 999, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f4_local1 = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local f4_local2 = 999
    local f4_local3 = 999
    local f4_local4 = 0
    local f4_local5 = 0
    local f4_local6 = 1.5
    local f4_local7 = 3
    local f4_local8 = 3000
    local f4_local9 = 3001
    local f4_local10 = 3002
    local f4_local11 = 3008
    local f4_local12 = 3005
    local f4_local13 = 4.1 - ai:GetMapHitRadius(TARGET_SELF)
    local f4_local14 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f4_local15 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3034, TARGET_ENE_0, 9999, 0)
    ai:SetTimer(0, 8)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 2.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 999
    local forceRunMinDist = 999
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    local random = ai:GetRandam_Int(1, 100)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    if random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, 9999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3014, TARGET_ENE_0, 9999, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local stopDist = 3.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 999
    local forceRunMinDist = 999
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    local random = ai:GetRandam_Int(1, 100)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 4.7 - ai:GetMapHitRadius(TARGET_SELF)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3003, TARGET_ENE_0, successDist, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 99
    local forceRunMinDist = 99
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    if distanceEnemy <= stopDist + 4 then
        Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    else
        Approach_Act_Flex(ai, goal, stopDist + 4, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5200, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3009, TARGET_ENE_0, DistToAtt1, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 3.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 999
    local forceRunMinDist = 999
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local animationId = 3015
    local animationId_2 = 3016
    local successDist = 2.6 - ai:GetMapHitRadius(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    if distanceEnemy >= 2.6 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, 0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId_2, TARGET_ENE_0, successDist, 0, 0, 0, 0)
    end
    if random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3011, TARGET_ENE_0, 2.6 - ai:GetMapHitRadius(TARGET_SELF), 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 2.6 - ai:GetMapHitRadius(TARGET_SELF), 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act09 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    if SpaceCheck(ai, goal, 135, 5) then
        if random <= 50 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 5213, TARGET_ENE_0, 7.2 - ai:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 5212, TARGET_ENE_0, 7.2 - ai:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
        end
    elseif SpaceCheck(ai, goal, -135, 5) then
        if random_2 <= 50 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 5212, TARGET_ENE_0, 7.2 - ai:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 5212, TARGET_ENE_0, 7.2 - ai:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3009, TARGET_ENE_0, 9999, 0, 0)
        end
    else
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 5212, TARGET_ENE_0, 7.2 - ai:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3009, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act21 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Turn, 3, TARGET_ENE_0, ai:GetRandam_Int(15, 30))
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act23 = function (ai, goal, paramTbl)
    local f12_local0 = 0
    local guardStateId = -1
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
    local goalLife = 1.8
    local angleThreshold = ai:GetRandam_Int(30, 45)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act24 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local distanceYEnemy = ai:GetDistY(TARGET_ENE_0)
    local f13_local2 = 999
    local f13_local3 = 999
    local f13_local4 = 0
    local f13_local5 = 0
    local goalLife = 20
    local f13_local7 = 0
    local random = ai:GetRandam_Int(1, 100)
    if distanceEnemy >= 12 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, 11.8, TARGET_SELF, true, -1)
    elseif distanceEnemy <= 5 and distanceYEnemy > 1.2 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 0.5, TARGET_SELF, true, -1)
    elseif distanceEnemy <= 5 and distanceYEnemy < -1.2 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 0.5, TARGET_SELF, true, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, 6.8, TARGET_SELF, true, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act25 = function (ai, goal, paramTbl)
    local f14_local0 = 0
    local guardStateId = -1
    local goalLife = ai:GetRandam_Float(3, 5)
    local stopDist = 5
    if SpaceCheck(ai, goal, 180, 1) == true then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, guardStateId)
    else
        ai:Replannning()
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act26 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act27 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    if YousumiAct_SubGoal(ai, goal, true, 60, 30) == false then
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    end
    local right = 0
    local f16_local2 = SpaceCheck_SidewayMove(ai, goal, 1)
    if f16_local2 == 0 then
        right = 0
    elseif f16_local2 == 1 then
        right = 1
    elseif f16_local2 == 2 then
        if random <= 50 then
            right = 0
        else
            right = 1
        end
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF, 0, 0, 0)
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    end
    ai:SetNumber(10, right)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, right, ai:GetRandam_Int(30, 45), true, true, -1):SetTargetRange(0, -99, 12)
    ai:SetNumber(NUMBER_SLOT_FIGHT_COUNT, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act28 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = ai:GetRandam_Float(3, 3.5)
    local angleThreshold = ai:GetRandam_Int(30, 45)
    local guardStateId = -1
    local right = ai:GetRandam_Int(0, 1)
    if distanceEnemy <= 5 then
        if SpaceCheck(ai, goal, 180, 1) == true then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 3, TARGET_ENE_0, 6, TARGET_ENE_0, true, guardStateId)
        else
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId)
        end
    elseif distanceEnemy <= 7 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId)
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, 3, TARGET_SELF, true, -1)
    end
    return GETWELLSPACE_ODDS
end

Goal.Act29 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3042, TARGET_ENE_0, 9999, 0)
    ai:SetTimer(0, 8)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act30 = function (ai, goal, paramTbl)
    local animationId = 3030
    local f19_local1 = 3031
    local animationId_2 = 3032
    local f19_local3 = 3033
    local f19_local4 = 3034
    local f19_local5 = ATT_SUCCESSDIST
    goal:AddSubGoal(GOAL_COMMON_ComboAttack_SuccessAngle180, 20, animationId_2, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 20, animationId, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3021, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act31 = function (ai, goal, paramTbl)
    local animationId = 3039
    local animationId_2 = 3040
    local animationId_3 = 3041
    local animationId_4 = 3042
    local animationId_5 = 3043
    local animationId_6 = 3044
    local animationId_7 = 3045
    local f20_local7 = ATT_SUCCESSDIST
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_4, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_5, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_6, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_7, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act40 = function (ai, goal, paramTbl)
    local goalLife = 3
    local turnTime = 0
    local goalLife_2 = 4.5
    local angleThreshold = ai:GetRandam_Int(30, 45)
    if SpaceCheck(ai, goal, 180, 5) then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5201, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
        goalLife_2 = 0.1
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

Goal.Act41 = function (ai, goal, paramTbl)
    local stopDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 99
    local forceRunMinDist = 99
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f22_local7 = 3000
    local f22_local8 = 3001
    local f22_local9 = 3002
    local f22_local10 = 3008
    local f22_local11 = 4.1 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f22_local13 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3066, TARGET_ENE_0, successDist, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3011, TARGET_ENE_0, 9999, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act42 = function (ai, goal, paramTbl)
    local stopDist = 7.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 99
    local forceRunMinDist = 99
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3079, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3017, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3019, TARGET_ENE_0, DistToAtt4, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act43 = function (ai, goal, paramTbl)
    local stopDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 99
    local forceRunMinDist = 99
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 5212, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3009, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3019, TARGET_ENE_0, DistToAtt4, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act44 = function (ai, goal, paramTbl)
    local stopDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 99
    local forceRunMinDist = 99
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local animationId = 3021
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act45 = function (ai, goal, paramTbl)
    local goalLife = 3
    if SpaceCheck(ai, goal, 180, 5) == true then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3007, TARGET_ENE_0, 999, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.ActAfter_AdjustSpace = function (ai, goal, paramTbl)
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
end

Goal.Terminate = function (self, ai, goal)
end

Goal.Interrupt = function (self, ai, goal)
    local f30_local0 = 1
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    local random = ai:GetRandam_Int(1, 100)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        return Common_Parry(ai, goal, 100, 0, 1, 3103)
    end
    if ai:IsInterupt(INTERUPT_ShootImpact) and self.ShootReaction(ai, goal) then
        return true
    end
    if ai:IsInterupt(INTERUPT_GuardBreak) and random <= 60 then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 3, 3021, TARGET_ENE_0, 9999, 0)
        ai:SetTimer(5, 0.1)
        return true
    end
    if Interupt_PC_Break(ai) and ai:GetTimer(5) <= 0 then
        ai:Replanning()
        return true
    end
    if Interupt_Use_Item(ai, 4, 10) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 180) then
        if distanceEnemy < 5 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3017, TARGET_ENE_0, 9999, 0)
            return true
        elseif distanceEnemy < 7 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3009, TARGET_ENE_0, 9999, 0)
            return true
        else
            ai:Replanning()
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if interruptEffect == 5025 then
            if ai:HasSpecialEffectId(TARGET_ENE_0, 110060) == false or ai:HasSpecialEffectId(TARGET_ENE_0, 110010) == false or ai:HasSpecialEffectId(TARGET_ENE_0, 110015) == false then
                if distanceEnemy <= 3.34 - ai:GetMapHitRadius(TARGET_SELF) then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 3, 3023, TARGET_ENE_0, 9999, 0)
                    return true
                elseif distanceEnemy <= 15 - ai:GetMapHitRadius(TARGET_SELF) then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 3, 3017, TARGET_ENE_0, 9999, 0)
                    return true
                end
            end
        elseif interruptEffect == 5026 then
            if distanceEnemy <= 4.1 - ai:GetMapHitRadius(TARGET_SELF) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 3, 3006, TARGET_ENE_0, 9999, 0)
                return true
            elseif distanceEnemy <= 7.2 - ai:GetMapHitRadius(TARGET_SELF) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 3, 3006, TARGET_ENE_0, 9999, 0)
                return true
            else
            end
        end
    end
    return false
end

Goal.ShootReaction = function (f31_arg0, goal)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3100, TARGET_ENE_0, 9999, 0)
    return true
end

Goal.Kengeki_Activate = function (self, ai, goal, f32_arg3)
    local kengekiEffect = ReturnKengekiSpecialEffect(ai)
    if kengekiEffect == 0 then
        return false
    end
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    ai:SetNumber(5, ai:GetNumber(5) + 1)
    if kengekiEffect == 200200 then
        if distanceEnemy >= 3 then
            probabilities[31] = 100
        else
            probabilities[31] = 100
        end
    elseif kengekiEffect == 200201 then
        if distanceEnemy >= 3 then
            probabilities[31] = 100
        else
            probabilities[31] = 100
        end
    elseif kengekiEffect == 200210 then
        if distanceEnemy >= 3 then
            probabilities[31] = 100
        else
            probabilities[7] = 100
        end
    elseif kengekiEffect == 200211 then
        if distanceEnemy >= 3 then
            probabilities[31] = 100
        else
            probabilities[6] = 100
        end
    end
    if ai:GetNumber(5) >= 3 then
        if ai:GetNinsatsuNum() <= 1 then
            probabilities[44] = 300
        else
            probabilities[45] = 300
        end
    end
    if SpaceCheck(ai, goal, 180, 5) == false then
    end
    probabilities[6] = SetCoolTime(ai, goal, 3066, 3, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3063, 3, probabilities[7], 1)
    acts[1] = REGIST_FUNC(ai, goal, self.Kengeki01)
    acts[2] = REGIST_FUNC(ai, goal, self.Kengeki02)
    acts[3] = REGIST_FUNC(ai, goal, self.Kengeki03)
    acts[4] = REGIST_FUNC(ai, goal, self.Kengeki04)
    acts[5] = REGIST_FUNC(ai, goal, self.Kengeki05)
    acts[6] = REGIST_FUNC(ai, goal, self.Kengeki06)
    acts[7] = REGIST_FUNC(ai, goal, self.Kengeki07)
    acts[8] = REGIST_FUNC(ai, goal, self.Kengeki08)
    acts[15] = REGIST_FUNC(ai, goal, self.Kengeki15)
    acts[16] = REGIST_FUNC(ai, goal, self.Kengeki16)
    acts[21] = REGIST_FUNC(ai, goal, self.Act21)
    acts[22] = REGIST_FUNC(ai, goal, self.Act22)
    acts[23] = REGIST_FUNC(ai, goal, self.Act23)
    acts[24] = REGIST_FUNC(ai, goal, self.Act24)
    acts[25] = REGIST_FUNC(ai, goal, self.Act25)
    acts[31] = REGIST_FUNC(ai, goal, self.Replanning)
    acts[40] = REGIST_FUNC(ai, goal, self.Kengeki40)
    acts[41] = REGIST_FUNC(ai, goal, self.Kengeki41)
    acts[42] = REGIST_FUNC(ai, goal, self.Kengeki42)
    acts[43] = REGIST_FUNC(ai, goal, self.Kengeki43)
    acts[44] = REGIST_FUNC(ai, goal, self.Kengeki44)
    acts[45] = REGIST_FUNC(ai, goal, self.Kengeki45)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    return Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    if random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3011, TARGET_ENE_0, 9999, 0, 0)
        ai:SetNumber(1, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 9999, 0, 0)
        ai:SetNumber(1, 1)
    end
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3061, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3082, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3083, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3087, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3066, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki07 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3062, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki15 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3014, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3061, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3061, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki16 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3061, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3019, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3012, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3011, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki43 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3092, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3090, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3093, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3091, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3061, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3061, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3005, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(5, 0)
end

Goal.Kengeki44 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3093, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3027, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3061, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3061, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(5, 0)
end

Goal.Kengeki45 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3092, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3088, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3026, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3061, TARGET_ENE_0, 2.6, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(5, 0)
end

Goal.Replanning = function (f45_arg0, f45_arg1, f45_arg2)
    return -1
end

