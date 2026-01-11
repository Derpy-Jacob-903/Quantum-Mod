
SMODS.Joker{ --Graviton
    key = "graviton",
    config = {
        extra = {
            xchips0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Graviton',
        ['text'] = {
            [1] = '{C:enhanced}Enhanced{} cards give',
            [2] = '{X:blue,C:white}2X{} Chips when scored',
            [3] = 'oooh, The Gravitron, the',
            [4] = 'hypothetical Mediator of',
            [5] = 'Gravity! It is part of',
            [6] = 'the Bosons, and would',
            [7] = 'have a spin of 1/2, how-',
            [8] = 'ever, it has not been',
            [9] = 'discovered yet...'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 16,
    rarity = "quant_mythic",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.edition ~= nil then
                return {
                    x_chips = 2
                }
            end
        end
    end
}