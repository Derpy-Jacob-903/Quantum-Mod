
SMODS.Joker{ --Tau
    key = "tau",
    config = {
        extra = {
            xmult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Tau',
        ['text'] = {
            [1] = 'Gives 10x Mult for free.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
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
                Xmult = 10
            }
        end
    end
}