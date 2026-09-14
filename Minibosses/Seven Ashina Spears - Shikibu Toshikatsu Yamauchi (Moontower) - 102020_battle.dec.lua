RegisterTableGoal(GOAL_SamuraiTaisho_102020_Battle, "GOAL_SamuraiTaisho_102020_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Template_XXXXYY_Battle, true)

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
    local f2_local5 = Check_ReachAttack(ai, 0)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 109031)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110125)
    Set_ConsecutiveGuardCount_Interrupt(ai)
    if self.Kengeki_Activate(self, ai, goal) then
        return
    end
    if Common_ActivateAct(ai, goal) then
    elseif f2_local5 ~= POSSIBLE_ATTACK then
        if paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
            probabilities[27] = 100
        elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
            probabilities[27] = 100
        elseif f2_local5 == UNREACH_ATTACK then
            probabilities[27] = 100
        elseif f2_local5 == REACH_ATTACK_TARGET_HIGH_POSITION then
            probabilities[1] = 100
            probabilities[7] = 100
        elseif f2_local5 == REACH_ATTACK_TARGET_LOW_POSITION then
            probabilities[1] = 100
            probabilities[7] = 100
        else
            probabilities[27] = 100
        end
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        KankyakuAct(ai, goal)
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        TorimakiAct(ai, goal, -1, 0)
    elseif ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_BREAK) then
        probabilities[5] = 100
        probabilities[9] = 100
    elseif distanceEnemy >= 7 then
        probabilities[1] = 10
        probabilities[2] = 30
        probabilities[4] = 20
        probabilities[5] = 100
        probabilities[6] = 60
        probabilities[7] = 10
        probabilities[8] = 40
        probabilities[10] = 80
    elseif distanceEnemy >= 5 then
        probabilities[1] = 50
        probabilities[2] = 30
        probabilities[4] = 20
        probabilities[6] = 100
        probabilities[7] = 100
        probabilities[8] = 100
        probabilities[10] = 100
        probabilities[23] = 100
    elseif distanceEnemy > 3 then
        probabilities[1] = 50
        probabilities[2] = 30
        probabilities[4] = 20
        probabilities[6] = 100
        probabilities[7] = 100
        probabilities[8] = 10
        probabilities[10] = 10
        probabilities[11] = 100
        probabilities[23] = 100
    else
        probabilities[1] = 10
        probabilities[2] = 10
        probabilities[3] = 100
        probabilities[4] = 10
        probabilities[6] = 100
        probabilities[7] = 100
        probabilities[8] = 0
        probabilities[11] = 100
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
    if ai:IsFinishTimer(0) == false then
        probabilities[6] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 10, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3006, 10, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3011, 10, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3012, 10, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3005, 10, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3010, 10, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3003, 20, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3013, 20, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3016, 20, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3007, 10, probabilities[10], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3008, 10, probabilities[11], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3081, 10, probabilities[11], 1)
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
    acts[30] = REGIST_FUNC(ai, goal, self.Act30)
    acts[31] = REGIST_FUNC(ai, goal, self.Act31)
    acts[40] = REGIST_FUNC(ai, goal, self.Act40)
    acts[41] = REGIST_FUNC(ai, goal, self.Act41)
    acts[42] = REGIST_FUNC(ai, goal, self.Act42)
    acts[43] = REGIST_FUNC(ai, goal, self.Act43)
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

