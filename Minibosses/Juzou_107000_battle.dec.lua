RegisterTableGoal(GOAL_SyuraSamurai_107000_Battle, "GOAL_SyuraSamurai_107000_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_SyuraSamurai_107000_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
end

Goal.Activate = function (self, ai, goal)
    Init_Pseudo_Global(ai, goal)
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local maxDistance = ai:GetDist(TARGET_ENE_0)
    local distanceYEnemy = ai:GetDistY(TARGET_ENE_0)
    local paramDoAdmire = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local staminaRatioSelf = ai:GetSpRate(TARGET_SELF)
    local f2_local8 = Check_ReachAttack(ai, 0)
    Set_ConsecutiveGuardCount_Interrupt(ai)
    if self.Kengeki_Activate(self, ai, goal) then
        return
    end
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 200225)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 3107001)
    local f2_local9 = 0
    if ai:IsTargetGuard(TARGET_ENE_0) then
        f2_local9 = 3
    end
    if Common_ActivateAct(ai, goal) then
    elseif f2_local8 ~= POSSIBLE_ATTACK then
        if paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
            probabilities[27] = 100
        elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
            probabilities[27] = 100
        elseif f2_local8 == UNREACH_ATTACK then
            probabilities[27] = 200
            probabilities[8] = 100
            probabilities[20] = 100
        elseif f2_local8 == REACH_ATTACK_TARGET_HIGH_POSITION then
            probabilities[6] = 200
            probabilities[12] = 100
        elseif f2_local8 == REACH_ATTACK_TARGET_LOW_POSITION then
            probabilities[1] = 300
        else
            probabilities[27] = 100
        end
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        KankyakuAct(ai, goal)
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        if TorimakiAct(ai, goal) then
            probabilities[8] = 100
            probabilities[9] = 100
        end
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) and maxDistance <= 5 then
        probabilities[21] = 100
    elseif not ai:IsExistMeshOnLine(TARGET_ENE_0, AI_DIR_TYPE_ToB, maxDistance) then
        probabilities[30] = 100
        probabilities[31] = 100
    elseif ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_BREAK) then
        if maxDistance >= 5 then
            probabilities[12] = 100
        else
            probabilities[6] = 100
        end
    else
        if maxDistance >= 7 then
            probabilities[1] = 0
            probabilities[2] = 0
            probabilities[3] = 0
            probabilities[4] = 0
            probabilities[5] = 0
            probabilities[6] = 0
            probabilities[7] = 200
            probabilities[8] = 2000
            probabilities[9] = 800
            probabilities[10] = 2000
            probabilities[12] = 100
            probabilities[13] = 0
            probabilities[23] = 0
        elseif maxDistance >= 5 then
            probabilities[1] = 100
            probabilities[2] = 0
            probabilities[3] = 100
            probabilities[4] = 100
            probabilities[5] = 50
            probabilities[6] = 50
            probabilities[7] = 100
            probabilities[8] = 2000
            probabilities[9] = 500
            probabilities[10] = 500
            probabilities[12] = 100
            probabilities[13] = 100
            probabilities[23] = 200
        elseif maxDistance >= 3 then
            probabilities[1] = 100
            probabilities[2] = 150
            probabilities[3] = 100
            probabilities[4] = 150
            probabilities[5] = 100
            probabilities[6] = 150
            probabilities[7] = 0
            probabilities[8] = 100
            probabilities[9] = 0
            probabilities[10] = 0
            probabilities[11] = 100
            probabilities[12] = 100
            probabilities[13] = 100
            probabilities[23] = 200
        else
            probabilities[1] = 200
            probabilities[2] = 100
            probabilities[3] = 100
            probabilities[4] = 0
            probabilities[5] = 50
            probabilities[6] = 50
            probabilities[7] = 0
            probabilities[8] = 0
            probabilities[9] = 0
            probabilities[11] = 400
            probabilities[12] = 200
            probabilities[13] = 200
            probabilities[23] = 100
            if ai:HasSpecialEffectId(TARGET_ENE_0, 109012) then
                probabilities[1] = 0
                probabilities[3] = 0
                probabilities[4] = 0
                probabilities[5] = 0
            end
        end
        if hpRatioSelf <= 0.25 or staminaRatioSelf <= 0.25 then
            probabilities[8] = 0
            probabilities[9] = 0
            probabilities[10] = 0
        end
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 3107010) or ai:HasSpecialEffectId(TARGET_SELF, 3107011) then
        probabilities[1] = probabilities[1] * 3
        probabilities[3] = probabilities[3] * 3
        probabilities[12] = probabilities[12] * 3
        probabilities[13] = probabilities[13] * 3
    elseif f2_local9 > 0 then
        probabilities[2] = probabilities[2] * (f2_local9 / 2)
        probabilities[4] = probabilities[4] * (f2_local9 / 2)
        probabilities[5] = probabilities[5] * (f2_local9 / 2)
        probabilities[11] = probabilities[11] * f2_local9
    end
    if ai:HasSpecialEffectId(TARGET_ENE_0, 90) or ai:HasSpecialEffectId(TARGET_ENE_0, 110125) then
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 90, 1) == false and SpaceCheck(ai, goal, -45, 1) == false then
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 180, 1) == false then
        probabilities[25] = 0
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 200051) then
        probabilities[8] = 0
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 200050) then
        probabilities[9] = 0
        probabilities[10] = 0
        probabilities[20] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 5, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3002, 5, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3004, 5, probabilities[3], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3062, 5, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3006, 7, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3007, 5, probabilities[5], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3090, 3, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3009, 7, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3010, 5, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3011, 20, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3012, 8, probabilities[9], 1)
    probabilities[20] = SetCoolTime(ai, goal, 3012, 8, probabilities[20], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3014, 10, probabilities[10], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3015, 16, probabilities[11], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3016, 8, probabilities[12], 1)
    probabilities[13] = SetCoolTime(ai, goal, 3017, 8, probabilities[13], 1)
    probabilities[23] = SetCoolTime(ai, goal, 405002, 4, probabilities[23], 1)
    probabilities[23] = SetCoolTime(ai, goal, 405003, 4, probabilities[23], 1)
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
    acts[20] = REGIST_FUNC(ai, goal, self.Act20)
    acts[21] = REGIST_FUNC(ai, goal, self.Act21)
    acts[23] = REGIST_FUNC(ai, goal, self.Act23)
    acts[25] = REGIST_FUNC(ai, goal, self.Act25)
    acts[26] = REGIST_FUNC(ai, goal, self.Act26)
    acts[27] = REGIST_FUNC(ai, goal, self.Act27)
    acts[28] = REGIST_FUNC(ai, goal, self.Act28)
    acts[30] = REGIST_FUNC(ai, goal, self.Act30)
    acts[31] = REGIST_FUNC(ai, goal, self.Act31)
    acts[41] = REGIST_FUNC(ai, goal, self.Act41)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Act01 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 5.2 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local stopDist = 4.4 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 4.4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, 5.1 - ai:GetMapHitRadius(TARGET_SELF), turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3020, TARGET_ENE_0, 5.3 - ai:GetMapHitRadius(TARGET_SELF), 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3005, TARGET_ENE_0, 5.1 - ai:GetMapHitRadius(TARGET_SELF), 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3020, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local stopDist = 6.1 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.1 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 6.1 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3004, TARGET_ENE_0, 7 - ai:GetMapHitRadius(TARGET_SELF), turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3021, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local stopDist = 7.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 7.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 7.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act05 = function (ai, goal, paramTbl)
    local stopDist = 6.4 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 6.4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 6.3 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3007, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3008, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act06 = function (ai, goal, paramTbl)
    local stopDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3009, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    local stopDist = 7.1 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 7.1 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 7.1 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 5
    local runLife = 10
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3010, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3011, TARGET_SELF, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act09 = function (ai, goal, paramTbl)
    local stopDist = 10 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 10 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 10 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 5
    local runLife = 10
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f11_local7 = 6.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3012, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3022, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3014, TARGET_SELF, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act11 = function (ai, goal, paramTbl)
    local stopDist = 6.3 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.3 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 6.3 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3015, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act12 = function (ai, goal, paramTbl)
    local stopDist = 8.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 8.2 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 8.2 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 5
    local runLife = 10
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3016, TARGET_ENE_0, 7 - ai:GetMapHitRadius(TARGET_SELF), turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3019, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act13 = function (ai, goal, paramTbl)
    local stopDist = 6.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 6.8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3017, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act20 = function (ai, goal, paramTbl)
    local f16_local0 = 10 - ai:GetMapHitRadius(TARGET_SELF)
    local f16_local1 = 10 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f16_local2 = 10 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f16_local3 = 100
    local f16_local4 = 0
    local f16_local5 = 5
    local f16_local6 = 10
    local f16_local7 = 6.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3012, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3022, TARGET_ENE_0, 9999, 0, 0)
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

