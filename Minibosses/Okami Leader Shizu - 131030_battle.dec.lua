RegisterTableGoal(GOAL_Genpeimusya_kemari_131030_Battle, "GOAL_Genpeimusya_kemari_131030_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Genpeimusya_kemari_131030_Battle, true)

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
    ai:SetStringIndexedNumber("hassouDisable_Flg", 0)
    Set_ConsecutiveGuardCount_Interrupt(ai)
    if Common_ActivateAct(ai, goal, 1) then
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
        probabilities[21] = 100
    elseif thinkParam == 13100301 then
        if distanceEnemy >= 40 then
            if ai:HasSpecialEffectId(TARGET_ENE_0, 110040) or ai:HasSpecialEffectId(TARGET_ENE_0, 110041) then
                if ai:IsInsideTargetRegion(TARGET_ENE_0, 2502630) then
                    probabilities[26] = 1
                else
                    probabilities[11] = 100000000000
                end
            else
                probabilities[26] = 1
            end
        elseif distanceEnemy >= 7 then
            probabilities[1] = 100
            probabilities[6] = 100
            probabilities[23] = 100
        elseif distanceEnemy >= 4.5 then
            probabilities[1] = 20
            probabilities[5] = 100
            probabilities[10] = 50
            probabilities[23] = 10
        else
            probabilities[7] = 100
            probabilities[10] = 100
        end
    elseif distanceEnemy >= 15 then
        probabilities[1] = 100
        probabilities[6] = 100
        probabilities[23] = 100
    elseif distanceEnemy >= 10 then
        probabilities[1] = 100
        probabilities[6] = 100
        probabilities[23] = 100
    elseif distanceEnemy > 7 then
        probabilities[1] = 100
        probabilities[6] = 100
        probabilities[23] = 100
    elseif distanceEnemy > 4.5 then
        probabilities[1] = 20
        probabilities[5] = 100
        probabilities[10] = 50
        probabilities[23] = 10
    else
        probabilities[7] = 100
        probabilities[10] = 100
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
    if SpaceCheck(ai, goal, 120, 3) == false or SpaceCheck(ai, goal, -120, 3) == false then
        ai:SetStringIndexedNumber("hassouDisable_Flg", 1)
    else
        ai:SetStringIndexedNumber("hassouDisable_Flg", 0)
    end
    if ai:GetStringIndexedNumber("hassouDisable_Flg") == 1 and ai:HasSpecialEffectId(TARGET_SELF, 200051) then
        probabilities[10] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 10, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3003, 10, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3001, 10, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3007, 10, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3004, 10, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3008, 10, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3020, 10, probabilities[7], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3044, 10, probabilities[10], 1)
    acts[1] = REGIST_FUNC(ai, goal, self.Act01)
    acts[2] = REGIST_FUNC(ai, goal, self.Act02)
    acts[3] = REGIST_FUNC(ai, goal, self.Act03)
    acts[4] = REGIST_FUNC(ai, goal, self.Act04)
    acts[5] = REGIST_FUNC(ai, goal, self.Act05)
    acts[6] = REGIST_FUNC(ai, goal, self.Act06)
    acts[7] = REGIST_FUNC(ai, goal, self.Act07)
    acts[8] = REGIST_FUNC(ai, goal, self.Act08)
    acts[10] = REGIST_FUNC(ai, goal, self.Act10)
    acts[11] = REGIST_FUNC(ai, goal, self.Act11)
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
    local stopDist = 999 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 999 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 999 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    if ai:HasSpecialEffectId(TARGET_SELF, 200051) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local stopDist = 99 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local stopDist = 99 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local f6_local0 = 99 - ai:GetMapHitRadius(TARGET_SELF)
    local f6_local1 = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f6_local2 = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f6_local3 = 100
    local f6_local4 = 0
    local f6_local5 = 1.5
    local f6_local6 = 3
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act05 = function (ai, goal, paramTbl)
    local f7_local0 = 99 - ai:GetMapHitRadius(TARGET_SELF)
    local f7_local1 = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f7_local2 = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f7_local3 = 100
    local f7_local4 = 0
    local f7_local5 = 1.5
    local f7_local6 = 3
    local successDist = 99 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3004, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act06 = function (ai, goal, paramTbl)
    local stopDist = 99 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3008, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    local stopDist = 2.9 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 99
    local forceRunMinDist = 2.9 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3020, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    if ai:GetStringIndexedNumber("hassouDisable_Flg") == 0 or ai:HasSpecialEffectId(TARGET_SELF, 200051) == false then
        if random <= 50 then
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3045, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3044, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3044, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3045, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
        end
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 200050) then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3000, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    local stopDist = 99 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local forceRunMinDist = 99 - ai:GetMapHitRadius(TARGET_SELF) + 2
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

Goal.Act10 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local turnTime = 0
    local turnFaceAngle = 0
    if ai:HasSpecialEffectId(TARGET_SELF, 200051) then
        if random <= 50 then
            if ai:GetStringIndexedNumber("hassouDisable_Flg") == 0 then
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3044, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3045, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
            end
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3010, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 9999, 0, 0)
        else
            if ai:GetStringIndexedNumber("hassouDisable_Flg") == 0 then
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3045, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3044, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
            end
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3010, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 9999, 0, 0)
        end
    elseif random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3044, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3000, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3045, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3000, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act11 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
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
    local f15_local2 = 20
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
    local goalLife = 1.2
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

Goal.Interrupt = function (self, ai, goal)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        return self.Damaged(ai, goal)
    end
    return false
end

Goal.Damaged = function (ai, goal, f22_arg2)
    local random = ai:GetRandam_Int(1, 100)
    local f22_local1 = 5
    if ai:GetStringIndexedNumber("hassouDisable_Flg") == 1 and ai:HasSpecialEffectId(TARGET_SELF, 200051) then
        return true
    end
    if SpaceCheck(ai, goal, 180, 3) == true then
        if random <= 50 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 1, 3045, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 1, 3010, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3005, TARGET_ENE_0, 9999, 0, 0)
            return true
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 1, 3044, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3045, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        end
    end
    return false
end

Goal.ActAfter_AdjustSpace = function (ai, goal, paramTbl)
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
end

Goal.Terminate = function (self, ai, goal)
end

