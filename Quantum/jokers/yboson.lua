
SMODS.Joker{ --Y-Boson
    key = "yboson",
    config = {
        extra = {
            odds = 5,
            levels0 = 1,
            xmult0 = 1.25,
            xchips0 = 1.75
        }
    },
    loc_txt = {
        ['name'] = 'Y-Boson',
        ['text'] = {
            [1] = 'Face cards Held in hand have a',
            [2] = '20% chance to level up the played',
            [3] = 'hand. Even cards give {X:mult,C:white}×1.25{} Mult',
            [4] = 'and odd cards give {X:chips,C:white}×1.75{} Chips',
            [5] = 'The Y-Boson is a theoretical',
            [6] = 'mediator of the unified force',
            [7] = 'predicted by the Georgi–Glashow',
            [8] = 'model and are analogous to the',
            [9] = 'W and Z Bosons, but are much',
            [10] = 'Heavier and couple to quarks,',
            [11] = 'allowing violation of the',
            [12] = 'conservation of baryon number',
            [13] = 'thus permitting proton decay.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 18,
    rarity = "quant_mythic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_quant_yboson') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group_0_b884786f', 1, card.ability.extra.odds, 'j_quant_yboson', false) then
                    local target_hand = (context.scoring_name or "High Card")
                    level_up_hand(card, target_hand, true, 1)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
                end
            elseif (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10) then
                return {
                    Xmult = 1.25
                }
            elseif (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) then
                return {
                    x_chips = 1.75
                }
            end
        end
    end
}