Goal.Act25 = function (ai, goal, paramTbl)
    local goalLife = ai:GetRandam_Float(2, 4)
    local stopDist = ai:GetRandam_Float(1, 3)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act26 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_SELF, 0, 0, 0)
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
    local f21_local2 = SpaceCheck_SidewayMove(ai, goal, 1)
    if f21_local2 == 0 then
        right = 0
    elseif f21_local2 == 1 then
        right = 1
    elseif f21_local2 == 2 then
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
    if distanceEnemy <= 5 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId)
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife_2, TARGET_ENE_0, 3, TARGET_SELF, true, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act30 = function (ai, goal, paramTbl)
    local stopDist = 1.6
    local canRunDist = stopDist
    local forceRunMinDist = stopDist
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 2.5
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 5.2 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act31 = function (ai, goal, paramTbl)
    local stopDist = 1.6
    local canRunDist = stopDist
    local forceRunMinDist = stopDist
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 2.5
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, 5.1 - ai:GetMapHitRadius(TARGET_SELF), turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3020, TARGET_ENE_0, 5.3 - ai:GetMapHitRadius(TARGET_SELF), 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3005, TARGET_ENE_0, 5.1 - ai:GetMapHitRadius(TARGET_SELF), 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3020, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act41 = function (ai, goal, paramTbl)
    local goalLife = 3.5
    local angleThreshold = ai:GetRandam_Int(30, 45)
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
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, -1)
    return GETWELLSPACE_ODDS
