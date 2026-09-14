RegisterTableGoal(GOAL_NanbanArmor_113000_Battle, "GOAL_NanbanArmor_113000_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_NanbanArmor_113000_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
end

Goal.Activate = function (self, ai, goal)
    Init_Pseudo_Global(ai, goal)
    if self.Kengeki_Activate(self, ai, goal) then
        return
    end
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
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5031)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5032)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5033)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 3113000)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 3113020)
    ai:DeleteObserve(1)
    if Common_ActivateAct(ai, goal, 1) then
    elseif ai:CheckDoesExistPath(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 0) == false then
        probabilities[27] = 100
    elseif ai:GetNumber(0) >= 4 then
        probabilities[7] = 100
    elseif not ai:IsExistMeshOnLine(TARGET_ENE_0, AI_DIR_TYPE_ToB, maxDistance) and ai:CheckDoesExistPath(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 0) == true then
        probabilities[40] = 100
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
        if maxDistance > 7 then
            probabilities[21] = 100
        elseif maxDistance > 5 then
            probabilities[21] = 100
        else
            probabilities[21] = 100
        end
    elseif not ai:IsExistMeshOnLine(TARGET_ENE_0, AI_DIR_TYPE_ToB, maxDistance) and ai:CheckDoesExistPath(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 0) == true then
        probabilities[40] = 100
    elseif ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_BREAK) then
        probabilities[3] = 100
    elseif maxDistance >= 11 then
        probabilities[1] = 0
        probabilities[2] = 0
        probabilities[3] = 100
        probabilities[4] = 0
        probabilities[5] = 100
        probabilities[6] = 0
    elseif maxDistance >= 9 then
        probabilities[1] = 0
        probabilities[2] = 0
        probabilities[3] = 100
        probabilities[4] = 0
        probabilities[5] = 200
        probabilities[6] = 0
    elseif maxDistance > 7 then
        probabilities[1] = 100
        probabilities[2] = 100
        probabilities[3] = 100
        probabilities[4] = 0
        probabilities[5] = 0
        probabilities[6] = 0
    elseif maxDistance > 5 then
        probabilities[1] = 100
        probabilities[2] = 100
        probabilities[3] = 100
        probabilities[4] = 0
        probabilities[5] = 100
    elseif maxDistance > 3 then
        probabilities[1] = 100
        probabilities[2] = 100
        probabilities[3] = 0
        probabilities[4] = 100
        probabilities[6] = 100
    else
        probabilities[1] = 50
        probabilities[2] = 50
        probabilities[3] = 0
        probabilities[4] = 100
        probabilities[5] = 0
        probabilities[6] = 200
    end
    if ai:IsFinishTimer(0) == false then
        probabilities[6] = 0
    end
    if SpaceCheck(ai, goal, 45, ai:GetStringIndexedNumber("Dist_Step_Small")) == false and SpaceCheck(ai, goal, -45, ai:GetStringIndexedNumber("Dist_Step_Small")) == false then
        probabilities[22] = 0
    end
    if SpaceCheck(ai, goal, 90, 1) == false and SpaceCheck(ai, goal, -90, 1) == false then
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 180, ai:GetStringIndexedNumber("Dist_Step_Small")) == false then
        probabilities[24] = 0
    end
    if SpaceCheck(ai, goal, 180, 1) == false then
        probabilities[25] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 20, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3004, 20, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3007, 20, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3008, 20, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3009, 20, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3011, 20, probabilities[6], 1)
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
    acts[20] = REGIST_FUNC(ai, goal, self.Act20)
    acts[21] = REGIST_FUNC(ai, goal, self.Act21)
    acts[23] = REGIST_FUNC(ai, goal, self.Act23)
    acts[26] = REGIST_FUNC(ai, goal, self.Act26)
    acts[27] = REGIST_FUNC(ai, goal, self.Act27)
    acts[30] = REGIST_FUNC(ai, goal, self.Act30)
    acts[40] = REGIST_FUNC(ai, goal, self.Act40)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Act01 = function (ai, goal, paramTbl)
    local stopDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 5.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local animationId = 3000
    local animationId_2 = 3001
    local animationId_3 = 3002
    local animationId_4 = 3003
    local f3_local11 = 6.7 - ai:GetMapHitRadius(TARGET_SELF)
    local f3_local12 = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f3_local13 = 6.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    if random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_4, TARGET_ENE_0, 9999, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local stopDist = 6.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.2 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6.2 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local animationId = 3004
    local animationId_2 = 3005
    local animationId_3 = 3003
    local f4_local10 = 5.85 - ai:GetMapHitRadius(TARGET_SELF)
    local f4_local11 = 6.4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local stopDist = 7.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 7.6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 7.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local animationId = 3007
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local f6_local0 = 4.7 - ai:GetMapHitRadius(TARGET_SELF)
    local f6_local1 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f6_local2 = 4.7 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f6_local3 = 100
    local f6_local4 = 0
    local f6_local5 = 1.5
    local f6_local6 = 3
    local animationId = 3008
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act05 = function (ai, goal, paramTbl)
    local stopDist = 14.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 14.8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 14.8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    ai:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 7)
    local animationId = 3009
    local f7_local8 = 3010
    local f7_local9 = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act06 = function (ai, goal, paramTbl)
    local f8_local0 = 3011
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3011, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3013, TARGET_ENE_0, 9999, 0, 0)
    ai:SetTimer(0, 5)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3094, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    ai:SetNumber(0, 0)
    ai:SetNumber(1, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3092, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3095, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    ai:SetNumber(1, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act09 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3093, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    ai:SetNumber(1, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local animationId = 3091
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act30 = function (ai, goal, paramTbl)
    local f13_local0 = 3092
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3011, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act40 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 1
    local walk = false
    local goalLife = 0.1
    local eventRequest = ai:GetEventRequest()
    local f14_local5 = ai:GetNinsatsuMaxNum()
    local f14_local6 = ai:GetNinsatsuNum()
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    if random <= 25 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, 9999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 9999, 0, 0)
    elseif random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, 9999, 0, 0)
    elseif random <= 75 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3004, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3005, TARGET_ENE_0, 9999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, 9999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act20 = function (ai, goal, paramTbl)
    local stopDist = 6.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.2 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6.2 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
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

Goal.Act23 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local f17_local2 = 20
    local random = ai:GetRandam_Int(1, 100)
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
        GetWellSpace_Odds = 100
        return GetWellSpace_Odds
    end
    local goalLife = 2.5
    local angleThreshold = ai:GetRandam_Int(30, 45)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId):TimingSetTimer(2, 4, UPDATE_SUCCESS)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act26 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_SELF, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act27 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    local stopDist = distanceYEnemy / math.tan(math.deg(30))
    local right = ai:GetRandam_Int(0, 1)
    ai:SetNumber(10, right)
    if distanceYEnemy >= 3 then
        if stopDist + 1 <= distanceEnemy then
            if SpaceCheck(ai, goal, 0, 4) == true then
                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 0.1, TARGET_ENE_0, stopDist, TARGET_SELF, false, -1)
            elseif SpaceCheck(ai, goal, 0, 3) == true then
                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 0.5, TARGET_ENE_0, stopDist, TARGET_SELF, true, -1)
            else
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, right, ai:GetRandam_Int(30, 45), true, true, -1)
            end
        elseif distanceEnemy <= stopDist - 1 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 10, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, -1):SetTargetRange(0, -99, 12)
        end
    elseif SpaceCheck(ai, goal, 0, 4) == true then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 0.1, TARGET_ENE_0, 0, TARGET_SELF, false, -1)
    elseif SpaceCheck(ai, goal, 0, 3) == true then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 0.5, TARGET_ENE_0, 0, TARGET_SELF, true, -1)
    elseif SpaceCheck(ai, goal, 0, 1) == false then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 0.5, TARGET_ENE_0, 999, TARGET_ENE_0, true, -1):SetTargetRange(0, -99, 12)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, right, ai:GetRandam_Int(30, 45), true, true, -1):SetTargetRange(0, -99, 12)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Interrupt = function (self, ai, goal)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        return self.Parry(ai, goal)
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        return self.Damaged(ai, goal)
    end
    if Interupt_PC_Break(ai) then
        ai:Replanning()
        return true
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if ai:GetSpecialEffectActivateInterruptType(0) == 3113000 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3030, TARGET_ENE_0, 9999, 0, 0)
            return true
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 3113020 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 3, 20000, TARGET_ENE_0, 9999, 0)
            return true
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5026 then
            ai:SetNumber(0, 0)
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5027 then
            ai:SetNumber(0, 2)
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5030 then
            ai:SetNumber(0, ai:GetNumber(0) + 3)
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5031 then
            ai:SetNumber(0, ai:GetNumber(0) + 3)
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5032 then
            if distanceEnemy <= 5 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3092, TARGET_ENE_0, 9999, 0, 0)
                ai:SetNumber(1, 0)
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3093, TARGET_ENE_0, 9999, 0, 0)
                ai:SetNumber(1, 0)
            end
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5033 and distanceEnemy >= 4.5 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3095, TARGET_ENE_0, 9999, 0, 0)
        end
    end
    if ai:IsInterupt(INTERUPT_Inside_ObserveArea) then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 1, 3010, TARGET_ENE_0, 7.5 - ai:GetMapHitRadius(TARGET_SELF), 0, 0)
        ai:DeleteObserve(1)
        return true
    end
    return false
