
SMODS.Joker{ --Phosphorus
    key = "P",
    config = {
        extra = {
            xchips0 = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Phosphorus',
        ['text'] = {
            [1] = '{C:enhanced}Enhanced{} cards give 1,25x Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
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
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    x_chips = 1.25
                }
            end
        end
    end
}