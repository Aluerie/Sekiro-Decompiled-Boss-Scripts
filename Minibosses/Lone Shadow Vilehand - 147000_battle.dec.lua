RegisterTableGoal(GOAL_Koeishu_147000_Battle, "GOAL_Koeishu_147000_Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Koeishu_147000_Battle, true)

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
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    local distanceXZEnemy = ai:GetDistXZ(TARGET_ENE_0)
    local paramDoAdmire = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local staminaRatioSelf = ai:GetSpRate(TARGET_SELF)
    local f2_local9 = Check_ReachAttack(ai, 0)
    local f2_local10 = ai:GetNinsatsuNum()
    local thinkParam = ai:GetNpcThinkParamID()
    local random = ai:GetRandam_Int(0, 100)
    local eventRequest = ai:GetEventRequest()
    local random_2 = ai:GetRandam_Float(19, 21)
    local random_3 = ai:GetRandam_Float(14, 16)
    local random_4 = ai:GetRandam_Float(9, 11)
    ai:SetStringIndexedNumber("heatUpMode", 1)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5030)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5031)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5032)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5033)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5034)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 3147120)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110125)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 109031)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 110120)
    Set_ConsecutiveGuardCount_Interrupt(ai)
    ai:DeleteObserve(0)
    ai:DeleteObserve(1)
    ai:DeleteObserve(2)
    if ai:HasSpecialEffectId(TARGET_SELF, 3147500) and ai:GetNumber(0) == 0 then
        probabilities[20] = 100
    elseif eventRequest == 20 and ai:GetNumber(0) == 0 then
        probabilities[19] = 100
    elseif ai:HasSpecialEffectId(TARGET_SELF, 3147520) and f2_local10 <= 1 and ai:IsFinishTimer(8) == true and hpRatioSelf >= 0.9 and staminaRatioSelf >= 0.7 and not ai:HasSpecialEffectId(TARGET_SELF, 3147120) then
        probabilities[43] = 100
    elseif Common_ActivateAct(ai, goal, 0, 1) then
    elseif f2_local9 ~= POSSIBLE_ATTACK then
        if paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
            probabilities[27] = 100
        elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
            probabilities[27] = 100
        elseif f2_local9 == UNREACH_ATTACK then
            probabilities[27] = 100
            probabilities[30] = 300
        elseif f2_local9 == REACH_ATTACK_TARGET_HIGH_POSITION then
            probabilities[1] = 100
            probabilities[13] = 100
        elseif f2_local9 == REACH_ATTACK_TARGET_LOW_POSITION then
            probabilities[1] = 100
            probabilities[13] = 100
        else
            probabilities[27] = 100
        end
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        if ai:IsInsideTargetRegion(TARGET_SELF, 1112470) then
            if distanceEnemy >= 20 then
                KankyakuAct(ai, goal, 20)
            elseif distanceEnemy >= 15 then
                KankyakuAct(ai, goal, 15)
            else
                KankyakuAct(ai, goal)
            end
        else
            KankyakuAct(ai, goal)
        end
    elseif paramDoAdmire == 1 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        if ai:HasSpecialEffectId(TARGET_SELF, 3147111) then
            if distanceEnemy >= 12 then
                probabilities[29] = 200
            elseif distanceEnemy >= 3 then
                probabilities[23] = 200
                probabilities[25] = 20
                probabilities[1] = 1
            else
                probabilities[23] = 20
                probabilities[25] = 200
                probabilities[1] = 1
            end
        elseif ai:IsInsideTargetRegion(TARGET_SELF, 1112470) then
            if distanceEnemy >= 18 then
                if TorimakiAct(ai, goal, random_2, 40) then
                    probabilities[2] = 10
                    probabilities[11] = 30
                    if ai:IsVisibleTarget(TARGET_ENE_0) then
                        probabilities[30] = 100
                    end
                end
            elseif distanceEnemy >= 13 then
                if TorimakiAct(ai, goal, random_3, 40) then
                    probabilities[2] = 10
                    probabilities[11] = 50
                    if ai:IsVisibleTarget(TARGET_ENE_0) then
                        probabilities[30] = 100
                    end
                end
            elseif distanceEnemy >= 8 then
                if TorimakiAct(ai, goal, random_4, 30) then
                    probabilities[2] = 50
                    probabilities[11] = 50
                    if ai:IsVisibleTarget(TARGET_ENE_0) then
                        probabilities[30] = 100
                    end
                end
            elseif TorimakiAct(ai, goal) then
                probabilities[2] = 100
                probabilities[11] = 100
            end
        elseif TorimakiAct(ai, goal) then
            probabilities[2] = 100
            probabilities[11] = 100
        end
    elseif ai:HasSpecialEffectId(TARGET_SELF, 3147110) and ai:IsFinishTimer(6) == true then
        probabilities[20] = 100
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
        probabilities[21] = 10
        probabilities[22] = 10000
    elseif thinkParam == 14703000 and distanceYEnemy <= -1.1 then
        if distanceEnemy >= 3 then
            probabilities[1] = 300
            probabilities[6] = 300
            probabilities[37] = 300
        else
            probabilities[1] = 250
            probabilities[6] = 300
            probabilities[37] = 200
            probabilities[30] = 250
        end
    elseif thinkParam == 14703000 and distanceYEnemy >= 1.1 then
        if distanceEnemy >= 3 then
            probabilities[27] = 100
            probabilities[30] = 500
            probabilities[37] = 300
        else
            probabilities[6] = 300
            probabilities[24] = 300
            probabilities[27] = 100
            probabilities[37] = 300
        end
    elseif thinkParam == 14701002 and distanceYEnemy <= -1.8 and distanceXZEnemy <= 2 then
        probabilities[27] = 50
        probabilities[24] = 50
        probabilities[37] = 900
    elseif thinkParam == 14701002 and distanceYEnemy >= 1.8 and distanceXZEnemy <= 2 then
        probabilities[27] = 50
        probabilities[24] = 50
        probabilities[37] = 900
    elseif ai:IsFinishTimer(0) == false then
        probabilities[1] = 1
        probabilities[23] = 10000
        ai:SetTimer(0, 0)
    elseif (ai:HasSpecialEffectId(TARGET_ENE_0, 109031) or ai:HasSpecialEffectId(TARGET_ENE_0, 110125)) and ai:HasSpecialEffectId(TARGET_SELF, 5022) then
        probabilities[6] = 100
    elseif ai:HasSpecialEffectId(TARGET_ENE_0, 110120) and distanceEnemy <= 4 then
        probabilities[8] = 100
    elseif thinkParam == 14701003 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki and random >= 61 then
        if TorimakiAct(ai, goal, -1, 0) then
        end
    elseif thinkParam == 14701004 and ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki and random >= 81 then
        if TorimakiAct(ai, goal, -1, 0) then
        end
    elseif distanceEnemy >= 10 then
        probabilities[1] = 10
        probabilities[2] = 200
        probabilities[11] = 10
        probabilities[42] = 100
        if ai:HasSpecialEffectId(TARGET_SELF, 5021) then
            probabilities[17] = 400
            probabilities[35] = 300
        end
    elseif distanceEnemy >= 5 then
        probabilities[1] = 50
        probabilities[2] = 300
        probabilities[3] = 200
        probabilities[4] = 0
        probabilities[11] = 50
        probabilities[16] = 50
        probabilities[23] = 100
        probabilities[42] = 300
        if ai:HasSpecialEffectId(TARGET_SELF, 5021) then
            probabilities[17] = 400
            probabilities[35] = 300
        end
    elseif distanceEnemy >= 3 then
        -- This "elseif" is where we come to when we take the sweep
        -- Note how [11] is not possible here
        probabilities[1] = 100
        probabilities[2] = 20
        probabilities[3] = 200
        probabilities[4] = 200
        probabilities[13] = 50
        probabilities[16] = 100
        probabilities[23] = 100
        if ai:HasSpecialEffectId(TARGET_SELF, 5021) then
            probabilities[25] = 50
            probabilities[35] = 250
        end
    else
        probabilities[1] = 100
        probabilities[2] = 20
        probabilities[3] = 200
        probabilities[4] = 200
        probabilities[11] = 100
        probabilities[13] = 100
        probabilities[16] = 100
        probabilities[24] = 100
        if ai:HasSpecialEffectId(TARGET_SELF, 5021) then
            probabilities[25] = 50
            probabilities[33] = 250
        end
    end
    if hpRatioSelf <= 0.5 then
        probabilities[4] = probabilities[4] + 200
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 5023) and ai:HasSpecialEffectId(TARGET_SELF, 5021) then
        probabilities[3] = 0
        probabilities[16] = 0
        probabilities[42] = 0
    end
    if ai:IsFinishTimer(7) == true and ai:GetDist(TARGET_FRI_0) <= 30 and ai:HasSpecialEffectId(TARGET_FRI_0, 3115030) then
        if distanceEnemy >= 2.5 then
            probabilities[19] = 10000
        else
            probabilities[32] = 1000
        end
    end
    if staminaRatioSelf <= 0.4 and ai:IsFinishTimer(6) == true then
        probabilities[40] = 500
    end
    if ai:IsFinishTimer(3) == false then
        probabilities[24] = 0
        probabilities[25] = 0
    end
    if SpaceCheck(ai, goal, 45, 2.5) == false and SpaceCheck(ai, goal, -45, 2.5) == false then
        probabilities[22] = 0
    end
    if SpaceCheck(ai, goal, 90, 1) == false and SpaceCheck(ai, goal, -90, 1) == false then
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 180, 2.5) == false then
        probabilities[24] = 0
    end
    if SpaceCheck(ai, goal, 180, 1) == false then
        probabilities[25] = 0
    end
    if ai:IsInsideTargetRegion(TARGET_SELF, 1112250) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1112250) then
        probabilities[42] = 0
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 5023) and ai:HasSpecialEffectId(TARGET_ENE_0, 110270) then
        probabilities[30] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3000, 5, probabilities[1], 1)
    probabilities[1] = SetCoolTime(ai, goal, 3032, 5, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3003, 8, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3062, 8, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3067, 10, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3008, 15, probabilities[5], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3034, 5, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3009, 8, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3010, 20, probabilities[7], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3019, 20, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3011, 8, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3014, 10, probabilities[9], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3035, 5, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3015, 20, probabilities[10], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3017, 5, probabilities[11], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3010, 15, probabilities[12], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3019, 15, probabilities[12], 1)
    probabilities[13] = SetCoolTime(ai, goal, 3020, 15, probabilities[13], 1)
    probabilities[16] = SetCoolTime(ai, goal, 3001, 15, probabilities[16], 1)
    probabilities[17] = SetCoolTime(ai, goal, 3023, 15, probabilities[17], 1)
    probabilities[18] = SetCoolTime(ai, goal, 3019, 15, probabilities[18], 1)
    probabilities[19] = SetCoolTime(ai, goal, 3090, 3, probabilities[19], 1)
    probabilities[22] = SetCoolTime(ai, goal, 5202, 3, probabilities[22], 1)
    probabilities[22] = SetCoolTime(ai, goal, 5203, 3, probabilities[22], 1)
    probabilities[23] = SetCoolTime(ai, goal, 5010, 2, probabilities[23], 1)
    probabilities[24] = SetCoolTime(ai, goal, 5010, 2, probabilities[24], 1)
    probabilities[25] = SetCoolTime(ai, goal, 5010, 2, probabilities[25], 1)
    probabilities[30] = SetCoolTime(ai, goal, 3041, 4, probabilities[30], 1)
    probabilities[33] = SetCoolTime(ai, goal, 3026, 8, probabilities[33], 1)
    probabilities[33] = SetCoolTime(ai, goal, 3027, 8, probabilities[33], 1)
    probabilities[35] = SetCoolTime(ai, goal, 3026, 8, probabilities[35], 1)
    probabilities[35] = SetCoolTime(ai, goal, 3027, 8, probabilities[35], 1)
    probabilities[37] = SetCoolTime(ai, goal, 3062, 5, probabilities[37], 1)
    probabilities[37] = SetCoolTime(ai, goal, 6800, 5, probabilities[37], 1)
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
    acts[29] = REGIST_FUNC(ai, goal, self.Act29)
    acts[30] = REGIST_FUNC(ai, goal, self.Act30)
    acts[31] = REGIST_FUNC(ai, goal, self.Act31)
    acts[32] = REGIST_FUNC(ai, goal, self.Act32)
    acts[33] = REGIST_FUNC(ai, goal, self.Act33)
    acts[34] = REGIST_FUNC(ai, goal, self.Act34)
    acts[35] = REGIST_FUNC(ai, goal, self.Act35)
    acts[36] = REGIST_FUNC(ai, goal, self.Act36)
    acts[37] = REGIST_FUNC(ai, goal, self.Act37)
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
    local stopDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    if ai:HasSpecialEffectId(TARGET_SELF, 5021) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3026, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3000, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act02 = function (ai, goal, paramTbl)
    local stopDist = 6.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6.8 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local upAngleThreshold = 0
    local downAngleThreshold = 0
    if distanceEnemy <= 5 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3036, TARGET_ENE_0, 9999, upAngleThreshold, downAngleThreshold, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3003, TARGET_ENE_0, 9999, upAngleThreshold, downAngleThreshold, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3033, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act03 = function (ai, goal, paramTbl)
    local stopDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF) + 10
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local upAngleThreshold = 0
    local downAngleThreshold = 0
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3062, TARGET_ENE_0, 9999, upAngleThreshold, downAngleThreshold, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3064, TARGET_ENE_0, 9999, upAngleThreshold, downAngleThreshold, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act04 = function (ai, goal, paramTbl)
    local stopDist = 3.6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 3.6 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    local f6_local7 = 5.6 - ai:GetMapHitRadius(TARGET_SELF)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    if ai:HasSpecialEffectId(TARGET_SELF, 5021) then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3026, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3067, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3018, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act05 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local stopDist = 5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 5 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 5 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local random = ai:GetRandam_Int(1, 100)
    local animationId = 3008
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    local f7_local10 = 5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local f7_local13 = 0
    local f7_local14 = 3031
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 15, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act06 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f8_local7 = 0
    local f8_local8 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3009, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 15, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act07 = function (ai, goal, paramTbl)
    local stopDist = 7.1 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 7.1 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3019, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 15, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act08 = function (ai, goal, paramTbl)
    local f10_local0 = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2.5 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 2.5 - ai:GetMapHitRadius(TARGET_SELF) + 2
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, f10_local0 + distanceYEnemy / 2, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3011, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 4, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act09 = function (ai, goal, paramTbl)
    local stopDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    local f11_local7 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    local animationId = 3018
    local f11_local12 = 0
    local f11_local13 = 3031
    if SpaceCheck(ai, goal, 45, 2.5) == true then
        f11_local12 = 1
        animationId = 3018
        stopDist = 4 - ai:GetMapHitRadius(TARGET_SELF) + 3
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, animationId, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act10 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act11 = function (ai, goal, paramTbl)
    local stopDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3017, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act12 = function (ai, goal, paramTbl)
    local stopDist = 4.7 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 4.7 - ai:GetMapHitRadius(TARGET_SELF)
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3019, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 15, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act13 = function (ai, goal, paramTbl)
    local stopDist = 3.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 3.8 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3020, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act14 = function (ai, goal, paramTbl)
    local stopDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3036, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act15 = function (ai, goal, paramTbl)
    local stopDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3037, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act16 = function (ai, goal, paramTbl)
    local stopDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act17 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1.5
    local runLife = 3
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    if distanceEnemy <= forceRunMinDist then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.5, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3021, TARGET_ENE_0, 999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3022, TARGET_ENE_0, 999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3022, TARGET_ENE_0, 999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3023, TARGET_ENE_0, 999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act18 = function (ai, goal, paramTbl)
    local stopDist = 4.7 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 2.8 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 4.7 - ai:GetMapHitRadius(TARGET_SELF)
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f20_local7 = 0
    local f20_local8 = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3019, TARGET_ENE_0, 999, 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3007, TARGET_ENE_0, 999, 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act19 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f21_local1 = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local f21_local2 = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local f21_local3 = 6 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local f21_local4 = 0
    local f21_local5 = 0
    local f21_local6 = 3
    local f21_local7 = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        f21_local4 = 100
    end
    if distanceEnemy <= 5 and SpaceCheck(ai, goal, 180, 3) == true then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0):TimingSetTimer(0, 2, AI_TIMING_SET__ACTIVATE):TimingSetTimer(3, 10, AI_TIMING_SET__ACTIVATE)
    end
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3090, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(0, 1, AI_TIMING_SET__ACTIVATE):TimingSetTimer(7, 5, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act20 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    if distanceEnemy <= 5 and SpaceCheck(ai, goal, 180, 3) == true then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0):TimingSetTimer(0, 2, AI_TIMING_SET__ACTIVATE):TimingSetTimer(3, 10, AI_TIMING_SET__ACTIVATE)
    end
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3091, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(0, 1, AI_TIMING_SET__ACTIVATE):TimingSetTimer(6, 8, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act30 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f23_local1 = 3
    local f23_local2 = 0
    local f23_local3 = 3020
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3041, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    GetWellSpace_Odds = 100
    return GET_WELL_SPACE_ODDS
end

Goal.Act31 = function (ai, goal, paramTbl)
    local stopDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4.2 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3036, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3033, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act32 = function (ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3005, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3090, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0):TimingSetNumber(0, 1, AI_TIMING_SET__ACTIVATE):TimingSetTimer(7, 5, AI_TIMING_SET__ACTIVATE)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, ai:GetRandam_Float(0.2, 0.8), TARGET_ENE_0, 999, TARGET_ENE_0, true, -1):TimingSetTimer(3, 5, AI_TIMING_SET__ACTIVATE)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act33 = function (ai, goal, paramTbl)
    local f26_local0 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3027, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3028, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3029, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act34 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f27_local8 = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3026, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3029, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act35 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local successDist = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local successDist_2 = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3026, TARGET_ENE_0, successDist, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3028, TARGET_ENE_0, successDist_2, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3029, TARGET_ENE_0, 9999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act36 = function (ai, goal, paramTbl)
    local goalLife = 3
    ai:SetEventMoveTarget(1122330)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, POINT_EVENT, 0.5, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act37 = function (ai, goal, paramTbl)
    local stopDist = 1.2
    local canRunDist = 0
    local forceRunMinDist = 1
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 1
    local runLife = 1
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local upAngleThreshold = 0
    local downAngleThreshold = 0
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3062, TARGET_ENE_0, 9999, upAngleThreshold, downAngleThreshold, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3064, TARGET_ENE_0, 9999, upAngleThreshold, downAngleThreshold, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act40 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local f31_local2 = 0
    local f31_local3 = 3020
    local turnTime = 0
    local turnFaceAngle = 0
    if distanceEnemy < 5 and SpaceCheck(ai, goal, 180, 4) == true then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5201, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0):TimingSetTimer(3, 6, UPDATE_SUCCESS)
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5201, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0):TimingSetTimer(3, 6, UPDATE_SUCCESS)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3040, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetTimer(4, 8, UPDATE_SUCCESS)
    ai:SetTimer(6, 20)
    return GET_WELL_SPACE_ODDS
