
SMODS.Joker{ --Z Boson
    key = "zboson",
    config = {
        extra = {
            mult0 = -25,
            chips0 = 500
        }
    },
    loc_txt = {
        ['name'] = 'Z Boson',
        ['text'] = {
            [1] = 'Converts 25 Mult into 500 Chips.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
                mult = -25,
                extra = {
                    chips = 500,
                    colour = G.C.CHIPS
                }
            }
        end
    end
}