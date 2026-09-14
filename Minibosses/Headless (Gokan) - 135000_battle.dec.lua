RegisterTableGoal(GOAL_Kubinashi_135000_Battle, "GOAL_Kubinashi_135000_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Kubinashi_135000_Battle, true)

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
    local eventRequest = ai:GetEventRequest()
    local eventRequest_2 = ai:GetEventRequest(1)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5031)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5036)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 3135010)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 3135011)
    if self.Kengeki_Activate(self, ai, goal) then
        return
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 3135010) and not ai:HasSpecialEffectId(TARGET_SELF, 3135011) then
    end
    if Common_ActivateAct(ai, goal, 1) then
    elseif eventRequest == 20 then
        probabilities[30] = 100
    elseif ai:HasSpecialEffectId(TARGET_SELF, 3135501) then
        probabilities[26] = 100
    elseif ai:HasSpecialEffectId(TARGET_SELF, 5021) and ai:IsInsideTargetRegion(TARGET_ENE_0, 1102331) == false and distanceEnemy >= 3 then
        probabilities[25] = 10000
        probabilities[23] = 100
        probabilities[27] = 1
    elseif ai:CheckDoesExistPath(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 0) == false then
        if distanceEnemy >= 8.5 then
            probabilities[40] = 100
            probabilities[27] = 10
        else
            probabilities[25] = 10000
            probabilities[27] = 100
            probabilities[40] = 1
        end
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        probabilities[28] = 200
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        probabilities[28] = 200
    elseif eventRequest_2 == 10 then
        probabilities[7] = 100
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
        probabilities[21] = 100
    else
        if ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_B, 180, 9999) then
            probabilities[6] = 1000
        end
        if ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_BREAK) then
            probabilities[4] = 100
        elseif distanceEnemy >= 12 then
            probabilities[1] = 100
            probabilities[12] = 150
            probabilities[40] = 200
        elseif distanceEnemy >= 7 then
            probabilities[1] = 100
            probabilities[2] = 100
            probabilities[4] = 0
            probabilities[5] = 0
            probabilities[40] = 200
        elseif distanceEnemy >= 5 then
            probabilities[1] = 0
            probabilities[2] = 0
            probabilities[4] = 10
            probabilities[5] = 30
            probabilities[9] = 100
            probabilities[10] = 100
            probabilities[12] = 0
        elseif distanceEnemy > 3 then
            probabilities[4] = 100
            probabilities[9] = 100
            probabilities[10] = 100
            probabilities[12] = 0
            probabilities[45] = 150
            probabilities[46] = 100
            if ai:IsFinishTimer(5) == true then
                probabilities[13] = 300
            end
        else
            probabilities[4] = 100
            probabilities[5] = 0
            probabilities[14] = 100
            probabilities[15] = 100
            probabilities[12] = 0
            probabilities[45] = 150
            probabilities[46] = 120
            if ai:IsFinishTimer(5) == true then
                probabilities[4] = 0
                probabilities[5] = 0
                probabilities[9] = 0
                probabilities[10] = 0
                probabilities[12] = 0
                probabilities[13] = 100
            end
        end
        if ai:IsFinishTimer(3) == true then
            probabilities[28] = 50
        end
    end
    if ai:GetNumber(0) == 1 then
        probabilities[11] = 0
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
    probabilities[1] = SetCoolTime(ai, goal, 3000, 8, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3001, 10, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3002, 8, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3009, 15, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3010, 8, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3011, 8, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3021, 30, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3018, 30, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3005, 8, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3006, 8, probabilities[10], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3017, 25, probabilities[12], 1)
    probabilities[13] = SetCoolTime(ai, goal, 3010, 8, probabilities[13], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3007, 8, probabilities[14], 1)
    probabilities[15] = SetCoolTime(ai, goal, 3008, 8, probabilities[15], 1)
    probabilities[40] = SetCoolTime(ai, goal, 3022, 4, probabilities[40], 1)
    probabilities[45] = SetCoolTime(ai, goal, 3070, 15, probabilities[45], 1)
    probabilities[46] = SetCoolTime(ai, goal, 3070, 15, probabilities[46], 1)
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
    acts[40] = REGIST_FUNC(ai, goal, self.Act40)
    acts[45] = REGIST_FUNC(ai, goal, self.Act45)
    acts[46] = REGIST_FUNC(ai, goal, self.Act46)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Act01 = function (ai, goal, paramTbl)
    local stopDist = 8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 8 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 8 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f3_local8 = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 30, 3000, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local stopDist = 8.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 8.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 8.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 30, 3001, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, successDist_2, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local stopDist = 11 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 11 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 11 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f5_local7 = ATT3018_DIST_MAX
    local f5_local8 = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3018, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
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

