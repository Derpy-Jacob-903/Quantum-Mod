
SMODS.Joker{ --Molybdenum
    key = "Mo",
    config = {
        extra = {
            xchip = 1
        }
    },
    loc_txt = {
        ['name'] = 'Molybdenum',
        ['text'] = {
            [1] = 'When a consumable is',
            [2] = 'used gain + {X:chips,C:white}×0.05{} {C:blue}Chips{}',
            [3] = 'Current Chips: {X:chips,C:white}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xchip}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            return {
                func = function()
                    card.ability.extra.xchip = (card.ability.extra.xchip) + 0.05
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.xchip
            }
        end
    end
}