end

Goal.Act41 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local f32_local2 = 3
    local angleThreshold = ai:GetRandam_Int(30, 45)
    local guardStateId = -1
    local right = ai:GetRandam_Int(0, 1)
    if distanceEnemy <= 3 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, WalkLife, TARGET_ENE_0, 4, TARGET_ENE_0, true, guard)
    else
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, guardStateId)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Act42 = function (ai, goal, paramTbl)
    local stopDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 4.8 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f33_local7 = 4 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3024, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    if not ai:IsInsideTargetRegion(TARGET_SELF, 1112250) and not ai:IsInsideTargetRegion(TARGET_ENE_0, 1112250) then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3034, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 10, AI_TIMING_SET__ACTIVATE)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act43 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local f34_local1 = 3
    local f34_local2 = 0
    local f34_local3 = 3020
    local turnTime = 0
    local turnFaceAngle = 0
    if distanceEnemy <= 3 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 1, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3045, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetTimer(8, 8, AI_TIMING_SET__ACTIVATE)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3045, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0):TimingSetTimer(8, 8, AI_TIMING_SET__ACTIVATE)
    end
    GetWellSpace_Odds = 100
    return GET_WELL_SPACE_ODDS
end

Goal.Act44 = function (ai, goal, paramTbl)
    local stopDist = 6 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 0
    local forceRunMinDist = 6 - ai:GetMapHitRadius(TARGET_SELF) + 5
    local runProbability = 0
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        runProbability = 100
    end
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    local f35_local7 = 4.5 - ai:GetMapHitRadius(TARGET_SELF)
    local f35_local8 = 4.8 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3017, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3024, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3033, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3064, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3035, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3007, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3026, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3028, TARGET_ENE_0, 9999, turnTime, turnFaceAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3029, TARGET_ENE_0, 9999, 0, 0)
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
    if SpaceCheck(ai, goal, -45, 2.5) == true then
        if SpaceCheck(ai, goal, 45, 2.5) == true then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                animationId = 5202
            else
                animationId = 5203
            end
        else
            animationId = 5202
        end
    elseif SpaceCheck(ai, goal, 45, 2.5) == true then
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
    local random = ai:GetRandam_Int(1, 100)
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
    local goalLife = ai:GetRandam_Float(3, 3)
    local angleThreshold = ai:GetRandam_Int(30, 45)
    if ai:GetStringIndexedNumber("heatUpMode") == 1 then
        goalLife = ai:GetRandam_Float(2, 3.5)
    end
    ai:SetNumber(10, right)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, goalLife, TARGET_ENE_0, right, angleThreshold, true, true, -1):TimingSetNumber(5, 0, AI_TIMING_SET__ACTIVATE)
    local f38_local6 = 90
    local f38_local7 = 4
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act24 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local goalLife = 3
    local turnTime = 0
    local animationId = 5201
    local random = ai:GetRandam_Int(1, 100)
    if SpaceCheck(ai, goal, 180, 6) == true and random <= 50 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0)
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0):TimingSetTimer(0, 2, AI_TIMING_SET__ACTIVATE):TimingSetTimer(3, 10, AI_TIMING_SET__ACTIVATE)
    else
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, animationId, TARGET_ENE_0, turnTime, AI_DIR_TYPE_B, 0):TimingSetTimer(0, 2, AI_TIMING_SET__ACTIVATE):TimingSetTimer(3, 10, AI_TIMING_SET__ACTIVATE)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Goal.Act25 = function (ai, goal, paramTbl)
    local goalLife = ai:GetRandam_Float(2, 4)
    local stopDist = ai:GetRandam_Float(5, 7)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local guardStateId = -1
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, goalLife, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, guardStateId):TimingSetTimer(3, 5, AI_TIMING_SET__ACTIVATE)
    local f40_local4 = 90
    local f40_local5 = 4
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
    if distanceYEnemy >= 2.5 then
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

