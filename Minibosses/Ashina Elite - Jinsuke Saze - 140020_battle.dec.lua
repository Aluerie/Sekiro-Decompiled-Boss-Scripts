RegisterTableGoal(GOAL_Kenkaku_iai_140020_Battle, "GOAL_Kenkaku_iai_140020_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Kenkaku_iai_140020_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
end

Goal.Activate = function (self, ai, goal)
    Init_Pseudo_Global(ai, goal)
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    local paramDoAdmire = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local distanceEnemy_2 = ai:GetDist(TARGET_ENE_0)
    local staminaEnemy = ai:GetSp(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local paramDoAdmire_2 = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local f2_local12 = Check_ReachAttack(ai, 0)
    local random_2 = ai:GetRandam_Int(3, 5)
    Set_ConsecutiveGuardCount_Interrupt(ai)
    ai:SetNumber(5, 0)
    ai:SetNumber(11, 0)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 200030)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 200031)
    local f2_local14 = 60
    local f2_local15 = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local f2_local16 = 2.5
    if ai:GetNumber(3) == 0 then
        ai:SetNumber(3, 1)
        ai:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, f2_local14, f2_local15)
        ai:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 200, f2_local16)
    end
    if self.Kengeki_Activate(self, ai, goal) then
        return
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 200030) then
        probabilities[15] = 100
        if ai:HasSpecialEffectId(TARGET_SELF, 5027) then
            probabilities[22] = 100
        end
    elseif Common_ActivateAct(ai, goal) then
    elseif f2_local12 ~= POSSIBLE_ATTACK then
        if paramDoAdmire_2 == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
            probabilities[27] = 100
        elseif paramDoAdmire_2 == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
            probabilities[27] = 100
        elseif f2_local12 == UNREACH_ATTACK then
            probabilities[27] = 100
        elseif f2_local12 == REACH_ATTACK_TARGET_HIGH_POSITION then
            probabilities[10] = 50
            probabilities[27] = 100
        elseif f2_local12 == REACH_ATTACK_TARGET_LOW_POSITION then
            probabilities[10] = 50
            probabilities[27] = 100
        else
            probabilities[27] = 100
        end
    elseif paramDoAdmire_2 == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        KankyakuAct(ai, goal)
    elseif paramDoAdmire_2 == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        TorimakiAct(ai, goal, -1, 0)
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
        if ai:HasSpecialEffectId(TARGET_SELF, 200030) then
            if distanceEnemy_2 < 3 then
                probabilities[22] = 100
            else
                probabilities[15] = 100
            end
        else
            probabilities[21] = 100
            probabilities[22] = 100
        end
    elseif ai:HasSpecialEffectId(TARGET_SELF, 200030) then
        probabilities[15] = 1000
    elseif ai:HasSpecialEffectId(TARGET_SELF, 200031) then
        if distanceEnemy_2 >= 8.5 then
            probabilities[19] = 60
            probabilities[20] = 100
            if not ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 120) then
                probabilities[19] = 0
                probabilities[20] = 0
                probabilities[21] = 100
            end
        elseif distanceEnemy_2 >= 5.5 then
            probabilities[10] = 100
            probabilities[19] = 50
            probabilities[20] = 30
            probabilities[23] = 40
            probabilities[26] = 50
            if ai:GetNumber(4) >= 1 then
                probabilities[19] = 500
            end
        elseif distanceEnemy_2 > 3.8 then
            probabilities[10] = 15
            probabilities[19] = 30
            probabilities[20] = 10
            probabilities[22] = 30
            probabilities[23] = 25
            probabilities[24] = 15
            probabilities[25] = 10
            probabilities[26] = 70
            if ai:GetNumber(4) >= 1 then
                probabilities[19] = 10000
            end
        else
            probabilities[10] = 100
            probabilities[23] = 1
            probabilities[24] = 100
            probabilities[25] = 10
            if ai:GetNumber(4) >= 1 then
                probabilities[10] = 400
                probabilities[24] = 10
            end
        end
        if distanceEnemy_2 < 1.5 then
            probabilities[24] = 500
        elseif ai:GetNumber(1) >= 1 then
            probabilities[24] = probabilities[24] * 0.1
        end
        if ai:GetNumber(12) == 1 and distanceEnemy_2 < 2.5 then
            probabilities[3] = 1000
            probabilities[19] = 500
            probabilities[22] = 0
        end
        if ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_BREAK) then
            probabilities[22] = 0
            probabilities[23] = 0
            probabilities[24] = 0
            probabilities[25] = 0
            probabilities[26] = 1
        end
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 5028) then
        ai:SetNumber(12, 0)
    elseif distanceEnemy_2 < 2.5 then
        probabilities[3] = 1000
        probabilities[19] = 0
    end
    if ai:GetNumber(3) == 1 and ai:HasSpecialEffectId(TARGET_SELF, 200030) then
        probabilities[15] = 3000
        ai:SetNumber(3, 0)
    else
        ai:SetNumber(3, 0)
    end
    if SpaceCheck(ai, goal, 0, 1) == false then
        probabilities[19] = 0
    end
    if SpaceCheck(ai, goal, 180, 2) == false and distanceEnemy_2 < 6 then
        probabilities[22] = 400
        probabilities[24] = 0
    end
    if SpaceCheck(ai, goal, 180, 4) == false and distanceEnemy_2 < 6 then
        probabilities[22] = 200
    end
    if SpaceCheck(ai, goal, 90, 1) == false and SpaceCheck(ai, goal, -90, 1) == false then
        probabilities[22] = 0
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 180, 1) == false then
        probabilities[25] = 0
    end
    if ai:IsInsideObserve(0) and distanceEnemy_2 > 1 then
        probabilities[10] = probabilities[10] * 3
        probabilities[24] = probabilities[24] * 0.5
        probabilities[25] = probabilities[25] * 0.3
    end
    if not ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) then
        probabilities[19] = 0
    end
    if ai:GetNumber(4) >= 4 then
        ai:SetNumber(4, 0)
        probabilities[10] = 1
    end
    if distanceYEnemy > 1.5 then
        probabilities[10] = 1
        probabilities[26] = 1
    end
    probabilities[3] = SetCoolTime(ai, goal, 3021, 5, probabilities[3], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3010, 1, probabilities[10], 1)
    probabilities[19] = SetCoolTime(ai, goal, 5200, 1.4, probabilities[19], 1)
    acts[3] = REGIST_FUNC(ai, goal, self.Act03)
    acts[10] = REGIST_FUNC(ai, goal, self.Act10)
    acts[14] = REGIST_FUNC(ai, goal, self.Act14)
    acts[15] = REGIST_FUNC(ai, goal, self.Act15)
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
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Act03 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f3_local1 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f3_local2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local f3_local3 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local f3_local4 = 0
    local f3_local5 = 0
    local f3_local6 = 5
    local f3_local7 = 3
    local animationId = 3021
    local turnTime = 0
    local turnFaceAngle = 70
    ai:DeleteObserve(0)
    ai:DeleteObserve(1)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 4, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3022, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 3
    local forceRunMinDist = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 6
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local animationId = 3010
    local turnTime = 0
    local turnFaceAngle = 0
    ai:SetNumber(11, ai:GetNumber(11) + 1)
    ai:SetNumber(4, 0)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetTimer(9, 4, AI_TIMING_SET__ACTIVATE)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act14 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local turnTime = 0
    local turnFaceAngle = 0
    local goalLife = 3
    local animationId = 3020
    if distanceEnemy <= 2 then
        if SpaceCheck(ai, goal, 180, 2) == false then
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5201, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(11, 0, AI_TIMING_SET__ACTIVATE)
        end
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(11, 0, AI_TIMING_SET__ACTIVATE)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act15 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local animationId = 3031
    local animationId_2 = 3033
    local turnTime = 0
    local turnFaceAngle = 0
    ai:SetNumber(5, 0)
    ai:SetNumber(1, 1)
    if SpaceCheck(ai, goal, 180, 2) == false then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    elseif distanceEnemy <= 2 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId_2, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act19 = function (ai, goal, paramTbl)
    local goalLife = 3
    local turnTime = 0
    local animationId = 5200
    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_F, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act20 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 3
    local goalLife = 3
    local random = ai:GetRandam_Float(1, 3)
    local f8_local4 = 0
    local f8_local5 = 5200
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, true, -1)
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
    local goalLife = 3
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    if ai:HasSpecialEffectId(TARGET_SELF, 200030) then
        if SpaceCheck(ai, goal, -45, 2) == true then
            if SpaceCheck(ai, goal, 45, 2) == true then
                if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3035, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3034, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0)
                end
            else
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3035, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0)
            end
        elseif SpaceCheck(ai, goal, 45, 2) == true then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3034, TARGET_ENE_0, 999, turnTime, turnFaceAngle, 0, 0)
            if false then
            end
        end
    else
        if SpaceCheck(ai, goal, -45, 2) == true then
            if SpaceCheck(ai, goal, 45, 2) == true then
                if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5202, TARGET_ENE_0, turnTime, AI_DIR_TYPE_L, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5203, TARGET_ENE_0, turnTime, AI_DIR_TYPE_R, 0)
                end
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5202, TARGET_ENE_0, turnTime, AI_DIR_TYPE_L, 0)
            end
        elseif SpaceCheck(ai, goal, 45, 2) == true then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5203, TARGET_ENE_0, turnTime, AI_DIR_TYPE_R, 0)
        else
        end
        if random <= 50 and distanceEnemy < 4 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) then
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3021, TARGET_ENE_0, 4.5, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3022, TARGET_ENE_0, 9999, 0, 0)
        else
            turnTime = 0.5
            goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5200, TARGET_ENE_0, turnTime, AI_DIR_TYPE_F, 0)
        end
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act23 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local f11_local2 = 20
    local random = ai:GetRandam_Int(1, 100)
    local guardStateId = -1
    local right = 0
    if SpaceCheck(ai, goal, -90, 1) == true then
        if SpaceCheck(ai, goal, 90, 1) == true then
            if random <= 50 then
                if ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_R, 180, 999) then
                    right = 1
                else
                    right = 0
                end
            elseif ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 999) then
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
        right = 1
    end
    local goalLife = ai:GetRandam_Float(0.5, 1.5)
    local angleThreshold = ai:GetRandam_Int(30, 45)
    ai:SetNumber(10, right)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act24 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local turnTime = 0
    local animationId = 5201
    ai:SetNumber(1, 1)
    if SpaceCheck(ai, goal, 180, 2) ~= true or SpaceCheck(ai, goal, 180, 4) ~= true or distanceEnemy > 4 then
    else
        animationId = 5201
        if false then
        else
        end
    end
    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act25 = function (ai, goal, paramTbl)
    local goalLife = ai:GetRandam_Float(0.8, 2)
    local stopDist = ai:GetRandam_Float(2, 4.5)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local guardStateId = -1
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, guardStateId)
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
    local f15_local2 = SpaceCheck_SidewayMove(ai, goal, 1)
    if f15_local2 == 0 then
        right = 0
    elseif f15_local2 == 1 then
        right = 1
    elseif f15_local2 == 2 then
        if random <= 50 then
            right = 0
        else
            right = 1
        end
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_SELF, 0, 0, 0)
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    end
    ai:SetNumber(10, right)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, right, ai:GetRandam_Int(30, 45), true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act28 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 1.5
    local goalLife_2 = 1.5
    local angleThreshold = ai:GetRandam_Int(30, 45)
    local guardStateId = -1
    local right = ai:GetRandam_Int(0, 1)
    if distanceEnemy <= 3 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId)
    elseif distanceEnemy <= 8 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife_2, TARGET_ENE_0, 3, TARGET_SELF, true, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife_2, TARGET_ENE_0, 5, TARGET_SELF, false, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Interrupt = function (self, ai, goal)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    local random = ai:GetRandam_Int(1, 100)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaRatioSelf = ai:GetSpRate(TARGET_SELF)
    local number11 = ai:GetNumber(11)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if ai:IsInterupt(INTERUPT_Shoot) then
        return self.ShootReaction(ai, goal)
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        if ai:HasSpecialEffectId(TARGET_SELF, 200030) then
            return Common_Parry(ai, goal, 100, 0, 0, 3103)
        else
            return Common_Parry(ai, goal, 100, 0)
        end
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        return self.Damaged(ai, goal)
    end
    if Interupt_PC_Break(ai) then
        ai:Replanning()
        return true
    end
    if Interupt_Use_Item(ai, 4, 10) then
        if ai:HasSpecialEffectId(TARGET_SELF, 200030) then
            ai:Replanning()
            return true
        elseif distanceEnemy <= 5 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3010, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        elseif distanceEnemy <= 10 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5200, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 0)
            return true
        else
            ai:Replanning()
            return true
        end
    end
    local f17_local5 = 60
    local f17_local6 = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local f17_local7 = 2.5
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if ai:GetSpecialEffectActivateInterruptType(0) == 5027 and ai:HasSpecialEffectId(TARGET_SELF, 200030) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3031, TARGET_ENE_0, 9999, 0)
            return true
        end
        if ai:GetSpecialEffectActivateInterruptType(0) == 5025 then
            if ai:HasSpecialEffectId(TARGET_SELF, 200030) and ai:GetHpRate(TARGET_ENE_0) == 0 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 5, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
                return true
            elseif ai:HasSpecialEffectId(TARGET_SELF, 200031) and ai:HasSpecialEffectId(TARGET_ENE_0, 110125) then
                ai:Replanning()
                return true
            end
        end
        if ai:GetSpecialEffectActivateInterruptType(0) == 200031 then
            ai:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, f17_local5, f17_local6)
            ai:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 200, f17_local7)
            return true
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 200030 then
            ai:DeleteObserve(0)
            ai:DeleteObserve(1)
            return true
        end
        if ai:GetSpecialEffectActivateInterruptType(0) == 5029 and ai:GetNumber(5) == 0 then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) and distanceEnemy <= 2 and not ai:HasSpecialEffectId(TARGET_ENE_0, 110125) then
                goal:ClearSubGoal()
                if random <= 70 then
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3033, TARGET_ENE_0, 9999, 0):TimingSetTimer(9, 0.1, AI_TIMING_SET__ACTIVATE)
                elseif random <= 85 then
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3035, TARGET_ENE_0, 9999, 0):TimingSetTimer(9, 0.1, AI_TIMING_SET__ACTIVATE)
                else
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3034, TARGET_ENE_0, 9999, 0):TimingSetTimer(9, 0.1, AI_TIMING_SET__ACTIVATE)
                end
                ai:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, f17_local5, f17_local6)
                return true
            elseif SpaceCheck(ai, goal, -90, 1) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) and distanceEnemy <= 4 then
                ai:SetNumber(12, 1)
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3035, TARGET_ENE_0, 9999, 0):TimingSetTimer(9, 0.1, AI_TIMING_SET__ACTIVATE)
                ai:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, f17_local5, f17_local6)
                return true
            elseif SpaceCheck(ai, goal, 90, 1) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 90) and distanceEnemy <= 4 then
                ai:SetNumber(12, 1)
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3034, TARGET_ENE_0, 9999, 0):TimingSetTimer(9, 0.1, AI_TIMING_SET__ACTIVATE)
                ai:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, f17_local5, f17_local6)
                return true
            elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) and distanceEnemy <= 2 and not ai:HasSpecialEffectId(TARGET_ENE_0, 110125) then
                if number11 >= 2 or staminaRatioSelf < 0.6 then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1, 3033, TARGET_ENE_0, 9999, 0)
                    return true
                elseif ai:HasSpecialEffectId(TARGET_SELF, 200031) and number11 == 0 then
                    goal:ClearSubGoal()
                    ai:SetNumber(11, ai:GetNumber(11) + 1)
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1, 3010, TARGET_ENE_0, 9999, 0)
                    return true
                end
            end
        end
    end
    if ai:IsInterupt(INTERUPT_InactivateSpecialEffect) and ai:GetSpecialEffectInactivateInterruptType(0) == 5026 then
        if distanceEnemy < 2 and ai:GetNumber(1) == 0 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1, 3033, TARGET_ENE_0, 9999, 0)
            return true
        else
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3012, TARGET_ENE_0, 9999, 0)
            return true
        end
    end
    if ai:GetNumber(5) == 1 then
        return false
    end
    if ai:IsInterupt(INTERUPT_Inside_ObserveArea) then
        if ai:IsInsideObserve(1) and ai:HasSpecialEffectId(TARGET_SELF, 200031) and number11 == 0 then
            if ai:HasSpecialEffectId(TARGET_SELF, 200031) and (ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) or ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 90)) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 5201, TARGET_ENE_0, 9999, 0, 0, 0, 0)
                return true
            elseif ai:HasSpecialEffectId(TARGET_SELF, 5028) then
                ai:SetNumber(12, 1)
                ai:Replanning()
                return true
            else
                ai:SetNumber(11, ai:GetNumber(11) + 1)
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3010, TARGET_ENE_0, 9999, 0, 0, 0, 0):TimingSetTimer(9, 4, AI_TIMING_SET__ACTIVATE)
                return true
            end
        elseif not ai:IsInsideObserve(0) or number11 ~= 0 or not ai:HasSpecialEffectId(TARGET_SELF, 200031) or not (ai:GetHpRate(TARGET_ENE_0) > 0) or number11 ~= 0 or ai:GetNumber(12) == 1 then
        elseif number11 == 0 and ai:IsFinishTimer(9) == true and random <= 80 and not ai:HasSpecialEffectId(TARGET_ENE_0, 110125) then
            goal:ClearSubGoal()
            ai:SetNumber(11, ai:GetNumber(11) + 1)
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1.5, 3010, TARGET_ENE_0, 9999, 0, 0, 0, 0):TimingSetTimer(9, 4, AI_TIMING_SET__ACTIVATE)
            return true
        elseif ai:IsFinishTimer(9) == true and random > 80 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 5201, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        end
    end
    return false