end

Goal.Kengeki_Activate = function (self, ai, goal, f21_arg3)
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
    ai:SetNumber(0, ai:GetNumber(0) + 1)
    if kengekiEffect == 200200 then
        if ai:GetNumber(0) >= 4 then
            probabilities[50] = 100
        elseif ai:GetNumber(0) >= 2 then
            probabilities[3] = 100
            probabilities[5] = 100
        else
            probabilities[3] = 100
        end
    elseif kengekiEffect == 200201 then
        if ai:GetNumber(0) >= 4 then
            probabilities[50] = 100
        elseif ai:GetNumber(0) >= 2 then
            probabilities[4] = 100
            probabilities[5] = 100
        else
            probabilities[4] = 100
        end
    end
    if ai:IsFinishTimer(0) == false then
        probabilities[5] = 0
    end
    probabilities[3] = SetCoolTime(ai, goal, 3060, 15, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3065, 20, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3006, 8, probabilities[5], 1)
    acts[1] = REGIST_FUNC(ai, goal, self.Kengeki01)
    acts[2] = REGIST_FUNC(ai, goal, self.Kengeki02)
    acts[3] = REGIST_FUNC(ai, goal, self.Kengeki03)
    acts[4] = REGIST_FUNC(ai, goal, self.Kengeki04)
    acts[5] = REGIST_FUNC(ai, goal, self.Kengeki05)
    acts[6] = REGIST_FUNC(ai, goal, self.Kengeki06)
    acts[7] = REGIST_FUNC(ai, goal, self.Kengeki07)
    acts[8] = REGIST_FUNC(ai, goal, self.Kengeki08)
    acts[50] = REGIST_FUNC(ai, goal, self.NoAction)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    if ai:GetNumber(2) == 0 then
        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 10, 3090, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
        ai:SetNumber(2, 1)
    else
        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 10, 3094, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    end
    ai:SetNumber(0, ai:GetNumber(0) - 5)
    ai:SetNumber(1, 1)
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3060, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3065, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3005, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, 9999, 0, 0)
    if random <= 100 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3013, TARGET_ENE_0, 9999, 0, 0)
    end
    ai:SetTimer(0, 5)
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

Goal.ActAfter_AdjustSpace = function (ai, goal, paramTbl)
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
end

Goal.Terminate = function (self, ai, goal)
end

