RegisterTableGoal(GOAL_Kibamusya508000_Battle, "GOAL_Kibamusya508000_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Kibamusya508000_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
end

Goal.Activate = function (self, ai, goal)
    Init_Pseudo_Global(ai, goal)
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local paramDoAdmire = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local eventRequest = ai:GetEventRequest()
    local f2_local8 = true
    local f2_local9 = ai:GetNinsatsuNum()
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5031)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5032)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5033)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5034)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 3508050)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 3508080)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 3508510)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 105100)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 100401)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 3508040)
    ai:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 3508520)
    ai:DeleteObserve(0)
    ai:DeleteObserve(1)
    ai:DeleteObserve(2)
    ai:DeleteObserve(4)
    ai:SetNumber(8, 0)
    if self.Kengeki_Activate(self, ai, goal) then
        return
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        f2_local8 = true
    else
        f2_local8 = false
    end
    if ai:IsFinishTimer(2) == true then
        ai:SetNumber(2, 0)
    end
    if eventRequest == 1 and ai:GetNumber(7) ~= 2 then
        probabilities[34] = 100
    elseif ai:HasSpecialEffectId(TARGET_SELF, 3508530) and distanceEnemy >= 4 then
        probabilities[22] = 100
    elseif ai:HasSpecialEffectId(TARGET_ENE_0, 110060) or ai:HasSpecialEffectId(TARGET_ENE_0, 110010) then
        if ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
            probabilities[32] = 100
        else
            probabilities[28] = 100
        end
    elseif ai:HasSpecialEffectId(TARGET_ENE_0, 110015) then
        probabilities[30] = 100
    elseif ai:HasSpecialEffectId(TARGET_SELF, 3508090) then
        probabilities[30] = 100
        probabilities[33] = 100
    elseif f2_local8 == true then
        if ai:IsFinishTimer(8) == true then
            if distanceEnemy <= 10 then
                probabilities[30] = 40
            else
                probabilities[31] = 60
            end
        end
        probabilities[12] = 60
        probabilities[25] = 0
        probabilities[3] = 60
        if f2_local9 <= 1 then
            probabilities[25] = 120
        end
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) or ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) then
        if distanceEnemy >= 10 then
            probabilities[3] = 5
        elseif distanceEnemy >= 7 then
            probabilities[30] = 1
            probabilities[33] = 5
            probabilities[10] = 50
            probabilities[11] = 50
            probabilities[42] = 50
            if distanceEnemy <= 9 then
                probabilities[9] = 50
            end
        elseif distanceEnemy >= 4 then
            probabilities[9] = 50
            probabilities[30] = 1
            probabilities[33] = 5
            probabilities[10] = 50
            probabilities[11] = 50
            probabilities[42] = 50
        else
            probabilities[1] = 50
            probabilities[2] = 100
            probabilities[35] = 50
            probabilities[37] = 150
            probabilities[42] = 50
            if distanceEnemy <= 2 and f2_local9 <= 1 then
                probabilities[46] = 120
            end
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
                probabilities[13] = 50
            end
        end
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 90) then
        if distanceEnemy >= 3 then
            probabilities[30] = 50
            probabilities[33] = 20
        else
            probabilities[4] = 100
        end
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) then
        if distanceEnemy >= 5 then
            probabilities[30] = 50
            probabilities[33] = 20
        elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
            probabilities[8] = 100
            probabilities[13] = 100
            probabilities[16] = 100
        else
            probabilities[4] = 100
            probabilities[8] = 100
        end
    else
        probabilities[33] = 20
    end
    if ai:IsFinishTimer(10) == false then
        probabilities[25] = 0
    end
    if ai:IsFinishTimer(3) == false or distanceEnemy >= 2 then
        probabilities[36] = 0
    end
    if distanceEnemy <= 1.2 then
        probabilities[42] = 0
    end
    ai:SetStringIndexedNumber(" targetDist ", distanceEnemy)
    ai:SetStringIndexedNumber(" targetAngle ", ai:GetToTargetAngle(TARGET_ENE_0))
    ai:SetStringIndexedNumber(" running ", f2_local8)
    local cooldown = ai:GetRandam_Int(8, 20)
    probabilities[1] = SetCoolTime(ai, goal, 3000, 5, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3070, 5, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3024, 5, probabilities[3], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3007, 10, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3008, 5, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3009, 60, probabilities[10], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3010, 60, probabilities[11], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3011, 20, probabilities[12], 1)
    probabilities[13] = SetCoolTime(ai, goal, 3089, 20, probabilities[13], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3015, 20, probabilities[14], 1)
    probabilities[16] = SetCoolTime(ai, goal, 3023, 5, probabilities[16], 1)
    probabilities[18] = SetCoolTime(ai, goal, 3025, 5, probabilities[18], 1)
    probabilities[19] = SetCoolTime(ai, goal, 3026, 3, probabilities[19], 1)
    probabilities[25] = SetCoolTime(ai, goal, 5010, 45, probabilities[25], 1)
    probabilities[30] = SetCoolTime(ai, goal, 5010, 5, probabilities[30], 1)
    probabilities[31] = SetCoolTime(ai, goal, 3032, 15, probabilities[31], 1)
    probabilities[31] = SetCoolTime(ai, goal, 3033, 15, probabilities[31], 1)
    probabilities[35] = SetCoolTime(ai, goal, 3029, 8, probabilities[35], 1)
    probabilities[36] = SetCoolTime(ai, goal, 3064, 20, probabilities[36], 1)
    probabilities[37] = SetCoolTime(ai, goal, 3084, cooldown, probabilities[37], 1)
    probabilities[42] = SetCoolTime(ai, goal, 3039, 5, probabilities[42], 1)
    probabilities[45] = SetCoolTime(ai, goal, 3096, 8, probabilities[45], 1)
    probabilities[45] = SetCoolTime(ai, goal, 3096, 8, probabilities[45], 1)
    probabilities[46] = SetCoolTime(ai, goal, 3045, 45, probabilities[46], 1)
    acts[1] = REGIST_FUNC(ai, goal, self.Act01)
    acts[2] = REGIST_FUNC(ai, goal, self.Act02)
    acts[3] = REGIST_FUNC(ai, goal, self.Act03)
    acts[4] = REGIST_FUNC(ai, goal, self.Act04)
    acts[5] = REGIST_FUNC(ai, goal, self.Act05)
    acts[6] = REGIST_FUNC(ai, goal, self.Act06)
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
    acts[32] = REGIST_FUNC(ai, goal, self.Act32)
    acts[33] = REGIST_FUNC(ai, goal, self.Act33)
    acts[34] = REGIST_FUNC(ai, goal, self.Act34)
    acts[35] = REGIST_FUNC(ai, goal, self.Act35)
    acts[36] = REGIST_FUNC(ai, goal, self.Act36)
    acts[37] = REGIST_FUNC(ai, goal, self.Act37)
    acts[38] = REGIST_FUNC(ai, goal, self.Act38)
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

