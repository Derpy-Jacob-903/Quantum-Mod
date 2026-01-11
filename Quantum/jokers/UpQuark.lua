
SMODS.Joker{ --Up Quark
    key = "UpQuark",
    config = {
        extra = {
            chips0 = 1000
        }
    },
    loc_txt = {
        ['name'] = 'Up Quark',
        ['text'] = {
            [1] = 'gives a free 1000 Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 2,
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
                chips = 1000
            }
        end
    end
}