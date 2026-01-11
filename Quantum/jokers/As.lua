
SMODS.Joker{ --Arsenic
    key = "As",
    config = {
        extra = {
            repetitions = 99,
            levels0 = 1,
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Arsenic',
        ['text'] = {
            [1] = 'Destroys all consumables when',
            [2] = 'selecting the blind, BUT levels up',
            [3] = 'played hand and gives {X:mult,C:white}×2{} Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 8
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
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                for i = 1, 99 do
                    SMODS.calculate_effect({func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            if consumable.ability.set == "" then
                                table.insert(target_cards, consumable)
                            end
                        end
                        if #target_cards > 0 then
                            local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    card_to_destroy:start_dissolve()
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "POISON", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            local target_hand = (context.scoring_name or "High Card")
            level_up_hand(card, target_hand, true, 1)
            return {
                message = localize('k_level_up_ex'),
                extra = {
                    Xmult = 2
                }
            }
        end
    end
}