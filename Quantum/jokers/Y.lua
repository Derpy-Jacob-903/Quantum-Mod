
SMODS.Joker{ --Yttrium
    key = "Y",
    config = {
        extra = {
            chips = 0,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Yttrium',
        ['text'] = {
            [1] = 'When a card is discarded',
            [2] = '{C:green}#2# in #3#{} chance to gain perm',
            [3] = '{C:blue}10 Chips{}. Current Chips:',
            [4] = '{X:blue,C:white}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_quant_Y') 
        return {vars = {card.ability.extra.chips, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fbe37739', 1, card.ability.extra.odds, 'j_quant_Y', false) then
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.chips = (card.ability.extra.chips) + 10
                        return true
                    end}, card)
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}