Goal.Act29 = function (ai, goal, paramTbl)
    local goalLife = 3
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, goalLife, TARGET_ENE_0, 8, TARGET_SELF, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Interrupt = function (self, ai, goal)
    local interruptEffect = ai:GetSpecialEffectActivateInterruptType(0)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    local random = ai:GetRandam_Int(0, 100)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 200004) then
        return false
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        return Common_Parry(ai, goal, 50, 0, 1, 3102)
    end
    if ai:IsInterupt(INTERUPT_Damaged) and not ai:HasSpecialEffectId(TARGET_SELF, 5028) then
        return self.Damaged(ai, goal)
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if interruptEffect == 5027 then
            if distanceEnemy <= 3.8 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 2, 3023, TARGET_ENE_0, 9999, 0, 0)
                return true
            elseif distanceEnemy >= 5.5 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_EndureAttack, 2, 3023, TARGET_ENE_0, 9999, 0, 0)
                return true
            end
        elseif interruptEffect == 5028 then
            if ai:HasSpecialEffectId(TARGET_SELF, 3147111) and distanceEnemy <= 4 then
                ai:Replanning()
                return true
            end
        elseif interruptEffect == 5029 then
            if ai:HasSpecialEffectId(TARGET_SELF, 5023) and distanceEnemy >= 3 and distanceEnemy <= 9 then
                if random <= 50 then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3018, TARGET_ENE_0, 9999, 0, 0, 0, 0)
                    return true
                else
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3003, TARGET_ENE_0, 9999, 0, 0, 0, 0)
                    return true
                end
            end
        elseif interruptEffect == 3147120 then
            ai:SetNumber(3, 1)
        end
    end
    if ai:IsInterupt(INTERUPT_ShootImpact) and self.ShootReaction(ai, goal) then
        return true
    end
    if Interupt_Use_Item(ai, 10, 10) and ai:HasSpecialEffectId(TARGET_SELF, 5023) then
        if ThinkParam == 14703000 and distanceYEnemy <= -1.1 then
            ai:Replanning()
            return true
        elseif distanceEnemy <= 2.5 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3000, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        elseif distanceEnemy <= 5 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3018, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        elseif ai:HasSpecialEffectId(TARGET_SELF, 5021) and distanceEnemy <= 6 - ai:GetMapHitRadius(TARGET_SELF) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3026, TARGET_ENE_0, 9999, 0, 0, 0, 0)
            return true
        else
            ai:Replanning()
            return true
        end
    end
    return false
