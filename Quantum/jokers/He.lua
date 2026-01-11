
SMODS.Joker{ --Helium
    key = "He",
    config = {
        extra = {
            chips0 = 8,
            mult0 = 8
        }
    },
    loc_txt = {
        ['name'] = 'Helium',
        ['text'] = {
            [1] = '2 Protons and maybe 2 Neutron2.',
            [2] = 'The second most {C:common}Common{} element in the Universe.',
            [3] = 'Simple, {C:red}+8{} Mult and {C:blue}+8{} Chips.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
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
                chips = 8,
                extra = {
                    mult = 8
                }
            }
        end
    end
}