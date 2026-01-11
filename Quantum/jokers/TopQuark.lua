
SMODS.Joker{ --Top Quark
    key = "TopQuark",
    config = {
        extra = {
            xmult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Top Quark',
        ['text'] = {
            [1] = 'Starts at 5X Mult and',
            [2] = 'gains 5X Mult at the',
            [3] = 'and of a Round.',
            [4] = 'Current X Mult: {X:mult,C:white}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 40,
    rarity = "quant_ultra_rare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 5
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}