end

Goal.Damaged = function (ai, goal, f46_arg2)
    local goalLife = 1
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    if SpaceCheck(ai, goal, 180, 2.5) and ai:IsFinishTimer(3) and random <= 50 then
        goal:ClearSubGoal()
        ai:SetTimer(3, 6)
        goal:AddSubGoal(GOAL_COMMON_SpinStep, goalLife, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0):TimingSetTimer(0, 2, AI_TIMING_SET__ACTIVATE)
        return true
    end
    return false
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

Goal.Kengeki_Activate = function (self, ai, goal, f48_arg3)
    local kengekiEffect = ReturnKengekiSpecialEffect(ai)
    if kengekiEffect == 0 then
        return false
    end
    if kengekiEffect == 200215 or kengekiEffect == 200216 or kengekiEffect == 200200 or kengekiEffect == 200201 then
        ai:SetNumber(1, ai:GetNumber(1) + 1)
    end
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    local distanceYEnemy = ai:GetDistYSigned(TARGET_ENE_0)
    local staminaSelf = ai:GetSp(TARGET_SELF)
    local f48_local7 = 90
    local random = ai:GetRandam_Int(4, 6)
    local number1 = ai:GetNumber(1)
    local random_2 = ai:GetRandam_Int(1, 100)
    local hpRatioSelf = ai:GetHpRate(TARGET_SELF)
    local thinkParam = ai:GetNpcThinkParamID()
    if kengekiEffect == 200228 then
        probabilities[6] = 100
        probabilities[50] = 50
    elseif distanceEnemy >= 4 then
        probabilities[50] = 1000
    elseif thinkParam == 14703000 and distanceYEnemy <= -1.1 then
        probabilities[18] = 500
        probabilities[26] = 400
        probabilities[50] = 100
    elseif kengekiEffect == 200210 then
        probabilities[5] = 350
        probabilities[6] = 650
        probabilities[22] = 650
    elseif kengekiEffect == 200211 then
        probabilities[5] = 350
        probabilities[6] = 650
        probabilities[22] = 650
    elseif number1 >= 4 then
        if distanceEnemy <= 4 then
            if hpRatioSelf <= 0.5 then
                probabilities[10] = 100
                probabilities[40] = 1
            else
                probabilities[40] = 10
            end
        else
            probabilities[50] = 50
        end
    elseif kengekiEffect == 200205 then
        probabilities[2] = 300
        probabilities[3] = 100
        probabilities[8] = 100
        probabilities[16] = 200
    elseif kengekiEffect == 200200 then
        probabilities[10] = 50
        probabilities[11] = 200
        probabilities[18] = 300
        probabilities[24] = 300
    elseif kengekiEffect == 200215 then
        probabilities[2] = 200
        probabilities[3] = 200
        probabilities[8] = 200
        if ai:GetDist(TARGET_FRI_0) <= 30 and ai:HasSpecialEffectId(TARGET_FRI_0, 3115030) then
            probabilities[41] = 10000
        end
    elseif kengekiEffect == 200206 then
        probabilities[2] = 200
        probabilities[4] = 300
    elseif kengekiEffect == 200201 then
        probabilities[10] = 50
        probabilities[19] = 100
        probabilities[24] = 300
    elseif kengekiEffect == 200216 then
        probabilities[2] = 200
        probabilities[4] = 300
        if ai:IsFinishTimer(7) == true and ai:GetDist(TARGET_FRI_0) <= 30 and ai:HasSpecialEffectId(TARGET_FRI_0, 3115030) then
            probabilities[41] = 10000
        end
    elseif kengekiEffect == 200225 then
        probabilities[2] = 300
        probabilities[3] = 200
    elseif kengekiEffect == 200227 then
        probabilities[18] = 300
        probabilities[24] = 300
    else
    end
    if distanceEnemy >= 2 then
        probabilities[2] = 0
        probabilities[8] = 0
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 5023) and ai:HasSpecialEffectId(TARGET_SELF, 5021) then
        probabilities[2] = 0
        probabilities[8] = 0
        probabilities[10] = 0
        probabilities[11] = 0
        probabilities[40] = 0
    end
    if not ai:HasSpecialEffectId(TARGET_SELF, 5021) then
        probabilities[22] = 0
    end
    if SpaceCheck(ai, goal, 180, 2.5) == false then
        probabilities[24] = 0
    end
    if SpaceCheck(ai, goal, 90, 1) == false and SpaceCheck(ai, goal, -90, 1) == false then
        probabilities[23] = 0
    end
    if SpaceCheck(ai, goal, 180, 1) == false then
        probabilities[25] = 0
    end
    if ai:IsFinishTimer(3) == false then
        probabilities[24] = 0
    end
    if ai:IsInsideTargetRegion(TARGET_SELF, 1112250) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1112250) then
        probabilities[6] = 0
    end
    probabilities[1] = SetCoolTime(ai, goal, 3015, 5, probabilities[1], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3017, 3, probabilities[2], 1)
    probabilities[2] = SetCoolTime(ai, goal, 3058, 3, probabilities[2], 1)
    probabilities[3] = SetCoolTime(ai, goal, 3051, 5, probabilities[3], 1)
    probabilities[4] = SetCoolTime(ai, goal, 3055, 5, probabilities[4], 1)
    probabilities[5] = SetCoolTime(ai, goal, 3056, 5, probabilities[5], 1)
    probabilities[6] = SetCoolTime(ai, goal, 3019, 20, probabilities[6], 1)
    probabilities[7] = SetCoolTime(ai, goal, 3066, 2, probabilities[7], 1)
    probabilities[8] = SetCoolTime(ai, goal, 3060, 2, probabilities[8], 1)
    probabilities[9] = SetCoolTime(ai, goal, 3008, 5, probabilities[9], 1)
    probabilities[10] = SetCoolTime(ai, goal, 3018, 5, probabilities[10], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3062, 2, probabilities[11], 1)
    probabilities[11] = SetCoolTime(ai, goal, 3066, 2, probabilities[11], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3058, 2, probabilities[12], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3060, 2, probabilities[12], 1)
    probabilities[12] = SetCoolTime(ai, goal, 3067, 2, probabilities[12], 1)
    probabilities[14] = SetCoolTime(ai, goal, 3033, 5, probabilities[14], 1)
    probabilities[16] = SetCoolTime(ai, goal, 3063, 2, probabilities[16], 1)
    probabilities[17] = SetCoolTime(ai, goal, 3068, 2, probabilities[17], 1)
    probabilities[18] = SetCoolTime(ai, goal, 3064, 2, probabilities[18], 1)
    probabilities[22] = SetCoolTime(ai, goal, 3028, 20, probabilities[22], 1)
    probabilities[41] = SetCoolTime(ai, goal, 3090, 4, probabilities[41], 1)
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
    acts[22] = REGIST_FUNC(ai, goal, self.Kengeki22)
    acts[23] = REGIST_FUNC(ai, goal, self.Act23)
    acts[24] = REGIST_FUNC(ai, goal, self.Act24)
    acts[25] = REGIST_FUNC(ai, goal, self.Act25)
    acts[26] = REGIST_FUNC(ai, goal, self.Kengeki26)
    acts[40] = REGIST_FUNC(ai, goal, self.Kengeki40)
    acts[41] = REGIST_FUNC(ai, goal, self.Kengeki41)
    acts[42] = REGIST_FUNC(ai, goal, self.Kengeki42)
    acts[43] = REGIST_FUNC(ai, goal, self.Kengeki43)
    acts[44] = REGIST_FUNC(ai, goal, self.Kengeki44)
    acts[45] = REGIST_FUNC(ai, goal, self.Kengeki45)
    acts[50] = REGIST_FUNC(ai, goal, self.NoAction)
    local actAfter = REGIST_FUNC(ai, goal, self.ActAfter_AdjustSpace)
    return Common_Kengeki_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

