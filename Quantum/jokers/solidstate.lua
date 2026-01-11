
SMODS.Joker{ --Solid State
    key = "solidstate",
    config = {
        extra = {
            mult0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Solid State',
        ['text'] = {
            [1] = 'Scored Rock cards give 5 Mult.',
            [2] = 'the Most {C:common}Common{} state of',
            [3] = 'Matter. I dont think I need',
            [4] = 'to explain this state of matter.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_states"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                return {
                    mult = 5
                }
            end
        end
    end
}