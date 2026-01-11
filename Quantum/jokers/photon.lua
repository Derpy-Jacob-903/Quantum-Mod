
SMODS.Joker{ --Photon
    key = "photon",
    config = {
        extra = {
            chips0 = 100,
            mult0 = 100
        }
    },
    loc_txt = {
        ['name'] = 'Photon',
        ['text'] = {
            [1] = 'Gives free 100 Mult and Chips.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
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
                chips = 100,
                extra = {
                    mult = 100
                }
            }
        end
    end
}