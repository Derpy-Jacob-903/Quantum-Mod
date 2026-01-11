
SMODS.Joker{ --Copper
    key = "Cu",
    config = {
        extra = {
            xchips0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Copper',
        ['text'] = {
            [1] = 'Seal cards give {X:chips,C:white}×1,5{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
            if context.other_card.seal ~= nil then
                return {
                    x_chips = 1.5
                }
            end
        end
    end
}