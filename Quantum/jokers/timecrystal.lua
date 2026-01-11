
SMODS.Joker{ --Time Crystal
    key = "timecrystal",
    config = {
        extra = {
            odds = 2,
            odds2 = 3,
            odds3 = 4,
            odds4 = 4,
            odds5 = 4,
            odds6 = 4,
            odds7 = 4,
            odds8 = 4,
            odds9 = 4,
            odds10 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Time Crystal',
        ['text'] = {
            [1] = '{C:green}1 in 2{} Chance to apply {C:red}Red{} Seal',
            [2] = '{C:green}1 in 3 {}Chance to apply Re: 2, if {C:red}Red{} Seal',
            [3] = '{C:green}1 in 4{} Chance to apply Re: 3 if Re: 2',
            [4] = '{C:green}1 in 4 {}Chance to apply Re: 4 if Re: 3',
            [5] = '{C:green}1 in 4{} Chance to apply Re: 5 if Re: 4',
            [6] = '{C:green}1 in 4 {}Chance to apply Re: 6, and etc.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 25,
    rarity = "quant_exotic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_quant_timecrystal')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_quant_timecrystal')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_quant_timecrystal')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_quant_timecrystal')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds5, 'j_quant_timecrystal')
        local new_numerator6, new_denominator6 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds6, 'j_quant_timecrystal')
        local new_numerator7, new_denominator7 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds7, 'j_quant_timecrystal')
        local new_numerator8, new_denominator8 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds8, 'j_quant_timecrystal')
        local new_numerator9, new_denominator9 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds9, 'j_quant_timecrystal')
        local new_numerator10, new_denominator10 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds10, 'j_quant_timecrystal')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5, new_numerator6, new_denominator6, new_numerator7, new_denominator7, new_numerator8, new_denominator8, new_numerator9, new_denominator9, new_numerator10, new_denominator10}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (context.other_card.seal ~= nil) then
                if SMODS.pseudorandom_probability(card, 'group_0_b711c996', 1, card.ability.extra.odds, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("Red", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif context.other_card.seal == "Red" then
                if SMODS.pseudorandom_probability(card, 'group_0_0f6935fa', 1, card.ability.extra.odds2, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("quant_re2", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif context.other_card.seal == "Quant_re2" then
                if SMODS.pseudorandom_probability(card, 'group_0_662d1adf', 1, card.ability.extra.odds3, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("quant_re3", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif context.other_card.seal == "Quant_re3" then
                if SMODS.pseudorandom_probability(card, 'group_0_26a218ba', 1, card.ability.extra.odds3, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("quant_re4", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif context.other_card.seal == "Quant_re4" then
                if SMODS.pseudorandom_probability(card, 'group_0_8843df46', 1, card.ability.extra.odds3, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("quant_re5", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif context.other_card.seal == "Quant_re5" then
                if SMODS.pseudorandom_probability(card, 'group_0_f46681ad', 1, card.ability.extra.odds3, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("quant_re6", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif context.other_card.seal == "Quant_re6" then
                if SMODS.pseudorandom_probability(card, 'group_0_d266114f', 1, card.ability.extra.odds3, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("quant_re7", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif context.other_card.seal == "Quant_re7" then
                if SMODS.pseudorandom_probability(card, 'group_0_409aa6a9', 1, card.ability.extra.odds3, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("quant_re8", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif context.other_card.seal == "Quant_re8" then
                if SMODS.pseudorandom_probability(card, 'group_0_6b226cdc', 1, card.ability.extra.odds3, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("quant_re9", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            elseif context.other_card.seal == "Quant_re9" then
                if SMODS.pseudorandom_probability(card, 'group_0_4e0eea10', 1, card.ability.extra.odds3, 'j_quant_timecrystal', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("quant_re10", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}