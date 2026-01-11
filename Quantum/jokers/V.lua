
SMODS.Joker{ --Vanadium
    key = "V",
    config = {
        extra = {
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Vanadium',
        ['text'] = {
            [1] = 'If the Played hand contains',
            [2] = 'at least 2 {C:dark_edition}Edition{} cards,',
            [3] = 'level up the current hand.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true, ["quant_util"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card.edition ~= nil then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(2)
            end)() then
                local target_hand = (context.scoring_name or "High Card")
                level_up_hand(card, target_hand, true, 1)
                return {
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}