Goal.Act01 = function (ai, goal, paramTbl)
    local stopDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local f3_local8 = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3015, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3002, TARGET_ENE_0, 9999, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local stopDist = 5.4 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 5.4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 5.4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3006, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3066, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local stopDist = 3.3 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.3 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 3.3 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f5_local7 = 10 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist = 5.4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3011, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3000, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3012, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act05 = function (ai, goal, paramTbl)
    local stopDist = 10 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 10 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 10 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act06 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3010, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
    ai:SetTimer(0, 12)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    local stopDist = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3003, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3013, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act09 = function (ai, goal, paramTbl)
    local f11_local0 = 0
    local f11_local1 = 0
    local stopDist = 9 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 9 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 9 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f11_local9 = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3016, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local stopDist = 7 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 7 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 7 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act20 = function (ai, goal, paramTbl)
    local stopDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local f13_local8 = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3090, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3091, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3092, TARGET_ENE_0, 9999, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act11 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3008, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
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
    local animationId = 5202
    if SpaceCheck(ai, goal, -45, 2) == true then
        if SpaceCheck(ai, goal, 45, 2) == true then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                animationId = 5202
            else
                animationId = 5203
            end
        else
            animationId = 5202
        end
    elseif SpaceCheck(ai, goal, 45, 2) == true then
        animationId = 5203
    else
    end
    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_R, 0)
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
    local goalLife = 3
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
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    local stopDist = distanceYEnemy / math.tan(math.deg(30))
    local right = ai:GetRandam_Int(0, 1)
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
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 10, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, right, ai:GetRandam_Int(30, 45), true, true, -1)
            ai:SetNumber(10, right)
        end
    elseif SpaceCheck(ai, goal, 0, 4) == true then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 0.1, TARGET_ENE_0, 0, TARGET_SELF, false, -1)
    elseif SpaceCheck(ai, goal, 0, 3) == true then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 0.5, TARGET_ENE_0, 0, TARGET_SELF, true, -1)
    elseif SpaceCheck(ai, goal, 0, 1) == false then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 0.5, TARGET_ENE_0, 999, TARGET_ENE_0, true, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, right, ai:GetRandam_Int(30, 45), true, true, -1)
        ai:SetNumber(10, right)
    end
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
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife_2, TARGET_ENE_0, 8, TARGET_SELF, false, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act31 = function (ai, goal, paramTbl)
    local stopDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f23_local7 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local f23_local8 = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act40 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3050, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act41 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3055, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act42 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act43 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Interrupt = function (self, ai, goal)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    local f28_local1 = ai:GetSpecialEffectInactivateInterruptType(0)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        return Common_Parry(ai, goal, 50, 0, 2, 3102)
    end
    if ai:IsInterupt(INTERUPT_Damaged) and self.Damaged(ai, goal) then
        return true
    end
    if Interupt_PC_Break(ai) then
        ai:Replanning()
        return true
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if interruptEffect == 5025 and distanceEnemy <= 7 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 7, 3014, TARGET_ENE_0, 9999, 0, 0)
        end
        if interruptEffect == 5026 and distanceEnemy >= 6 and distanceEnemy <= 8 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 7, 3017, TARGET_ENE_0, 9999, 0, 0)
        end
        if interruptEffect == 5027 then
            if random <= 25 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 7, 3080, TARGET_ENE_0, 9999, 0, 0)
            elseif random <= 50 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 7, 3083, TARGET_ENE_0, 9999, 0, 0)
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 7, 3082, TARGET_ENE_0, 9999, 0, 0)
            end
        end
    end
    if Interupt_Use_Item(ai, 2, 5) then
        if distanceEnemy <= 9 - ai:GetMapHitRadius(TARGET_SELF) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3016, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        else
            ai:Replanning()
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_ShootImpact) and self.ShootReaction(ai, goal) then
        return true
    end
    return false
end

Goal.ShootReaction = function (f29_arg0, goal)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3102, TARGET_ENE_0, 9999, 0)
    return true
end

Goal.Kengeki_Activate = function (self, ai, goal, f30_arg3)
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
        if distanceEnemy >= 3.5 then
            probabilities[3] = 100
            probabilities[8] = 100
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[1] = 100
            probabilities[2] = 100
            probabilities[3] = 100
            probabilities[8] = 100
        else
            probabilities[1] = 100
            probabilities[2] = 100
            probabilities[3] = 100
            probabilities[8] = 100
            probabilities[9] = 100
        end
    elseif kengekiEffect == 200201 then
        if distanceEnemy >= 3.5 then
            probabilities[6] = 100
            probabilities[8] = 100
            probabilities[11] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[1] = 50
            probabilities[2] = 50
            probabilities[10] = 100
            probabilities[11] = 100
        else
            probabilities[1] = 50
            probabilities[2] = 50
            probabilities[10] = 300
            probabilities[11] = 100
        end
    elseif kengekiEffect == 200205 then
        probabilities[1] = 100
        probabilities[2] = 100
    elseif kengekiEffect == 200206 then
        probabilities[1] = 100
        probabilities[2] = 100
    elseif kengekiEffect == 200211 then
        probabilities[1] = 100
        probabilities[2] = 100
        probabilities[5] = 100
        probabilities[8] = 100
    elseif kengekiEffect == 200216 then
        probabilities[1] = 100
        probabilities[2] = 100
        probabilities[5] = 100
        probabilities[8] = 100
    else
        probabilities[50] = 100
    end
    if SpaceCheck(ai, goal, 180, 2) == true then
        probabilities[24] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3050, 10, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3055, 10, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3006, 10, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3005, 10, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3010, 10, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3007, 10, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3016, 20, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3008, 20, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3060, 20, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3065, 20, probabilities[10], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3056, 10, probabilities[11], 1)
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
    acts[24] = REGIST_FUNC(ai, goal, self.Kengeki24)
    acts[30] = REGIST_FUNC(ai, goal, self.Kengeki30)
    acts[50] = REGIST_FUNC(ai, goal, self.NoAction)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    return Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3050, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3055, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3015, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3010, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
    ai:SetTimer(0, 12)
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3007, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki07 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki08 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3008, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki09 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3060, TARGET_ENE_0, 9999, 0, 0)
    ai:SetTimer(0, 12)
end

Goal.Kengeki10 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3065, TARGET_ENE_0, 9999, 0, 0)
    ai:SetTimer(0, 12)
end

Goal.Kengeki11 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3057, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki24 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 5211, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
end

Goal.Kengeki30 = function (ai, goal, paramTbl)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local f43_local1 = 0
    local random = ai:GetRandam_Int(1, 100)
    local f43_local3 = 9910
    local right = 0
    if SpaceCheck(ai, goal, -90, 1) == true then
        if SpaceCheck(ai, goal, 90, 1) == true then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
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
        GetWellSpace_Odds = 100
        return GetWellSpace_Odds
    end
    local angleThreshold = ai:GetRandam_Int(60, 90)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2, TARGET_ENE_0, right, angleThreshold, true, true, -1)
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