Goal.Act05 = function (ai, goal, paramTbl)
    local stopDist = 7 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 7 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 7 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3010, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act06 = function (ai, goal, paramTbl)
    local f8_local0 = 5 - ai:GetMapHitRadius(TARGET_SELF)
    local f8_local1 = 5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f8_local2 = 5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f8_local3 = 100
    local f8_local4 = 0
    local f8_local5 = 1.5
    local f8_local6 = 3
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3011, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3021, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetTimer(1, 0, UPDATE_SUCCESS)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3018, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetTimer(1, 0, UPDATE_SUCCESS)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act09 = function (ai, goal, paramTbl)
    local stopDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 30, 3005, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local stopDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 30, 3006, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act11 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3040, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(0, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act12 = function (ai, goal, paramTbl)
    local f14_local0 = 12.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f14_local1 = 12.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f14_local2 = 12.5 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local f14_local3 = 100
    local f14_local4 = 0
    local f14_local5 = 1.5
    local f14_local6 = 3
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3017, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act13 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3010, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetTimer(5, 15)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act14 = function (ai, goal, paramTbl)
    local stopDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 30, 3007, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act15 = function (ai, goal, paramTbl)
    local stopDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 7.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 30, 3008, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, 9999, 0, 0)
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
    local f20_local2 = 20
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
    local goalLife = 1.5
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
    local goalLife = 2
    local stopDist = 8.5
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local guardStateId = -1
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, guardStateId)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act26 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Wait, 1.5, TARGET_SELF, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act27 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    if YousumiAct_SubGoal(ai, goal, true, 60, 30) == false and ai:HasSpecialEffectId(TARGET_SELF, 5020) == false then
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    end
    local right = 0
    local f24_local2 = SpaceCheck_SidewayMove(ai, goal, 1)
    if f24_local2 == 0 then
        right = 0
    elseif f24_local2 == 1 then
        right = 1
    elseif f24_local2 == 2 then
        if random <= 50 then
            right = 0
        else
            right = 1
        end
    elseif ai:IsInsideTargetRegion(TARGET_SELF, 1702240) then
        right = 1
    elseif ai:IsInsideTargetRegion(TARGET_SELF, 1702241) then
        right = 0
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF, 0, 0, 0)
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    end
    ai:SetNumber(10, right)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, right, ai:GetRandam_Int(30, 45), true, true, -1)
    return GET_WELL_SPACE_ODDS
end