end

Goal.Parry = function (ai, goal, f18_arg2, f18_arg3)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f18_local1 = GetDist_Parry(ai)
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    local random_3 = ai:GetRandam_Int(1, 100)
    local hasEffect109970 = ai:HasSpecialEffectId(TARGET_ENE_0, 109970)
    local hasEffectCOMMON_SP_EFFECT_PC_ATTACK_RUSH = ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_ATTACK_RUSH)
    local f18_local7 = -1
    local f18_local8 = 3.7
    if ai:HasSpecialEffectId(TARGET_SELF, 221000) then
        f18_local7 = 0
    elseif ai:HasSpecialEffectId(TARGET_SELF, 221001) then
        f18_local7 = 1
    elseif ai:HasSpecialEffectId(TARGET_SELF, 221002) then
        f18_local7 = 2
    end
    if ai:IsFinishTimer(AI_TIMER_PARRY_INTERVAL) == false then
        return false
    end
    if f18_local7 == -1 then
        return false
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 220062) then
        return false
    end
    if ai:HasSpecialEffectId(TARGET_ENE_0, 110450) or ai:HasSpecialEffectId(TARGET_ENE_0, 110501) or ai:HasSpecialEffectId(TARGET_ENE_0, 110500) then
        return false
    end
    ai:SetTimer(AI_TIMER_PARRY_INTERVAL, 0.1)
    if f18_arg2 == nil then
        f18_arg2 = 50
    end
    if f18_arg3 == nil then
        f18_arg3 = 0
    end
    if stepType == nil then
        stepType = 0
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 200030) then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) and ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 90, f18_local1) then
            if hasEffectCOMMON_SP_EFFECT_PC_ATTACK_RUSH then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3033, TARGET_ENE_0, 9999, 0)
                return true
            elseif hasEffect109970 then
                if ai:IsTargetGuard(TARGET_SELF) and ReturnKengekiSpecialEffect(ai) == false then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
                    return true
                else
                    if f18_local7 == 2 then
                        return false
                    elseif f18_local7 == 1 then
                        if random <= 50 then
                            goal:ClearSubGoal()
                            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
                            return true
                        end
                    elseif f18_local7 == 0 and random <= 100 then
                        if distanceEnemy >= 3 then
                            goal:ClearSubGoal()
                            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3033, TARGET_ENE_0, 9999, 0)
                            return true
                        else
                            goal:ClearSubGoal()
                            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
                            return true
                        end
                    end
                    return false
                end
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3033, TARGET_ENE_0, 9999, 0)
                return true
            end
        elseif ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 90, f18_local1 + 1) then
            if stepType ~= -1 and random_3 <= f18_arg3 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3033, TARGET_ENE_0, 9999, 0)
                return true
            else
                return false
            end
        elseif ai:HasSpecialEffectId(TARGET_SELF, 200031) then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) and ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 90, f18_local1) then
                if hasEffectCOMMON_SP_EFFECT_PC_ATTACK_RUSH then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3100, TARGET_ENE_0, 9999, 0)
                    return true
                elseif hasEffect109970 then
                    if ai:IsTargetGuard(TARGET_SELF) and ReturnKengekiSpecialEffect(ai) == false then
                        goal:ClearSubGoal()
                        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 5201, TARGET_ENE_0, 9999, 0)
                        ai:SetNumber(4, 1)
                        return true
                    else
                        if f18_local7 == 2 then
                            return false
                        elseif f18_local7 == 1 then
                            if random <= 50 then
                                goal:ClearSubGoal()
                                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
                                return true
                            end
                        elseif f18_local7 == 0 and random <= 100 then
                            ai:DeleteObserve(0)
                            ai:DeleteObserve(1)
                            goal:ClearSubGoal()
                            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.4, 5201, TARGET_ENE_0, 9999, 0)
                            return true
                        end
                        return false
                    end
                elseif ai:HasSpecialEffectId(TARGET_ENE_0, 109980) and stepType ~= -1 and f18_local7 == 0 then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
                    return true
                elseif random_2 <= Get_ConsecutiveGuardCount(ai) * f18_arg2 then
                    ai:DeleteObserve(0)
                    ai:DeleteObserve(1)
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
                    return true
                else
                    ai:DeleteObserve(0)
                    ai:DeleteObserve(1)
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3100, TARGET_ENE_0, 9999, 0)
                    return true
                end
            elseif ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 90, f18_local1 + 1) then
                if stepType ~= -1 and random_3 <= f18_arg3 then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
                    return true
                else
                    return false
                end
            else
                return false
            end
        end
    end
    return false
