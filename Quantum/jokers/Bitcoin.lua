
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
            dollars = 25
        }
    },
    loc_txt = {
        ['name'] = 'Bitcoin',
        ['text'] = {
            [1] = 'At the end of a Round,',
            [2] = '40% chance to add 3$ of sell value to itself',
            [3] = '40% chance to deduct 3$ of sell value',
            [4] = '15% chance nothing to add 15$ of sell value',
            [5] = 'and 5% chance to add 25$ of sell value!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
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
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_util"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 40, card.ability.extra.odds, 'j_quant_Bitcoin')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 40, card.ability.extra.odds2, 'j_quant_Bitcoin')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 15, card.ability.extra.odds3, 'j_quant_Bitcoin')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 5, card.ability.extra.odds4, 'j_quant_Bitcoin')
        return {vars = {card.ability.extra.rng, card.ability.extra.SV, new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4}}
    end,
    
    calculate = function(self, card, context)
        if context.other_joker  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d3073c25', 40, card.ability.extra.odds, 'j_quant_Bitcoin', false) then
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
                if SMODS.pseudorandom_probability(card, 'group_1_d28713a7', 40, card.ability.extra.odds, 'j_quant_Bitcoin', false) then
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
                if SMODS.pseudorandom_probability(card, 'group_2_dbbad15a', 15, card.ability.extra.odds, 'j_quant_Bitcoin', false) then
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
                    if SMODS.pseudorandom_probability(card, 'group_3_bc965d27', 5, card.ability.extra.odds, 'j_quant_Bitcoin', false) then
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
            end
        }