Goal.Act28 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 1.5
    local goalLife_2 = 1.5
    local goalLife_3 = 2
    local stopDist = ai:GetRandam_Float(5, 7)
    local angleThreshold = ai:GetRandam_Int(30, 45)
    local guardStateId = -1
    local right = ai:GetRandam_Int(0, 1)
    if distanceEnemy <= 3 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife_3, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, guard)
    elseif distanceEnemy <= 8 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId)
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife_2, TARGET_ENE_0, 8, TARGET_SELF, false, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act30 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3020, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act31 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Wait, 3, TARGET_SELF, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act40 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3022, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act45 = function (ai, goal, paramTbl)
    local stopDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3070, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3071, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, 9999, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act46 = function (ai, goal, paramTbl)
    local stopDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3070, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3019, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, 9999, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Interrupt = function (self, ai, goal)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    local f31_local1 = 180
    local f31_local2 = 20
    local f31_local3 = 2.5
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f31_local5 = 0
    local f31_local6 = 0
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if Interupt_PC_Break(ai) then
        ai:Replanning()
        return true
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if interruptEffect == 5025 then
            ai:AddObserveArea(0, TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_B, f31_local1, f31_local3)
            ai:AddObserveArea(1, TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, f31_local1, 3.5)
            return true
        elseif interruptEffect == 5027 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 20, 20001, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        elseif interruptEffect == 5029 then
            if distanceEnemy <= 7 == true and ai:IsFinishTimer(5) == true then
                if not ai:HasSpecialEffectId(TARGET_SELF, 5030) then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 5.5, 3014, TARGET_ENE_0, 999, 0, 0, 0, 0):TimingSetTimer(5, 15, AI_TIMING_SET__ACTIVATE)
                end
                return true
            elseif distanceEnemy >= 4.5 and ai:IsFinishTimer(0) == true then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 4, 3032, TARGET_ENE_0, 999, 0, 0, 0, 0)
                ai:SetTimer(0, 8)
                return true
            end
        elseif interruptEffect == 5028 then
            ai:AddObserveArea(2, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, f31_local1, 6.5)
            return true
        elseif interruptEffect == 5031 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3015, TARGET_ENE_0, 9999, 0, 0)
            return true
        elseif interruptEffect == 5036 then
            ai:SetTimer(3, 5)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_InactivateSpecialEffect) then
    end
    if ai:IsInsideObserve(0) and ai:HasSpecialEffectId(TARGET_SELF, 5032) then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 4, 3012, TARGET_ENE_0, 9999, 0, 0)
        ai:DeleteObserve(0)
        ai:DeleteObserve(1)
        return true
    elseif ai:IsInsideObserve(1) and ai:HasSpecialEffectId(TARGET_SELF, 5033) then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 4, 3013, TARGET_ENE_0, 9999, 0, 0)
        ai:DeleteObserve(0)
        ai:DeleteObserve(1)
        return true
    elseif ai:IsInsideObserve(2) and ai:HasSpecialEffectId(TARGET_SELF, 5035) then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 4, 3033, TARGET_ENE_0, 5.5, 0, 0)
        ai:DeleteObserve(2)
        return true
    end
    return false
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
    local staminaSelf = ai:GetSp(TARGET_SELF)
    if staminaSelf <= 0 then
        probabilities[50] = 100
    elseif kengekiEffect == 200200 then
        if distanceEnemy >= 4 then
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[1] = 100
            probabilities[2] = 100
            probabilities[3] = 100
            probabilities[4] = 100
        else
            probabilities[1] = 100
            probabilities[2] = 100
            probabilities[3] = 100
            probabilities[4] = 100
        end
    elseif kengekiEffect == 200201 then
        if distanceEnemy >= 4 then
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[1] = 100
            probabilities[2] = 100
            probabilities[3] = 100
            probabilities[4] = 100
        else
            probabilities[1] = 100
            probabilities[2] = 100
            probabilities[3] = 100
            probabilities[4] = 100
        end
    elseif kengekiEffect == 200205 then
        if distanceEnemy >= 4 then
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[1] = 100
        else
            probabilities[1] = 100
            probabilities[2] = 100
            probabilities[3] = 100
            probabilities[4] = 100
        end
    elseif kengekiEffect == 200206 then
        if distanceEnemy >= 4 then
            probabilities[50] = 100
        elseif distanceEnemy <= 0.2 then
            probabilities[2] = 100
        else
            probabilities[2] = 100
        end
    else
        probabilities[50] = 100
    end
    if ai:IsFinishTimer(5) == true then
        probabilities[10] = 300
    end
    acts[1] = REGIST_FUNC(ai, goal, self.Kengeki01)
    acts[2] = REGIST_FUNC(ai, goal, self.Kengeki02)
    acts[3] = REGIST_FUNC(ai, goal, self.Kengeki03)
    acts[4] = REGIST_FUNC(ai, goal, self.Kengeki04)
    acts[5] = REGIST_FUNC(ai, goal, self.Kengeki05)
    acts[6] = REGIST_FUNC(ai, goal, self.Kengeki06)
    acts[7] = REGIST_FUNC(ai, goal, self.Kengeki07)
    acts[8] = REGIST_FUNC(ai, goal, self.Kengeki08)
    acts[10] = REGIST_FUNC(ai, goal, self.Kengeki10)
    acts[20] = REGIST_FUNC(ai, goal, self.Kengeki20)
    acts[21] = REGIST_FUNC(ai, goal, self.Kengeki21)
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
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3055, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3060, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3061, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3070, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3075, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki07 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3085, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki08 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3085, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki10 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3010, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki20 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3060, TARGET_ENE_0, 8, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3019, TARGET_ENE_0, 8, 0)
    if random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3033, TARGET_ENE_0, 8, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, 8, 0)
    end
end

Goal.Kengeki21 = function (ai, goal, paramTbl)
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

