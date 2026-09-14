RegisterTableGoal(GOAL_Taniteki_Sniper_119010_Battle, "GOAL_Taniteki_Sniper_119010_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Taniteki_Sniper_119010_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
end

Goal.Activate = function (self, ai, goal)
    Init_Pseudo_Global(ai, goal)
    ai:SetStringIndexedNumber("Dist_Step_Small", 4)
    ai:SetStringIndexedNumber("Dist_Step_Large", 5)
    ai:SetStringIndexedNumber("KaihukuSp", 30)
    ai:DeleteObserve(0)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    Set_ConsecutiveGuardCount_Interrupt(ai)
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local paramDoAdmire = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local eventRequest = ai:GetEventRequest()
    local f2_local8 = 25 - ai:GetMapHitRadius(TARGET_SELF)
    local f2_local9 = 10 - ai:GetMapHitRadius(TARGET_SELF)
    local f2_local10 = 90
    local random = ai:GetRandam_Int(5, 10)
    if ai:IsFinishTimer(1) == true then
        ai:SetNumber(6, 0)
    end
    if self.Kengeki_Activate(self, ai, goal) then
        return
    end
    if Common_ActivateAct(ai, goal) then
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        KankyakuAct(ai, goal)
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        if TorimakiAct(ai, goal) then
            probabilities[1] = 100
        end
    elseif ai:CheckDoesExistPath(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 0) == false then
        probabilities[27] = 1
        if ai:IsVisibleTarget(TARGET_ENE_0) then
            probabilities[31] = 600000
        end
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
        probabilities[21] = 100
    elseif ai:HasSpecialEffectId(TARGET_ENE_0, COMMON_SP_EFFECT_PC_BREAK) then
        if distanceEnemy >= 5 then
            probabilities[2] = 100-- Medium Range Gunshot
        else
            probabilities[10] = 100
        end
    elseif distanceEnemy >= 15 then
        probabilities[1] = 150 -- Long Range (Delayed) Gunshot
        probabilities[10] = 100 -- Horizontal Melee (R)
        probabilities[23] = 50 -- Sidewalk
    elseif distanceEnemy >= 7 then
        probabilities[1] = 200 -- Long Range (Delayed) Gunshot
        probabilities[2] = 30 -- Medium Range Gunshot
        probabilities[10] = 130 -- Horizontal Melee (R)
        probabilities[11] = 200 -- Grab
        probabilities[23] = 100 -- Sidewalk
    else
        probabilities[1] = 0
        probabilities[2] = 0
        probabilities[10] = 130 -- Horizontal Melee (R)
        probabilities[11] = 600 -- Grab
        probabilities[12] = 130 -- Vertical Melee (R)
        probabilities[13] = 130 -- Left Swing
        probabilities[24] = 10 -- Backstep
    end
    if SpaceCheck(ai, goal, 90, 1) == false and SpaceCheck(ai, goal, -45, 1) == false then
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 180, 5) == false then
        probabilities[24] = 0
    end
    if SpaceCheck(ai, goal, 180, 1) == false then
        probabilities[25] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 5, probabilities[1], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3005, 3, probabilities[5], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3010, 7, probabilities[10], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3013, 35, probabilities[11], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3015, 8, probabilities[12], 1)
    probabilities[13] = SetCoolTime(ai, goal, 3017, 10, probabilities[13], 1)
    probabilities[24] = SetCoolTime(ai, goal, 5211, 10, probabilities[24], 1)
    probabilities[24] = SetCoolTime(ai, goal, 5211, 10, probabilities[24], 1)
    acts[1] = REGIST_FUNC(ai, goal, self.Act01)
    acts[2] = REGIST_FUNC(ai, goal, self.Act02)
    acts[3] = REGIST_FUNC(ai, goal, self.Act03)
    acts[4] = REGIST_FUNC(ai, goal, self.Act04)
    acts[5] = REGIST_FUNC(ai, goal, self.Act05)
    acts[10] = REGIST_FUNC(ai, goal, self.Act10)
    acts[11] = REGIST_FUNC(ai, goal, self.Act11)
    acts[12] = REGIST_FUNC(ai, goal, self.Act12)
    acts[13] = REGIST_FUNC(ai, goal, self.Act13)
    acts[21] = REGIST_FUNC(ai, goal, self.Act21)
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
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Act01 = function (ai, goal, paramTbl)
    local animationId = 3000
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local animationId = 3001
    local f4_local1 = 3005
    local f4_local2 = 3009
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local animationId = 3002
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local animationId = 3003
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act05 = function (ai, goal, paramTbl)
    local animationId = 3005
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    local f7_local4 = 3009
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    if stopDist < distanceEnemy then
        Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    end
    if distanceYEnemy >= 1.5 or distanceYEnemy <= -1.5 then
        stopDist = 0.3
    end
    local animationId = 3010
    local animationId_2 = 3011
    local animationId_3 = 3012
    local f8_local12 = 3001
    local successDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    ai:SetNumber(1, ai:GetNumber(1) + 1)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, successDist_2, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act11 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    if stopDist < distanceEnemy then
        Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    end
    if distanceYEnemy >= 1.5 or distanceYEnemy <= -1.5 then
        stopDist = 0.3
    end
    local animationId = 3013
    local f9_local10 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local turnTime = 0
    local turnFaceAngle = 0
    ai:SetNumber(1, ai:GetNumber(1) + 1)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act12 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    if stopDist < distanceEnemy then
        Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    end
    if distanceYEnemy >= 1.5 or distanceYEnemy <= -1.5 then
        stopDist = 0.3
    end
    local animationId = 3015
    local animationId_2 = 3016
    local successDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    local animationId_3 = 3009
    ai:SetNumber(1, ai:GetNumber(1) + 1)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_2, TARGET_ENE_0, 9999, 0, 0)
    if random <= 30 and SpaceCheck(ai, goal, 180, 4) == true then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act13 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    if stopDist < distanceEnemy then
        Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    end
    if distanceYEnemy >= 1.5 or distanceYEnemy <= -1.5 then
        stopDist = 0.3
    end
    local animationId = 3017
    local animationId_2 = 3018
    local animationId_3 = 3019
    local successDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    local animationId_4 = 3009
    ai:SetNumber(1, ai:GetNumber(1) + 1)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, successDist_2, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_3, TARGET_ENE_0, 9999, 0, 0)
    if random <= 30 and SpaceCheck(ai, goal, 180, 4) == true then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, animationId_4, TARGET_ENE_0, 9999, 0, 0)
    end
    GetWellSpace_Odds = 0
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
    local f13_local2 = 20
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
    ai:SetNumber(NUMBER_SIDEWAY_DIRECTION, right)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId):TmiingSetTimer(2, 4, UPDATE_SUCCESS)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act24 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local turnTime = 0
    local animationId = 5211
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
    local goalLife = ai:GetRandam_Float(1.5, 4)
    local stopDist = ai:GetRandam_Float(3, 4)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local guardStateId = -1
    if SpaceCheck(ai, goal, 180, 1) == true then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, guardStateId)
    else
        GetWellSpace_Odds = 100
        return GetWellSpace_Odds
    end
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
    local f17_local2 = SpaceCheck_SidewayMove(ai, goal, 1)
    if f17_local2 == 0 then
        right = 0
    elseif f17_local2 == 1 then
        right = 1
    elseif f17_local2 == 2 then
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
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife_2, TARGET_ENE_0, 8, TARGET_SELF, false, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act29 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local turnTime = 0
    local animationId = 5211
    if SpaceCheck(ai, goal, 180, 2) == true and SpaceCheck(ai, goal, 180, 4) == true then
        animationId = 5211
        if false then
        else
        end
    end
    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
    local distanceEnemy_2 = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local f19_local6 = 20
    local random = ai:GetRandam_Int(1, 100)
    local guardStateId = -1
    if f19_local6 <= staminaSelf and random <= 0 then
        guardStateId = 9910
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
        GetWellSpace_Odds = 100
        return GetWellSpace_Odds
    end
    local goalLife_2 = ai:GetRandam_Float(2, 4)
    local angleThreshold = ai:GetRandam_Int(30, 45)
    ai:SetNumber(10, right)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife_2, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId):TimingSetTimer(2, 4, UPDATE_SUCCESS)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act30 = function (ai, goal, paramTbl)
    local goalLife = 3
    local turnTime = 0
    local goalLife_2 = 3.5
    local angleThreshold = ai:GetRandam_Int(30, 45)
    local random = ai:GetRandam_Int(1, 100)
    if SpaceCheck(ai, goal, 180, 5) then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5211, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
        goalLife_2 = 3.5
    elseif SpaceCheck(ai, goal, 90, 2) and SpaceCheck(ai, goal, -90, 2) then
        if random <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5202, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5203, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
        end
        goalLife_2 = 3.5
    elseif SpaceCheck(ai, goal, 90, 2) then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5203, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
        goalLife_2 = 3.5
    elseif SpaceCheck(ai, goal, -90, 2) then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5202, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
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
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act31 = function (ai, goal, paramTbl)
    local animationId = 3000
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act40 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 0.3
    local walk = false
    local goalLife = 3
    local eventRequest = ai:GetEventRequest()
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_SELF, walk, -1)
    local f22_local5 = 0
    local f22_local6 = 0
    ai:SetNumber(1, ai:GetNumber(1) + 1)
    local animationId = 3015
    local animationId_2 = 3016
    local successDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 1
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    local f22_local13 = 3009
    if random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3013, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, animationId, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, animationId_2, TARGET_ENE_0, DistToAtt2, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Interrupt = function (self, ai, goal)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        return Common_Parry(ai, goal, 50, 0)
    end
    if ai:IsInterupt(INTERUPT_ShootImpact) then
        return self.ShootReaction(ai, goal)
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        return self.Damaged(ai, goal)
    end
    if Interupt_PC_Break(ai) then
        ai:Replanning()
        return true
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) and ai:GetSpecialEffectActivateInterruptType(0) == 5025 then
        ai:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 90, 4)
        return true
    end
    if Interupt_Use_Item(ai, 4, 10) then
        if distanceEnemy <= 3 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3013, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        elseif distanceEnemy <= 6 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3017, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        else
            ai:Replanning()
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Inside_ObserveArea) and ai:IsInsideObserve(0) then
        if SpaceCheck(ai, goal, 180, 4) == true then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1, 3081, TARGET_ENE_0, 9999, 0)
            ai:DeleteObserve(0)
            return true
        else
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1, 3070, TARGET_ENE_0, 9999, 0)
            ai:DeleteObserve(0)
            return true
        end
    end
    return false
