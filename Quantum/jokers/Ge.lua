
SMODS.Joker{ --Germanium
    key = "Ge",
    config = {
        extra = {
            chipsmod = 0
        }
    },
    loc_txt = {
        ['name'] = 'Germanium',
        ['text'] = {
            [1] = 'Gains {C:blue}10 {}Chips when shop',
            [2] = 'is rerolled permanently.',
            [3] = 'Current Chips: {X:blue,C:white}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 8
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
        
        return {vars = {card.ability.extra.chipsmod}}
    end,
    
    calculate = function(self, card, context)
        if context.reroll_shop  then
            return {
                func = function()
                    card.ability.extra.chipsmod = (card.ability.extra.chipsmod) + 10
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chipsmod
            }
        end
    end
}