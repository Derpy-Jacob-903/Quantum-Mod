
SMODS.Joker{ --Strontium
    key = "Sr",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Strontium',
        ['text'] = {
            [1] = 'when a tag is added,',
            [2] = 'gain + {X:mult,C:white}×0.25{} {C:red}Mult{} perm.',
            [3] = 'Current {}X Mult: {X:mult,C:white}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 8
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
        
        return {vars = {card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.tag_added  then
            return {
                func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 0.25
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