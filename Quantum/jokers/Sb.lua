
SMODS.Joker{ --Antimony
    key = "Sb",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Antimony',
        ['text'] = {
            [1] = 'When a Card is bought',
            [2] = 'this card gives {C:red}+2',
            [3] = 'Mult {} more when a',
            [4] = 'card is scored. Current',
            [5] = 'Mult: {C:red}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card  then
            return {
                func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 2
                    return true
                end
            }
        end
        if context.individual and context.cardarea == G.play  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}