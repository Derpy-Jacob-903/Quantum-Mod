
SMODS.Joker{ --Bottom Quark
    key = "BottomQuark",
    config = {
        extra = {
            xmult0 = 25
        }
    },
    loc_txt = {
        ['name'] = 'Bottom Quark',
        ['text'] = {
            [1] = 'Gives a free 25X Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 35,
    rarity = "quant_ultra_rare",
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
                Xmult = 25
            }
        end
    end
}