Goal.Act01 = function (ai, goal, paramTbl)
    local f3_local0 = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f3_local1 = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 99
    local f3_local2 = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local f3_local3 = 100
    local f3_local4 = 0
    local f3_local5 = 1.5
    local f3_local6 = 3
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) or ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 60) then
        goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 0.1, TARGET_ENE_0, 0, TARGET_SELF, false, -1, AI_DIR_TYPE_ToL, 3)
    end
    local f3_local7 = 3
    local f3_local8 = 45
    local animationId = 3000
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local animationId = 3070
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 2)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local stopDist = 8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 8 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 8 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f5_local7 = 3038
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3024, TARGET_ENE_0, 3.5, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3082, TARGET_ENE_0, 3, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3083, TARGET_ENE_0, 5, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3084, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local f6_local0 = 5.9 - ai:GetMapHitRadius(TARGET_SELF)
    local f6_local1 = 5.9 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f6_local2 = 5.9 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f6_local3 = 100
    local f6_local4 = 0
    local f6_local5 = 1.5
    local f6_local6 = 3
    local animationId = 3003
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act05 = function (ai, goal, paramTbl)
    local f7_local0 = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local f7_local1 = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f7_local2 = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f7_local3 = 100
    local f7_local4 = 0
    local f7_local5 = 1.5
    local f7_local6 = 3
    local f7_local7 = 3004
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3004, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 0.5, TARGET_SELF, 2, TARGET_SELF, false, -1, AI_DIR_TYPE_F, ai:GetRandam_Float(8, 10)):TimingSetNumber(0, 1, AI_TIMING_SET__UPDATE_SUCCESS)
    ai:SetNumber(5, 5)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act06 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f8_local1 = 14 - ai:GetMapHitRadius(TARGET_SELF)
    local f8_local2 = 14 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f8_local3 = 14 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f8_local4 = 100
    local f8_local5 = 0
    local f8_local6 = 1.5
    local f8_local7 = 3
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    if distanceEnemy >= 12 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3033, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        end
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 1, TARGET_ENE_0, 2, TARGET_ENE_0, false, -1, AI_DIR_TYPE_ToL, 3)
    local f8_local8 = 3005
    local f8_local9 = 0
    local f8_local10 = 0
    ai:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 90, 16)
    ai:SetNumber(5, 6)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    local f9_local0 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f9_local1 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f9_local2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f9_local3 = 100
    local f9_local4 = 0
    local f9_local5 = 1.5
    local f9_local6 = 3
    local animationId = 3006
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 7)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    local f10_local0 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f10_local1 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f10_local2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f10_local3 = 100
    local f10_local4 = 0
    local f10_local5 = 1.5
    local f10_local6 = 3
    local animationId = 3007
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 8)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act09 = function (ai, goal, paramTbl)
    local animationId = 3008
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 9)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    local f12_local0 = 50 - ai:GetMapHitRadius(TARGET_SELF)
    local f12_local1 = 50 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f12_local2 = 50 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f12_local3 = 100
    local f12_local4 = 0
    local f12_local5 = 1.5
    local f12_local6 = 3
    if ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3031, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    local animationId = 3009
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 10)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act11 = function (ai, goal, paramTbl)
    local f13_local0 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f13_local1 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f13_local2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f13_local3 = 100
    local f13_local4 = 0
    local f13_local5 = 1.5
    local f13_local6 = 3
    if ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3031, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    local animationId = 3010
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 11)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act12 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f14_local1 = distanceEnemy - 2
    local f14_local2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f14_local3 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f14_local4 = 100
    local f14_local5 = 0
    local f14_local6 = 1.5
    local f14_local7 = 3
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    if distanceEnemy >= 12 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 120) then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3033, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        end
    end
    local f14_local8 = 3011
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3011, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3012, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3013, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(5, 12)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act13 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3089, TARGET_ENE_0, 3, 0, 0, 0, 0)
end

