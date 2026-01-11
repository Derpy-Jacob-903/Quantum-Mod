
SMODS.Joker{ --Ruthenium
    key = "Ru",
    config = {
        extra = {
            money = 0,
            odds = 20
        }
    },
    loc_txt = {
        ['name'] = 'Ruthenium',
        ['text'] = {
            [1] = 'when a Joker is triggered',
            [2] = 'there is a {C:green}#2# in #3#{} chance',
            [3] = 'to gain perm {C:money}+1${}. Current $:',
            [4] = '{X:money,C:white}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_quant_Ru') 
        return {vars = {card.ability.extra.money, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.post_trigger  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_bf19ba46', 1, card.ability.extra.odds, 'j_quant_Ru', false) then
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.money = (card.ability.extra.money) + 1
                        return true
                    end}, card)
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.money
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.money), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}