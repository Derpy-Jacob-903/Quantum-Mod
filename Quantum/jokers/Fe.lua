
SMODS.Joker{ --Iron
    key = "Fe",
    config = {
        extra = {
            xmult0 = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Iron',
        ['text'] = {
            [1] = 'Black suit cards give {X:mult,C:white}×1.1{} Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                return {
                    Xmult = 1.1
                }
            end
        end
    end
}