end

Goal.Interrupt = function (self, ai, goal)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        return self.Parry(ai, goal, 50, 0, -1)
    end
    if ai:IsInterupt(INTERUPT_Damaged) and self.Damaged(ai, goal) then
        return true
    end
    if ai:IsInterupt(INTERUPT_ShootImpact) and self.ShootReaction(ai, goal) then
        return true
    end
    if Interupt_PC_Break(ai) then
        ai:Replanning()
        return true
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if ai:GetSpecialEffectActivateInterruptType(0) == 3107001 then
            if ai:HasSpecialEffectId(TARGET_SELF, 3107000) then
                goal:ClearSubGoal()
                if ai:HasSpecialEffectId(TARGET_SELF, 200050) and not ai:IsTargetGuard(TARGET_ENE_0) then
                    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3018, TARGET_ENE_0, 9999, 0, 0)
                elseif ai:HasSpecialEffectId(TARGET_SELF, 200051) then
                    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3022, TARGET_ENE_0, 9999, 0, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3003, TARGET_ENE_0, 9999, 0, 0)
                end
                return true
            else
                return false
            end
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5025 then
            return self.Damaged(ai, goal)
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5026 then
        end
        return false
    end
    return false
end

Goal.Damaged = function (ai, goal, f27_arg2)
    local random = ai:GetRandam_Int(1, 100)
    if ai:HasSpecialEffectId(TARGET_SELF, 5025) then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1, 3103, TARGET_ENE_0, 9999, 0)
        return true
    end
    return false
end