end

Goal.Damaged = function (ai, f24_arg1, f24_arg2)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    local f24_local4 = 0
end

Goal.ShootReaction = function (ai, goal)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    if ai:IsInsideTargetEx(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 20, 999) then
        if distanceEnemy <= 30 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3100, TARGET_ENE_0, 9999, 0)
            return true
        else
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_Wait, 0.3, TARGET_SELF, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.1, 3100, TARGET_ENE_0, 9999, 0)
            return true
        end
    end
    return false
end

Goal.Kengeki_Activate = function (self, ai, goal, f26_arg3)
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
    if kengekiEffect == 200200 then
        if distanceEnemy >= 3 then
            probabilities[50] = 100
        else
            probabilities[1] = 10
            probabilities[3] = 100
            probabilities[5] = 100
            probabilities[24] = 10
        end
    elseif kengekiEffect == 200201 then
        if distanceEnemy >= 3 then
            probabilities[50] = 100
        else
            probabilities[2] = 100
            probabilities[4] = 100
            probabilities[24] = 10
        end
    elseif kengekiEffect == 200205 then
        if distanceEnemy >= 3 then
            probabilities[50] = 100
        else
            probabilities[1] = 10
            probabilities[3] = 100
            probabilities[5] = 100
            probabilities[9] = 30
            probabilities[24] = 10
        end
    elseif kengekiEffect == 200206 then
        if distanceEnemy >= 3 then
            probabilities[50] = 100
        else
            probabilities[2] = 100
            probabilities[4] = 100
            probabilities[9] = 30
            probabilities[24] = 10
        end
    elseif kengekiEffect == 200210 then
        if distanceEnemy >= 3 then
            probabilities[50] = 100
        else
            probabilities[1] = 200
            probabilities[5] = 700
            probabilities[9] = 100
        end
    elseif kengekiEffect == 200211 then
        if distanceEnemy >= 3 then
            probabilities[50] = 100
        else
            probabilities[1] = 200
            probabilities[5] = 700
            probabilities[9] = 100
        end
    elseif kengekiEffect == 200215 then
        if distanceEnemy >= 3 then
            probabilities[50] = 100
        else
            probabilities[50] = 100
        end
    elseif kengekiEffect == 200216 then
        if distanceEnemy >= 3 then
            probabilities[50] = 100
        else
            probabilities[50] = 100
        end
    end
    if SpaceCheck(ai, goal, 90, 1) == false and SpaceCheck(ai, goal, -45, 1) == false then
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 180, 4) == false then
        probabilities[24] = 0
        probabilities[10] = 0
    end
    if SpaceCheck(ai, goal, 180, 1) == false then
        probabilities[25] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3050, 30, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3055, 10, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3060, 10, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3067, 10, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3070, 10, probabilities[5], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3019, 10, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3016, 10, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3080, 5, probabilities[9], 1)
    probabilities[24] = SetCoolTime(ai, goal, 5211, 10, probabilities[24], 1)
    probabilities[24] = SetCoolTime(ai, goal, 5211, 10, probabilities[24], 1)
    acts[1] = REGIST_FUNC(ai, goal, self.Kengeki01)
    acts[2] = REGIST_FUNC(ai, goal, self.Kengeki02)
    acts[3] = REGIST_FUNC(ai, goal, self.Kengeki03)
    acts[4] = REGIST_FUNC(ai, goal, self.Kengeki04)
    acts[5] = REGIST_FUNC(ai, goal, self.Kengeki05)
    acts[6] = REGIST_FUNC(ai, goal, self.Kengeki06)
    acts[7] = REGIST_FUNC(ai, goal, self.Kengeki07)
    acts[8] = REGIST_FUNC(ai, goal, self.Kengeki08)
    acts[9] = REGIST_FUNC(ai, goal, self.Kengeki09)
    acts[21] = REGIST_FUNC(ai, goal, self.Act21)
    acts[23] = REGIST_FUNC(ai, goal, self.Act23)
    acts[24] = REGIST_FUNC(ai, goal, self.Act24)
    acts[25] = REGIST_FUNC(ai, goal, self.Act25)
    acts[50] = REGIST_FUNC(ai, goal, self.NoAction)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    return Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3050, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    local successDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_3 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 999
    local f28_local3 = 0
    local f28_local4 = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3055, TARGET_ENE_0, successDist, 0, 0)
    if random <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3018, TARGET_ENE_0, successDist_2, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3019, TARGET_ENE_0, successDist_3, 0, 0)
    end
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    local successDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_3 = 180 - ai:GetMapHitRadius(TARGET_SELF)
    local f29_local3 = 0
    local f29_local4 = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3060, TARGET_ENE_0, successDist, 0, 0)
    if random <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3011, TARGET_ENE_0, successDist_2, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, successDist_3, 0, 0)
    end
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    local successDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_3 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 999
    local f30_local3 = 0
    local f30_local4 = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, successDist, 0, 0)
    if random <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3018, TARGET_ENE_0, successDist_2, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3019, TARGET_ENE_0, successDist_3, 0, 0)
    end
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    local f31_local0 = 0
    local f31_local1 = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3070, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3019, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    local f32_local0 = 0
    local f32_local1 = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3075, TARGET_ENE_0, 9999, 0, 0)
    if random <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3019, TARGET_ENE_0, 9999, 0, 0)
    end
end

Goal.Kengeki07 = function (ai, goal, paramTbl)
    local f33_local0 = 0
    local f33_local1 = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3019, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki08 = function (ai, goal, paramTbl)
    local f34_local0 = 0
    local f34_local1 = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki09 = function (ai, goal, paramTbl)
    local f35_local0 = 0
    local f35_local1 = 0
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3081, TARGET_ENE_0, 9999, 0, 0)
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