Goal.Act14 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f16_local1 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f16_local2 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f16_local3 = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f16_local4 = 100
    local f16_local5 = 0
    local f16_local6 = 1.5
    local f16_local7 = 3
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    if distanceEnemy >= 12 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 120) then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3033, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        end
    end
    local f16_local8 = 3015
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3015, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
    ai:AddObserveArea(2, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 3)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(5, 14)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act15 = function (ai, goal, paramTbl)
    local stopDist = 30 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 30 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 30 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f17_local7 = 3016
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3018, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 15)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act16 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    ai:SetNumber(5, 16)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act17 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f19_local1 = 14 - ai:GetMapHitRadius(TARGET_SELF)
    local f19_local2 = 14 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f19_local3 = 14 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f19_local4 = 100
    local f19_local5 = 0
    local f19_local6 = 1.5
    local f19_local7 = 3
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 16, TARGET_SELF, false, -1)
    local animationId = 3005
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 17)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act18 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 9, TARGET_SELF, false, -1)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3024, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 18)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act19 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3026, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 19)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act20 = function (ai, goal, paramTbl)
    local stopDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f22_local7 = 3027
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3027, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 20)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act22 = function (ai, goal, paramTbl)
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    ai:SetEventMoveTarget(1102847)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_EVENT, 2, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act30 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f24_local1 = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local f24_local2 = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f24_local3 = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f24_local4 = 100
    local f24_local5 = 0
    local f24_local6 = 1.5
    local f24_local7 = 3
    local random = ai:GetRandam_Int(1, 100)
    if distanceEnemy <= 10 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) and random <= 0 then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3033, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        end
        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 10, 3014, TARGET_ENE_0, 9999, 0)
    else
        if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
        end
        if random <= 50 then
            goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, ai:GetRandam_Float(1, 1.5), TARGET_ENE_0, 20000000, TARGET_ENE_0, false, -1, AI_DIR_TYPE_ToR, ai:GetRandam_Float(20000, 20000))
        else
            goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, ai:GetRandam_Float(1, 1.5), TARGET_ENE_0, 20000000, TARGET_ENE_0, false, -1, AI_DIR_TYPE_ToL, ai:GetRandam_Float(2000, 2000))
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3033, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    ai:SetNumber(5, 30)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act31 = function (ai, goal, paramTbl)
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    local random = ai:GetRandam_Int(1, 100)
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3033, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    ai:SetNumber(5, 31)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act32 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3031, TARGET_ENE_0, 9999, 0, 0, 0, 0):TimingSetTimer(3, 25, UPDATE_SUCCESS)
    ai:SetNumber(5, 32)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act33 = function (ai, goal, paramTbl)
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 10, TARGET_SELF, 2, TARGET_SELF, true, 9910, AI_DIR_TYPE_ToR, 5)
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3033, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    ai:SetNumber(5, 33)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act34 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f28_local1 = 4.6 - ai:GetMapHitRadius(TARGET_SELF)
    local f28_local2 = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f28_local3 = 4.6 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f28_local4 = 100
    local f28_local5 = 0
    local f28_local6 = 1.5
    local f28_local7 = 3
    local random = ai:GetRandam_Int(1, 100)
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    if ai:GetNumber(7) == 0 then
        ai:SetEventMoveTarget(1102840)
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_EVENT, 2, TARGET_SELF, false, -1):TimingSetNumber(7, 1, UPDATE_SUCCESS):TimingSetTimer(7, 4, UPDATE_SUCCESS)
    elseif ai:GetNumber(7) == 1 then
        if ai:IsFinishTimer(7) == false then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, 15, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 0.5, TARGET_ENE_0, 2, TARGET_ENE_0, false, -1, AI_DIR_TYPE_ToL, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 0.5, TARGET_ENE_0, 2, TARGET_ENE_0, false, -1, AI_DIR_TYPE_ToL, 4)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3040, TARGET_ENE_0, 9999, 0, 0, 0, 0):TimingSetNumber(7, 2, UPDATE_SUCCESS):TimingSetTimer(8, 15, AI_TIMING_SET__ACTIVATE)
    elseif ai:GetNumber(7) == 2 then
        goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 0.5, TARGET_ENE_0, 2, TARGET_ENE_0, false, -1, AI_DIR_TYPE_ToL, 10)
    end
    ai:SetNumber(5, 34)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act35 = function (ai, goal, paramTbl)
    local f29_local0 = 0
    local f29_local1 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3029, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3066, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act36 = function (ai, goal, paramTbl)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3064, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, ai:GetRandam_Float(1, 1.5), TARGET_ENE_0, 2, TARGET_ENE_0, false, -1, ai:GetRandam_Int(AI_DIR_TYPE_ToL, AI_DIR_TYPE_ToR), ai:GetRandam_Float(8, 10))
    if random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3033, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act37 = function (ai, goal, paramTbl)
    local f31_local0 = 0
    local f31_local1 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3082, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3083, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3084, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act38 = function (ai, goal, paramTbl)
    local f32_local0 = 0
    local f32_local1 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3085, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3045, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act39 = function (ai, goal, paramTbl)
    local f33_local0 = 0
    local f33_local1 = 0
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act40 = function (ai, goal, paramTbl)
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, ai:GetRandam_Float(0.3, 0.7), TARGET_SELF, 2, TARGET_SELF, false, -1, AI_DIR_TYPE_F, 20)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3032, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    ai:SetNumber(5, 33)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act41 = function (ai, goal, paramTbl)
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, ai:GetRandam_Float(0.3, 0.7), TARGET_SELF, 2, TARGET_SELF, false, -1, AI_DIR_TYPE_F, 20)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3033, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    ai:SetNumber(5, 33)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act42 = function (ai, goal, paramTbl)
    local f36_local0 = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f36_local1 = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f36_local2 = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local f36_local3 = 100
    local f36_local4 = 0
    local f36_local5 = 1.5
    local f36_local6 = 3
    if ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3031, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    local f36_local7 = 3
    local f36_local8 = 45
    local f36_local9 = 0
    local f36_local10 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3039, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3043, TARGET_ENE_0, 9999, 0)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act43 = function (ai, goal, paramTbl)
    local f37_local0 = 17
    local f37_local1 = 17
    local f37_local2 = 17
    local f37_local3 = 100
    local f37_local4 = 0
    local f37_local5 = 1.5
    local f37_local6 = 3
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, 5, TARGET_SELF, false, -1)
    local f37_local7 = 3
    local f37_local8 = 45
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3097, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act44 = function (ai, goal, paramTbl)
    if not ai:HasSpecialEffectId(TARGET_SELF, 3508000) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3030, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    local random = ai:GetRandam_Int(1, 100)
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3041, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3042, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, 10, TARGET_SELF, false, -1)
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3095, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, ai:GetRandam_Float(2, 2.5), TARGET_ENE_0, 15, TARGET_ENE_0, false, -1, ai:GetRandam_Int(AI_DIR_TYPE_ToL, AI_DIR_TYPE_ToR), ai:GetRandam_Float(14, 20))
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3041, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3042, TARGET_ENE_0, 9999, 0, 0, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, 10, TARGET_SELF, false, -1)
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3024, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3018, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(5, 31)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act45 = function (ai, goal, paramTbl)
    local f39_local0 = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f39_local1 = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 99
    local f39_local2 = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 100
    local f39_local3 = 100
    local f39_local4 = 0
    local f39_local5 = 1.5
    local f39_local6 = 3
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) or ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 60) then
        goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 0.1, TARGET_ENE_0, 0, TARGET_SELF, false, -1, AI_DIR_TYPE_ToL, 3)
    end
    local f39_local7 = 3
    local f39_local8 = 45
    local animationId = 3096
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act46 = function (ai, goal, paramTbl)
    local f40_local0 = 3045
    local f40_local1 = 0
    local f40_local2 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3085, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3045, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(5, 2)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act47 = function (ai, goal, paramTbl)
    local animationId = 3038
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    ai:SetNumber(5, 2)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act48 = function (ai, goal, paramTbl)
    local animationId = 3044
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3082, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3083, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3084, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(5, 2)
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
    local f44_local2 = 20
    local random = ai:GetRandam_Int(1, 100)
    local guardStateId = -1
    if f44_local2 <= staminaSelf and random <= 50 then
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
    if SpaceCheck(ai, goal, 180, 2) == true then
        if SpaceCheck(ai, goal, 180, 4) ~= true or distanceEnemy > 4 then
        else
            animationId = 5211
            if false then
            end
        end
    else
        GetWellSpace_Odds = 100
        return GetWellSpace_Odds
    end
    goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act25 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Float(2, 4)
    local random_2 = ai:GetRandam_Float(1, 3)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f46_local3 = -1
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 3508520)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 10, TARGET_ENE_0, 15, TARGET_SELF, false, -1)
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3041, TARGET_ENE_0, 9999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3042, TARGET_ENE_0, 9999, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3015, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 9999, 0, 0)
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
        end
    elseif SpaceCheck(ai, goal, 0, 4) == true then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 0.1, TARGET_ENE_0, 0, TARGET_SELF, false, -1)
    elseif SpaceCheck(ai, goal, 0, 3) == true then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 0.5, TARGET_ENE_0, 0, TARGET_SELF, true, -1)
    elseif SpaceCheck(ai, goal, 0, 1) == false then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 0.5, TARGET_ENE_0, 999, TARGET_ENE_0, true, -1)
    end
    ai:SetNumber(10, right)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, right, ai:GetRandam_Int(30, 45), true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act28 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f49_local1 = 3
    local random = ai:GetRandam_Int(30, 45)
    local f49_local3 = -1
    local random_2 = ai:GetRandam_Int(0, 1)
    local random_3 = ai:GetRandam_Int(1, 100)
    if random_3 <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, ai:GetRandam_Float(1, 1.5), TARGET_ENE_0, 2, TARGET_ENE_0, true, -1, AI_DIR_TYPE_ToR, ai:GetRandam_Float(8, 10))
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, ai:GetRandam_Float(1, 1.5), TARGET_ENE_0, 2, TARGET_ENE_0, true, -1, AI_DIR_TYPE_ToL, ai:GetRandam_Float(8, 10))
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Interrupt = function (self, ai, goal)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    local random = ai:GetRandam_Int(1, 100)
    local random_2 = ai:GetRandam_Int(1, 100)
    local random_3 = ai:GetRandam_Int(1, 100)
    local f50_local7 = ai:GetNinsatsuNum()
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if ai:GetSpecialEffectActivateInterruptType(0) == 5026 and ai:GetNumber(8) == 0 then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 135) or ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 60) then
                if distanceEnemy >= 12 then
                    if not ai:HasSpecialEffectId(TARGET_SELF, 3508100) then
                        goal:ClearSubGoal()
                        self.Act17(ai, goal, paramTbl)
                        ai:DeleteObserve(0)
                        ai:DeleteObserve(1)
                        ai:DeleteObserve(2)
                        ai:DeleteObserve(3)
                        return true
                    else
                        goal:ClearSubGoal()
                        self.Act18(ai, goal, paramTbl)
                        ai:DeleteObserve(0)
                        ai:DeleteObserve(1)
                        ai:DeleteObserve(2)
                        ai:DeleteObserve(3)
                        return true
                    end
                elseif ai:IsFinishTimer(4) == true then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 8, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3097, TARGET_ENE_0, 9999, 0)
                    ai:SetTimer(4, 10)
                    do
                        return true
                    end
                    if false then
                    end
                end
            end
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5029 then
            ai:AddObserveArea(4, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 5)
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5031 and f50_local7 <= 1 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3090, TARGET_ENE_0, 9999, 0, 0)
            return true
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5032 then
            if distanceEnemy >= 6 and distanceEnemy <= 13 and ai:IsFinishTimer(8) == true then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3046, TARGET_ENE_0, 9999, 0, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 5034 then
            if distanceEnemy >= 6 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3018, TARGET_ENE_0, 9999, 0, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 105100 then
            if ai:HasSpecialEffectId(TARGET_SELF, 5039) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1, 20000, TARGET_ENE_0, 9999, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 100401 then
            if ai:HasSpecialEffectId(TARGET_SELF, 3508070) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1, 20001, TARGET_ENE_0, 9999, 0):TimingSetTimer(3, 25, UPDATE_SUCCESS)
                return true
            elseif ai:HasSpecialEffectId(TARGET_SELF, 3508071) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 1, 20002, TARGET_ENE_0, 9999, 0):TimingSetTimer(3, 25, UPDATE_SUCCESS)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 3508080 then
            ai:SetTimer(3, 25)
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 3508510 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 10, 3018, TARGET_ENE_0, 9999, 0)
            ai:SetTimer(10, 75)
            ai:DeleteObserve(3)
            return true
        elseif ai:GetSpecialEffectActivateInterruptType(0) == 3508520 then
            ai:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 3508520)
            goal:ClearSubGoal()
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
                goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3041, TARGET_ENE_0, 9999, 0, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3042, TARGET_ENE_0, 9999, 0, 0)
            end
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3015, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 9999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 9999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 9999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3016, TARGET_ENE_0, 9999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 9999, 0, 0)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Inside_ObserveArea) then
        if ai:IsInsideObserve(0) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3005, TARGET_ENE_0, 5, 0, 0, 0, 0)
            ai:DeleteObserve(0)
            return true
        elseif ai:IsInsideObserve(1) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3024, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            ai:DeleteObserve(1)
            return true
        elseif ai:IsInsideObserve(4) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_EndureAttack, 5, 3019, TARGET_ENE_0, 9999, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3042, TARGET_ENE_0, 9999, 0)
            ai:DeleteObserve(4)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Outside_ObserveArea) then
    end
    return false
