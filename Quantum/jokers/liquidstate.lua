
SMODS.Joker{ --Liquid state
    key = "liquidstate",
    config = {
        extra = {
            chips0 = 40
        }
    },
    loc_txt = {
        ['name'] = 'Liquid state',
        ['text'] = {
            [1] = 'Scored {C:attention}Wildcards{} Give 40 Chips.',
            [2] = 'Very {C:common}Common{}, not special',
            [3] = 'you know the drill.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_state"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                return {
                    chips = 40
                }
            end
        end
    end
}