Goal.Parry = function (ai, goal, f28_arg2, f28_arg3, f28_arg4, f28_arg5)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f28_local1 = GetDist_Parry(ai)
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    local random_3 = ai:GetRandam_Int(1, 100)
    local hasEffect109970 = ai:HasSpecialEffectId(TARGET_ENE_0, 109970)
    local hasEffectCOMMON_SP_EFFECT_PC_ATTACK_RUSH = ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_ATTACK_RUSH)
    local f28_local7 = -1
    if ai:HasSpecialEffectId(TARGET_SELF, 221000) then
        f28_local7 = 0
    elseif ai:HasSpecialEffectId(TARGET_SELF, 221001) then
        f28_local7 = 1
    elseif ai:HasSpecialEffectId(TARGET_SELF, 221002) then
        f28_local7 = 2
    end
    if ai:IsFinishTimer(AI_TIMER_PARRY_INTERVAL) == false then
        return false
    end
    if f28_local7 == -1 then
        return false
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 220062) then
        return false
    end
    if ai:HasSpecialEffectId(TARGET_ENE_0, 110450) or ai:HasSpecialEffectId(TARGET_ENE_0, 110501) or ai:HasSpecialEffectId(TARGET_ENE_0, 110500) then
        return false
    end
    ai:SetTimer(AI_TIMER_PARRY_INTERVAL, 0.1)
    if f28_arg2 == nil then
        f28_arg2 = 50
    end
    if f28_arg3 == nil then
        f28_arg3 = 0
    end
    if f28_arg4 == nil then
        f28_arg4 = 0
    end
    if f28_arg5 == nil then
        f28_arg5 = 3100
    end
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) and ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 90, f28_local1) then
        if hasEffectCOMMON_SP_EFFECT_PC_ATTACK_RUSH then
            return false
        elseif hasEffect109970 then
            if ai:IsTargetGuard(TARGET_SELF) and ReturnKengekiSpecialEffect(ai) == false then
                return false
            else
                if f28_local7 == 2 then
                    return false
                elseif f28_local7 == 1 then
                    if random <= 50 then
                        goal:ClearSubGoal()
                        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
                        return true
                    end
                elseif f28_local7 == 0 and random <= 100 then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
                    return true
                end
                return false
            end
        elseif ai:HasSpecialEffectId(TARGET_ENE_0, 109980) and f28_arg4 ~= -1 and f28_local7 == 0 then
            if f28_arg4 == 1 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
                return true
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5211, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
                return true
            end
        elseif random_2 <= Get_ConsecutiveGuardCount(ai) * f28_arg2 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3101, TARGET_ENE_0, 9999, 0)
            return true
        else
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.3, 3100, TARGET_ENE_0, 9999, 0)
            return true
        end
    elseif ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 90, f28_local1 + 1) then
        if f28_arg4 ~= -1 and random_3 <= f28_arg3 then
            if f28_arg4 == 1 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
                return true
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5211, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
                return true
            end
        else
            return false
        end
    else
        return false
    end
end

Goal.ShootReaction = function (f29_arg0, f29_arg1)
    return false
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
    elseif kengekiEffect == 200200 or kengekiEffect == 200205 then
        if distanceEnemy >= 5 then
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[50] = 100
        else
            probabilities[2] = 200
            probabilities[5] = 400
            probabilities[50] = 100
        end
    elseif kengekiEffect == 200201 or kengekiEffect == 200206 then
        if distanceEnemy >= 5 then
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[50] = 100
        else
            probabilities[3] = 300
            probabilities[6] = 400
            probabilities[50] = 100
        end
    elseif kengekiEffect == 200210 or kengekiEffect == 200215 then
        if distanceEnemy >= 5 then
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[50] = 100
        else
            probabilities[2] = 200
            probabilities[5] = 300
        end
    elseif kengekiEffect == 200211 or kengekiEffect == 200216 then
        if distanceEnemy >= 5 then
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[50] = 100
        else
            probabilities[3] = 200
            probabilities[6] = 300
        end
    elseif kengekiEffect == 200225 then
        probabilities[4] = 10000
        if distanceEnemy >= 5 then
        elseif distanceEnemy <= 0.2 then
        else
            probabilities[1] = 200
            probabilities[50] = 100
        end
    else
        probabilities[50] = 1
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 200050) then
        probabilities[4] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3090, 5, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3062, 6, probabilities[2], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3004, 6, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3067, 2, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3091, 2, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3061, 6, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3068, 6, probabilities[6], 1)
    acts[1] = REGIST_FUNC(ai, goal, self.Kengeki01)
    acts[2] = REGIST_FUNC(ai, goal, self.Kengeki02)
    acts[3] = REGIST_FUNC(ai, goal, self.Kengeki03)
    acts[4] = REGIST_FUNC(ai, goal, self.Kengeki04)
    acts[5] = REGIST_FUNC(ai, goal, self.Kengeki05)
    acts[6] = REGIST_FUNC(ai, goal, self.Kengeki06)
    acts[50] = REGIST_FUNC(ai, goal, self.NoAction)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    return Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3090, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3062, TARGET_ENE_0, 7 - ai:GetMapHitRadius(TARGET_SELF), 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3021, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, 5.3 - ai:GetMapHitRadius(TARGET_SELF), 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3005, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3091, TARGET_ENE_0, 6.8 - ai:GetMapHitRadius(TARGET_SELF), 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3061, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3068, TARGET_ENE_0, 9999, 0, 0)
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