Goal.Kengeki01 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3015, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 15, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki02 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3058, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki03 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3051, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki04 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3055, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    if ai:HasSpecialEffectId(TARGET_SELF, 5022) and not ai:IsInsideTargetRegion(TARGET_SELF, 1112250) and not ai:IsInsideTargetRegion(TARGET_ENE_0, 1112250) then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3034, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 10, AI_TIMING_SET__ACTIVATE)
    end
end

Goal.Kengeki05 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3056, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3067, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki06 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3019, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 15, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki07 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3066, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki08 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3060, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki09 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3008, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 15, AI_TIMING_SET__ACTIVATE)
    ai:SetNumber(1, 0)
end

Goal.Kengeki10 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3031, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3018, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    ai:SetNumber(1, 0)
end

Goal.Kengeki11 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3062, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3008, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki12 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 1, 3067, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki13 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    goal:ClearSubGoal()
    if distanceEnemy <= 2 - ai:GetMapHitRadius(TARGET_SELF) + 0.3 then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3005, TARGET_ENE_0, 9999, 0, 0):TimingSetTimer(0, 2, AI_TIMING_SET__ACTIVATE)
    else
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0):TimingSetTimer(0, 2, AI_TIMING_SET__ACTIVATE)
    end
    ai:SetTimer(3, 3)
