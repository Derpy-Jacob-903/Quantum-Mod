
SMODS.Joker{ --Indium
    key = "In",
    config = {
        extra = {
            chips0 = -100,
            mult0 = 50
        }
    },
    loc_txt = {
        ['name'] = 'Indium',
        ['text'] = {
            [1] = '{C:blue}-100 Chips{} BUT {C:red}+50 Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = -100,
                extra = {
                    mult = 50
                }
            }
        end
    end
}