end

Goal.Damaged = function (ai, goal, f19_arg2)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    local f19_local4 = 0
    if ai:HasSpecialEffectId(TARGET_SELF, 200030) then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3031, TARGET_ENE_0, 9999, 0)
        return true
    end
    return false
end

Goal.ShootReaction = function (ai, goal)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = distanceEnemy * 0.01
    if ai:HasSpecialEffectId(TARGET_SELF, 200030) then
        if ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 20, 999) then
            if distanceEnemy <= 15 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3100, TARGET_ENE_0, 9999, 0)
                return true
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_Wait, goalLife, TARGET_SELF, 0, 0, 0)
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3100, TARGET_ENE_0, 9999, 0)
                return true
            end
        end
    elseif distanceEnemy <= 20 then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3100, TARGET_ENE_0, 9999, 0)
        return true
    else
        goal:ClearSubGoal()
        if SpaceCheck(ai, goal, -45, 2) == true then
            if SpaceCheck(ai, goal, 45, 2) == true then
                if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 5202, TARGET_ENE_0, 9999, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 5203, TARGET_ENE_0, 9999, 0)
                end
            else
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 5202, TARGET_ENE_0, 9999, 0)
            end
        elseif SpaceCheck(ai, goal, 45, 2) == true then
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 5203, TARGET_ENE_0, 9999, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Wait, goalLife, TARGET_SELF, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3100, TARGET_ENE_0, 9999, 0)
        end
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
    if staminaSelf <= 0 then
        probabilities[50] = 100
    elseif kengekiEffect == 200200 then
        if distanceEnemy >= 2.8 then
            probabilities[8] = 100
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[50] = 100
        else
            probabilities[8] = 100
            probabilities[50] = 100
        end
    elseif kengekiEffect == 200201 then
        if distanceEnemy >= 2.8 then
            probabilities[9] = 100
            probabilities[50] = 1
        else
            probabilities[9] = 100
            probabilities[50] = 1
        end
    elseif kengekiEffect == 200205 then
        if distanceEnemy >= 2.8 then
            probabilities[1] = 100
            probabilities[50] = 1
        elseif distanceEnemy <= 0.2 then
            probabilities[2] = 20
            probabilities[50] = 80
        else
            probabilities[1] = 100
            probabilities[2] = 100
            probabilities[50] = 1
        end
    elseif kengekiEffect == 200206 then
        if distanceEnemy >= 2.8 then
            probabilities[5] = 100
            probabilities[50] = 1
        elseif distanceEnemy <= 0.2 then
            probabilities[6] = 50
            probabilities[24] = 20
            probabilities[50] = 30
        else
            probabilities[5] = 100
            probabilities[6] = 50
            probabilities[50] = 1
        end
    elseif kengekiEffect == 200215 then
        if distanceEnemy >= 2.8 then
            probabilities[10] = 40
            probabilities[11] = 20
            probabilities[50] = 40
        elseif distanceEnemy <= 0.2 then
            probabilities[10] = 100
            probabilities[50] = 1
        else
            probabilities[10] = 100
            probabilities[50] = 1
        end
    elseif kengekiEffect == 200216 then
        if distanceEnemy >= 2.8 then
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[13] = 100
            probabilities[50] = 1
        else
            probabilities[5] = 100
            probabilities[12] = 100
            probabilities[50] = 1
        end
    end
    if ai:IsFinishTimer(6) == false or ai:GetNumber(5) <= 6 then
        probabilities[6] = 0
        probabilities[13] = 0
    end
    if ai:IsFinishTimer(7) == false then
        probabilities[12] = 0
    end
    probabilities[1] = 0
    probabilities[2] = 0
    probabilities[3] = 0
    probabilities[4] = 0
    probabilities[5] = 0
    probabilities[6] = 0
    probabilities[8] = 0
    probabilities[9] = 0
    probabilities[10] = 0
    probabilities[11] = 0
    probabilities[12] = 0
    probabilities[13] = 0
    probabilities[14] = 0
    probabilities[15] = 0
    if kengekiEffect == 200228 then
        if distanceEnemy <= 2.8 then
            probabilities[14] = 100
            probabilities[15] = 0
        end
    elseif kengekiEffect == 200210 or kengekiEffect == 200211 then
        if distanceEnemy <= 2.8 then
            probabilities[14] = 100
            probabilities[15] = 100
            probabilities[17] = 20
        end
    elseif kengekiEffect == 200215 or kengekiEffect == 200216 then
        if distanceEnemy <= 2.8 then
            probabilities[14] = 100
            probabilities[15] = 0
        end
    elseif (kengekiEffect == 200200 or kengekiEffect == 200201) and distanceEnemy <= 2.8 then
        probabilities[14] = 0
        probabilities[15] = 50
        probabilities[50] = 50
        probabilities[12] = 100
        probabilities[14] = 100
        probabilities[17] = 100
    end
    if SpaceCheck(ai, goal, 90, 2) == false and SpaceCheck(ai, goal, -90, 2) == false then
        probabilities[17] = 0
    end
    if SpaceCheck(ai, goal, 180, 2) == false then
        probabilities[12] = 0
        probabilities[14] = probabilities[14] * 5
    end
    acts[1] = REGIST_FUNC(ai, goal, self.Kengeki01)
    acts[2] = REGIST_FUNC(ai, goal, self.Kengeki02)
    acts[5] = REGIST_FUNC(ai, goal, self.Kengeki05)
    acts[6] = REGIST_FUNC(ai, goal, self.Kengeki06)
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
    acts[24] = REGIST_FUNC(ai, goal, self.Act24)
    acts[50] = REGIST_FUNC(ai, goal, self.NoAction)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    return Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki14 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local animationId = 3066
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    if ai:HasSpecialEffectId(TARGET_SELF, 200031) then
    elseif random <= 50 then
        animationId = 3083
        if ai:HasSpecialEffectId(TARGET_SELF, 200210) then
            animationId = 3087
        end
    end
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, animationId, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki15 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local animationId = 3031
    local animationId_2 = 3066
    local turnTime = 0
    local turnFaceAngle = 0
    goal:ClearSubGoal()
    ai:SetNumber(5, 0)
    ai:SetNumber(1, 1)
    if SpaceCheck(ai, goal, 180, 2) == false then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    elseif distanceEnemy <= 2.4 then
        ai:SetNumber(4, ai:GetNumber(4) + 1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 15, animationId_2, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    else
        ai:SetNumber(4, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    end
end

Goal.Kengeki16 = function (ai, goal, paramTbl)
    local animationId = 3057
    local animationId_2 = 3017
    local turnTime = 0
    local turnFaceAngle = 0
    goal:ClearSubGoal()
    if ai:GetNumber(5) >= 15 or ai:GetStringIndexedNumber("spFlag") >= 3 then
        ai:SetNumber(5, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0):TimingSetTimer(6, 8, AI_TIMING_SET__ACTIVATE)
    else
        ai:SetTimer(6, 8)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3077, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
    end
end

Goal.Kengeki17 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local animationId = 3034
    local f25_local2 = 3035
    local random = ai:GetRandam_Int(1, 100)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:ClearSubGoal()
    ai:SetNumber(5, 0)
    if SpaceCheck(ai, goal, -90, 2) and SpaceCheck(ai, goal, 90, 2) then
        if random <= 50 then
            animationId = 3035
        end
    elseif SpaceCheck(ai, goal, -90, 2) == true then
        animationId = 3035
    else
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    local animationId = 3050
    local animationId_2 = 3013
    local animationId_3 = 3014
    local successDist = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    if random <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, successDist_2, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    elseif random <= 70 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
    end
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    local animationId = 3051
    local animationId_2 = 3016
    local animationId_3 = 3017
    local successDist = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    if ai:GetNumber(5) >= 15 or ai:GetStringIndexedNumber("spFlag") >= 3 then
        ai:SetNumber(5, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, successDist_2, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    elseif ai:IsFinishTimer(6) == true then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE):TimingSetTimer(6, 8, AI_TIMING_SET__ACTIVATE)
    end
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    local animationId = 3056
    local animationId_2 = 3012
    local animationId_3 = 3013
    local animationId_4 = 3014
    local successDist = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f28_local6 = 5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    if random <= 30 or ai:GetNumber(7) >= 3 then
        ai:SetNumber(7, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, successDist_2, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_3, TARGET_ENE_0, 9999, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_4, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 4, AI_TIMING_SET__ACTIVATE)
    elseif random <= 60 then
        ai:SetNumber(7, ai:GetNumber(7) + 1)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, successDist_2, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    elseif random <= 90 then
        ai:SetNumber(7, ai:GetNumber(7) + 1)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
    elseif random <= 100 then
        ai:SetNumber(7, ai:GetNumber(7) + 1)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    local animationId = 3057
    local animationId_2 = 3017
    local turnTime = 0
    local turnFaceAngle = 0
    if ai:GetNumber(5) >= 15 or ai:GetStringIndexedNumber("spFlag") >= 3 then
        ai:SetNumber(5, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0):TimingSetTimer(6, 8, AI_TIMING_SET__ACTIVATE)
    else
        ai:SetTimer(6, 8)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3077, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
    end
end

Goal.Kengeki08 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    ai:SetNumber(MENFLAG, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3060, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki09 = function (ai, goal, paramTbl)
    local animationId = 3065
    local animationId_2 = 3012
    local animationId_3 = 3013
    local animationId_4 = 3014
    local successDist = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f31_local6 = 5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    if random <= 10 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, successDist_2, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_3, TARGET_ENE_0, 9999, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_4, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 4, AI_TIMING_SET__ACTIVATE)
    elseif random <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, successDist_2, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    elseif random <= 65 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 1, AI_TIMING_SET__ACTIVATE)
    end
end

Goal.Kengeki13 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    local animationId = 3077
    local animationId_2 = 3017
    local turnTime = 0
    local turnFaceAngle = 0
    if ai:GetNumber(5) >= 15 or ai:GetStringIndexedNumber("spFlag") >= 3 then
        ai:SetNumber(5, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0)
    else
        ai:SetTimer(6, 8)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3077, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 2, AI_TIMING_SET__ACTIVATE)
    end
end

Goal.Kengeki10 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    ai:SetNumber(5, ai:GetNumber(5) + 1)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3071, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki11 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    ai:SetNumber(5, ai:GetNumber(5) + 3)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3073, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki12 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    ai:SetNumber(5, ai:GetNumber(5) + 1)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3076, TARGET_ENE_0, 9999, 0, 0):TimingSetTimer(7, 20, AI_TIMING_SET__ACTIVATE)
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