end

Goal.Damaged = function (ai, goal, f51_arg2)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    local f51_local4 = 0
    if distanceEnemy <= 5 then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3090, TARGET_ENE_0, 9999, 0, 0)
        return true
    end
    return false
end

Goal.Kengeki_Activate = function (self, ai, goal, f52_arg3)
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
    local number0 = ai:GetNumber(0)
    if staminaSelf <= 0 then
        probabilities[26] = 100
    elseif kengekiEffect == 200200 then
        if distanceEnemy >= 3 then
            probabilities[26] = 100
        else
            probabilities[3] = 100
            probabilities[35] = 30
            probabilities[36] = 100
        end
    elseif kengekiEffect == 200201 then
        if distanceEnemy >= 3 then
            probabilities[26] = 100
        else
            probabilities[3] = 100
            probabilities[35] = 30
            probabilities[36] = 100
        end
    elseif kengekiEffect == 200227 or kengekiEffect == 200228 then
        if distanceEnemy >= 3 then
            probabilities[26] = 100
        elseif distanceEnemy <= 1.5 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
            probabilities[10] = 200
        else
            probabilities[30] = 50
        end
    end
    if distanceEnemy <= 2 or not ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) then
        probabilities[35] = 0
    end
    if distanceEnemy <= 1.2 then
        probabilities[18] = 0
        probabilities[35] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3060, 10, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3061, 10, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3062, 30, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3063, 10, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3065, 10, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3066, 10, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3067, 10, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3068, 10, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3050, 40, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3006, 40, probabilities[10], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3069, 10, probabilities[11], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3025, 10, probabilities[12], 1)
    probabilities[13] = SetCoolTime(ai, goal, 3070, 30, probabilities[13], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3071, 10, probabilities[14], 1)
    probabilities[15] = SetCoolTime(ai, goal, 3000, 10, probabilities[15], 1)
    probabilities[16] = SetCoolTime(ai, goal, 3080, 10, probabilities[16], 1)
    probabilities[17] = SetCoolTime(ai, goal, 3081, 10, probabilities[17], 1)
    probabilities[18] = SetCoolTime(ai, goal, 3002, 30, probabilities[18], 1)
    probabilities[19] = SetCoolTime(ai, goal, 3037, 10, probabilities[19], 1)
    probabilities[31] = SetCoolTime(ai, goal, 3026, 10, probabilities[31], 1)
    probabilities[32] = SetCoolTime(ai, goal, 3027, 10, probabilities[32], 1)
    probabilities[35] = SetCoolTime(ai, goal, 3039, 10, probabilities[35], 1)
    probabilities[36] = SetCoolTime(ai, goal, 3044, 10, probabilities[36], 1)
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
    acts[30] = REGIST_FUNC(ai, goal, self.Kengeki30)
    acts[31] = REGIST_FUNC(ai, goal, self.Kengeki31)
    acts[32] = REGIST_FUNC(ai, goal, self.Kengeki32)
    acts[33] = REGIST_FUNC(ai, goal, self.Kengeki33)
    acts[34] = REGIST_FUNC(ai, goal, self.Kengeki34)
    acts[35] = REGIST_FUNC(ai, goal, self.Kengeki35)
    acts[36] = REGIST_FUNC(ai, goal, self.Kengeki36)
    acts[37] = REGIST_FUNC(ai, goal, self.Kengeki37)
    acts[21] = REGIST_FUNC(ai, goal, self.Act21)
    acts[22] = REGIST_FUNC(ai, goal, self.Act22)
    acts[23] = REGIST_FUNC(ai, goal, self.Act23)
    acts[24] = REGIST_FUNC(ai, goal, self.Act24)
    acts[25] = REGIST_FUNC(ai, goal, self.Act25)
    acts[26] = REGIST_FUNC(ai, goal, self.NoAction)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    return Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3060, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 1)
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3061, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(4, 1)
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3070, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(2, 0)
    ai:SetNumber(6, 3)
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3063, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 4)
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3004, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 5)
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3066, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 6)
end

