
SMODS.Joker{ --Hydrogen
    key = "H",
    config = {
        extra = {
            chips0 = 4,
            mult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Hydrogen',
        ['text'] = {
            [1] = '1 Proton and maybe 1 Neutron.',
            [2] = 'The most {C:common}Common{} element in the Universe',
            [3] = 'Simple, {C:red}+4{} Mult and {C:blue}+4 {}Chips.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_element"] = true, ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 4,
                extra = {
                    mult = 4
                }
            }
        end
    end
}