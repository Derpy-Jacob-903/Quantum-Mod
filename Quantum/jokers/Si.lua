
SMODS.Joker{ --Silicon
    key = "Si",
    config = {
        extra = {
            dollars0 = 5,
            xmult0 = 1.75,
            xmult = 4,
            odds = 4,
            xmult2 = 1.25,
            xchips0 = 1.25,
            mult0 = 16,
            odds2 = 5,
            odds2 = 2,
            dollars = 10,
            mult = 20,
            chips0 = 500,
            chips = 150
        }
    },
    loc_txt = {
        ['name'] = 'Silicon',
        ['text'] = {
            [1] = 'Effect depends on the card {C:enhanced}Enhancement:{}',
            [2] = 'Gold Cards give {C:money}5${}',
            [3] = 'Steel Cards give {X:red,C:white}1.75X{} Mult',
            [4] = 'Glass cards Give {X:red,C:white}4X{} Mult but have',
            [5] = 'a 3 in 4 Chance to be destroyed.',
            [6] = '{C:attention}{}Wildcards Give {X:red,C:white}1.25X{} Mult and {X:blue,C:white}1.25X{} Chips',
            [7] = 'Mult Cards Give {C:red}+16{} Mult',
            [8] = 'Luky cards have a {C:green}1 in 2{} chance to give',
            [9] = '{C:red}+20{} Mult and a {C:green}1 in 5{} chace to give {C:gold}10${}',
            [10] = 'Stone cards give {C:blue}+500{} Chips',
            [11] = 'and {C:attention}{}Bonus cards give {C:blue}+150{} Chips.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
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
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 3, card.ability.extra.odds, 'j_quant_Si')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_quant_Si')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_quant_Si')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 5
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(5), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                return {
                    Xmult = 1.75
                }
            elseif SMODS.get_enhancements(context.other_card)["m_glass"] == true then
                return {
                    Xmult = 4
                }
            elseif SMODS.get_enhancements(context.other_card)["m_glass"] == true then
                if SMODS.pseudorandom_probability(card, 'group_0_994424bf', 3, card.ability.extra.odds, 'j_quant_Si', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            elseif SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                return {
                    Xmult = 1.25,
                    extra = {
                        x_chips = 1.25,
                        colour = G.C.DARK_EDITION
                    }
                }
            elseif SMODS.get_enhancements(context.other_card)["m_mult"] == true then
                return {
                    mult = 16
                }
            elseif SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                if SMODS.pseudorandom_probability(card, 'group_0_a41c2649', 1, card.ability.extra.odds2, 'j_quant_Si', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 10
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(10), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                    if SMODS.pseudorandom_probability(card, 'group_1_dc57e1b6', 1, card.ability.extra.odds3, 'j_quant_Si', false) then
                        SMODS.calculate_effect({mult = 20}, card)
                    end
                elseif SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                    return {
                        chips = 500
                    }
                elseif SMODS.get_enhancements(context.other_card)["m_bonus"] == true then
                    return {
                        chips = 150
                    }
                end
            end
        end
    }