end

Goal.Kengeki14 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3032, TARGET_ENE_0, 5 - ai:GetMapHitRadius(TARGET_SELF) + 1, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3008, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki15 = function (ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3032, TARGET_ENE_0, 4.5 - ai:GetMapHitRadius(TARGET_SELF), 0)
end

Goal.Kengeki16 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3063, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki17 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3068, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki18 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3064, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki19 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3069, TARGET_ENE_0, 9999, 0, 0):TimingSetNumber(5, ai:GetNumber(5) + 3, AI_TIMING_SET__ACTIVATE)
end

Goal.Kengeki20 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, 9999, TurnTime, FrontAngle, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3033, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki21 = function (ai, goal, paramTbl)
    local stopDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local canRunDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local forceRunMinDist = 3.5 - ai:GetMapHitRadius(TARGET_SELF)
    local runProbability = 100
    local guardProbability = 0
    local walkLife = 3
    local runLife = 3
    goal:ClearSubGoal()
    Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProbability, guardProbability, walkLife, runLife)
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3062, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3008, TARGET_ENE_0, 9999, 0, 0)
end

Goal.Kengeki22 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3028, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3029, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(1, 0)
end

Goal.Kengeki26 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3009, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(1, 0)
end

Goal.Kengeki40 = function (ai, goal, paramTbl)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3009, TARGET_ENE_0, 9999, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3033, TARGET_ENE_0, 9999, 0, 0)
    ai:SetNumber(1, 0)
end

Goal.Kengeki41 = function (ai, goal, paramTbl)
    local distanceEnemy = ai:GetDist(TARGET_ENE_0)
    goal:ClearSubGoal()
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 5201, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0):TimingSetTimer(0, 2, AI_TIMING_SET__ACTIVATE):TimingSetTimer(3, 10, AI_TIMING_SET__ACTIVATE)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3090, TARGET_ENE_0, 9999, 0, 0):TimingSetTimer(7, 8, AI_TIMING_SET__ACTIVATE)
    ai:SetNumber(1, 0)
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

