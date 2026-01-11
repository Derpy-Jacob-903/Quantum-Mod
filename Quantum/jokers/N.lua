
SMODS.Joker{ --Nitrogen
    key = "N",
    config = {
        extra = {
            dollars0 = 7
        }
    },
    loc_txt = {
        ['name'] = 'Nitrogen',
        ['text'] = {
            [1] = '7 Protons and 7 Neutrons.',
            [2] = 'one of the most {C:common}Common{} elements in the Universe',
            [3] = 'Gives 7$ on a Reroll'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_element"] = true, ["quant_quant_jokers"] = true, ["quant_util"] = true },
    
    calculate = function(self, card, context)
        if context.reroll_shop  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 7
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(7), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}