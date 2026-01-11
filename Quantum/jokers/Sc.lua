
SMODS.Joker{ --Scandium
    key = "Sc",
    config = {
        extra = {
            xchips0 = 1.75
        }
    },
    loc_txt = {
        ['name'] = 'Scandium',
        ['text'] = {
            [1] = 'Even cards held in hand give',
            [2] = '{X:chips,C:white}×1.75{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10) then
                return {
                    x_chips = 1.75
                }
            end
        end
    end
}