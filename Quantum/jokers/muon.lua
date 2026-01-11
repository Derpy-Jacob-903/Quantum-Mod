
SMODS.Joker{ --Muon
    key = "muon",
    config = {
        extra = {
            xmult0 = 6
        }
    },
    loc_txt = {
        ['name'] = 'Muon',
        ['text'] = {
            [1] = 'Gives a free 6x Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = 3,
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
                Xmult = 6
            }
        end
    end
}