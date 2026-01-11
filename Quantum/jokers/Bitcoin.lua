
SMODS.Joker{ --Bitcoin
    key = "Bitcoin",
    config = {
        extra = {
            rng = 0,
            SV = 0,
            odds = 100,
            sell_value0 = 3,
            sell_value = 3,
            dollars0 = 15,
            dollars = 25,
            odds2 = 100,
            sell_value2 = 3,
            sell_value3 = 3,
            sell_value4 = 25,
            sell_value5 = 250
        }
    },
    loc_txt = {
        ['name'] = 'Bitcoin',
        ['text'] = {
            [1] = 'At the end of a Round,',
            [2] = '40% chance to add 3$ of sell value to itself',
            [3] = '40% chance to deduct 3$ of sell value',
            [4] = '15% chance for nothing',
            [5] = 'and 4.9% chance to add 25$ of sell value!',
            [6] = '0.1% Chance to add 250$ of sell value!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'Joker',
    pools = { ["modprefix_quant_jokers"] = true, ["modprefix_util"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 40, card.ability.extra.odds, 'j_modprefix_Bitcoin')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 40, card.ability.extra.odds2, 'j_modprefix_Bitcoin')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 15, card.ability.extra.odds3, 'j_modprefix_Bitcoin')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 5, card.ability.extra.odds4, 'j_modprefix_Bitcoin')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 40, card.ability.extra.odds5, 'j_modprefix_Bitcoin')
        local new_numerator6, new_denominator6 = SMODS.get_probability_vars(card, 40, card.ability.extra.odds6, 'j_modprefix_Bitcoin')
        local new_numerator7, new_denominator7 = SMODS.get_probability_vars(card, 15, card.ability.extra.odds7, 'j_modprefix_Bitcoin')
        local new_numerator8, new_denominator8 = SMODS.get_probability_vars(card, 4.9, card.ability.extra.odds8, 'j_modprefix_Bitcoin')
        local new_numerator9, new_denominator9 = SMODS.get_probability_vars(card, 0.1, card.ability.extra.odds9, 'j_modprefix_Bitcoin')
        return {vars = {card.ability.extra.rng, card.ability.extra.SV, new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5, new_numerator6, new_denominator6, new_numerator7, new_denominator7, new_numerator8, new_denominator8, new_numerator9, new_denominator9}}
    end,
    
    calculate = function(self, card, context)
        if context.other_joker  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d3073c25', 40, card.ability.extra.odds, 'j_modprefix_Bitcoin', false) then
                    SMODS.calculate_effect({func = function()local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_card = G.jokers.cards[my_pos]
                        target_card.ability.extra_value = math.max(0, (card.ability.extra_value or 0) - 3)
                        target_card:set_cost()
                        return true
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(3).." Sell Value", colour = G.C.MONEY})
                end
                if SMODS.pseudorandom_probability(card, 'group_1_d28713a7', 40, card.ability.extra.odds, 'j_modprefix_Bitcoin', false) then
                    SMODS.calculate_effect({func = function()local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_card = G.jokers.cards[my_pos]
                        target_card.ability.extra_value = (card.ability.extra_value or 0) + 3
                        target_card:set_cost()
                        return true
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Sell Value", colour = G.C.MONEY})
                end
                if SMODS.pseudorandom_probability(card, 'group_2_dbbad15a', 15, card.ability.extra.odds, 'j_modprefix_Bitcoin', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 15
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(15), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                    if SMODS.pseudorandom_probability(card, 'group_3_bc965d27', 5, card.ability.extra.odds, 'j_modprefix_Bitcoin', false) then
                        SMODS.calculate_effect({
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                                local target_dollars = G.GAME.dollars + 25
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(25), colour = G.C.MONEY})
                                return true
                            end}, card)
                        end
                    end
                end
                if context.end_of_round and context.game_over == false and context.main_eval  then
                    if true then
                        if SMODS.pseudorandom_probability(card, 'group_0_b76febe8', 40, card.ability.extra.odds, 'j_modprefix_Bitcoin', false) then
                            SMODS.calculate_effect({func = function()local my_pos = nil
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i] == card then
                                        my_pos = i
                                        break
                                    end
                                end
                                local target_card = G.jokers.cards[my_pos]
                                target_card.ability.extra_value = (card.ability.extra_value or 0) + 3
                                target_card:set_cost()
                                return true
                            end}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Sell Value", colour = G.C.MONEY})
                        end
                        if SMODS.pseudorandom_probability(card, 'group_1_8a11dd59', 40, card.ability.extra.odds, 'j_modprefix_Bitcoin', false) then
                            SMODS.calculate_effect({func = function()local my_pos = nil
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i] == card then
                                        my_pos = i
                                        break
                                    end
                                end
                                local target_card = G.jokers.cards[my_pos]
                                target_card.ability.extra_value = math.max(0, (card.ability.extra_value or 0) - 3)
                                target_card:set_cost()
                                return true
                            end}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(3).." Sell Value", colour = G.C.MONEY})
                        end
                        if SMODS.pseudorandom_probability(card, 'group_2_20ff62bc', 15, card.ability.extra.odds, 'j_modprefix_Bitcoin', false) then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "NOTHING", colour = G.C.YELLOW})
                        end
                        if SMODS.pseudorandom_probability(card, 'group_3_a853f54d', 4.9, card.ability.extra.odds, 'j_modprefix_Bitcoin', false) then
                            SMODS.calculate_effect({func = function()local my_pos = nil
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i] == card then
                                        my_pos = i
                                        break
                                    end
                                end
                                local target_card = G.jokers.cards[my_pos]
                                target_card.ability.extra_value = (card.ability.extra_value or 0) + 25
                                target_card:set_cost()
                                return true
                            end}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(25).." Sell Value", colour = G.C.MONEY})
                        end
                        if SMODS.pseudorandom_probability(card, 'group_4_87e2ecb7', 0.1, card.ability.extra.odds, 'j_modprefix_Bitcoin', false) then
                            SMODS.calculate_effect({func = function()local my_pos = nil
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i] == card then
                                        my_pos = i
                                        break
                                    end
                                end
                                local target_card = G.jokers.cards[my_pos]
                                target_card.ability.extra_value = (card.ability.extra_value or 0) + 250
                                target_card:set_cost()
                                return true
                            end}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(250).." Sell Value", colour = G.C.MONEY})
                        end
                    end
                end
            end
        }
