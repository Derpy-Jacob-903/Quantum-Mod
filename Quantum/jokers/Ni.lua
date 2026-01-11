
SMODS.Joker{ --Nickel
    key = "Ni",
    config = {
        extra = {
            xmult0 = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Nickel',
        ['text'] = {
            [1] = 'When a {C:attention}Lucky{} card is triggered,',
            [2] = '{X:mult,C:white}×2,5{} Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 7
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card.lucky_trigger then
                return {
                    Xmult = 2.5
                }
            end
        end
    end
}