Goal.Kengeki07 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3067, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 7)
end

Goal.Kengeki08 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3068, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 8, TARGET_SELF, false, -1)
    goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 3, TARGET_ENE_0, 2, TARGET_ENE_0, false, -1, AI_DIR_TYPE_ToL, ai:GetRandam_Float(8, 10))
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3046, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 8)
    ai:SetTimer(2, 0)
end

Goal.Kengeki09 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3050, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(2, 0)
    ai:SetNumber(6, 9)
end

Goal.Kengeki10 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 30, 3064, TARGET_ENE_0, 9999, 0, 0)
    ai:DeleteObserve(0)
    ai:DeleteObserve(1)
    ai:DeleteObserve(2)
    ai:DeleteObserve(4)
    ai:SetNumber(2, 0)
    ai:SetNumber(6, 10)
end

Goal.Kengeki11 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 3, 3069, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 3, 3000, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 11)
end

Goal.Kengeki12 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3025, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 12)
end

Goal.Kengeki13 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3070, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 12)
end

Goal.Kengeki14 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3071, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 12)
end

Goal.Kengeki15 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3000, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 12)
end

Goal.Kengeki16 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3080, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 12)
end

Goal.Kengeki17 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 3, 3081, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 3, 3000, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 12)
end

Goal.Kengeki18 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3002, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(2, 0)
    ai:SetNumber(6, 12)
end

Goal.Kengeki19 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3037, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 1)
end

Goal.Kengeki20 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3091, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 1)
end

Goal.Kengeki30 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3030, TARGET_ENE_0, 9999, 0, 0)
    ai:SetTimer(2, 0)
    ai:SetNumber(6, 31)
end

Goal.Kengeki31 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3026, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 31)
end

Goal.Kengeki32 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 32)
end

Goal.Kengeki33 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3001, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 32)
end

Goal.Kengeki34 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3096, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(6, 32)
end

Goal.Kengeki35 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3039, TARGET_ENE_0, 9999, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3043, TARGET_ENE_0, 9999, 0)
    ai:SetNumber(6, 32)
end

Goal.Kengeki36 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    if random <= 100 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3044, TARGET_ENE_0, 9999, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3039, TARGET_ENE_0, 9999, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3043, TARGET_ENE_0, 9999, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3044, TARGET_ENE_0, 9999, 0)
    end
    ai:SetNumber(5, 2)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Kengeki37 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3044, TARGET_ENE_0, 9999, 0)
    ai:SetNumber(5, 2)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
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

