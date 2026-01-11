
SMODS.Joker{ --Manipulate The odds
    key = "MTO",
    config = {
        extra = {
            mod_probability0 = 99
        }
    },
    loc_txt = {
        ['name'] = 'Manipulate The odds',
        ['text'] = {
            [1] = 'add {C:green}+99{} to ALL odds!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 77,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_util"] = true },
    
    calculate = function(self, card, context)
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator + (99)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}