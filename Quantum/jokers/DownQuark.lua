
SMODS.Joker{ --Down Quark
    key = "DownQuark",
    config = {
        extra = {
            mult0 = 500
        }
    },
    loc_txt = {
        ['name'] = 'Down Quark',
        ['text'] = {
            [1] = 'gives 500 MULT for free'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 25,
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
                mult = 500
            }
        end
    end
}