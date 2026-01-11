
SMODS.Joker{ --Plasma
    key = "plasma",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Plasma',
        ['text'] = {
            [1] = 'Swap Chips and Mult',
            [2] = 'This card represents the kinds',
            [3] = 'of Plasma: Like Thermal Plasma',
            [4] = 'Through a fireball for example',
            [5] = 'or \"ionized plasma\" caused',
            [6] = 'through dielectric breakdown.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
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
    pools = { ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                swap = true
            }
        end
    end
}