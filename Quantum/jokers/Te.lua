
SMODS.Joker{ --Tellurium
    key = "Te",
    config = {
        extra = {
            xchips0 = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Tellurium',
        ['text'] = {
            [1] = 'All non face cards held in',
            [2] = 'hand give {X:chips,C:white}×1.25{} {C:blue}Chips{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 10
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
            if not (context.other_card:is_face()) then
                return {
                    x_chips = 1.25
                }
            end
        end
    end
}