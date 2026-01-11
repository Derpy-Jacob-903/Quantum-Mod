
SMODS.Joker{ --Carbon
    key = "C",
    config = {
        extra = {
            xmult0 = 1.25,
            pb_mult_924083b7 = 1,
            discards0 = 1,
            chips0 = 100,
            repetitions0 = 1,
            dollars0 = 3,
            xchips0 = 1.25,
            card_draw0 = 1,
            pb_bonus_8e8fd126 = 5,
            mult0 = 11
        }
    },
    loc_txt = {
        ['name'] = 'Carbon',
        ['text'] = {
            [1] = '6 Protons and 6-7 Neutrons.',
            [2] = 'one of the most {C:common}Common{} elements in the Universe',
        [3] = 'very versatile :)',
        [4] = 'Odd-Club: {C:attention}+1{} {C:planet}planet{} Card',
        [5] = 'Even-Club: {C:attention}+1{} Perm Mult',
        [6] = 'face-Club: {X:red,C:white}X1.25{}',
        [7] = 'MultOdd-Spade: DISCARD',
        [8] = 'Even-Spade: {C:blue}+100{} Chips',
        [9] = 'face-Spade: Retrigger',
        [10] = 'Odd-Diamond: +3$',
        [11] = 'Even-Diamond: x1.25',
        [12] = 'Chipsface-Diamond: Draw 1 Card',
        [13] = 'Odd-Heart: {C:attention}+5{} Perm Chips',
        [14] = 'Even-Heart: {C:red}+11{} Mult',
        [15] = 'face-Heart: COPY CARD TO HAND'
    },
    ['unlock'] = {
        [1] = 'Unlocked by default.'
    }
},
pos = {
    x = 0,
    y = 0
},
display_size = {
    w = 71 * 1, 
    h = 95 * 1
},
cost = 10,
rarity = 3,
blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,
unlocked = true,
discovered = false,
atlas = 'CustomJokers',
pools = { ["quant_element"] = true, ["quant_quant_jokers"] = true },

calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play  then
        if (context.other_card:is_suit("Clubs") and context.other_card:is_face()) then
            return {
                Xmult = 1.25,
                message = "x1.25"
            }
        elseif (context.other_card:is_suit("Clubs") and (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10)) then
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 1
            return {
                extra = { message = "+1 Perm Mult", colour = G.C.MULT }, card = card
            }
        elseif (context.other_card:is_suit("Clubs") and (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9)) then
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet', })                            
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
            delay(0.6)
            return {
                message = created_consumable and localize('k_plus_planet') or nil
            }
        elseif (context.other_card:is_suit("Spades") and (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9)) then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "DISCARD DIS CARD", colour = G.C.GREEN})
                    
                    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
                    return true
                end
            }
        elseif (context.other_card:is_suit("Spades") and (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10)) then
            return {
                chips = 100,
                message = "+100 Chips"
            }
        elseif (context.other_card:is_suit("Spades") and context.other_card:is_face()) then
            return {
                repetitions = 1,
                message = "AGAIN!"
            }
        elseif (context.other_card:is_suit("Diamonds") and (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9)) then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 3
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "money", colour = G.C.MONEY})
                    return true
                end
            }
        elseif (context.other_card:is_suit("Diamonds") and (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10)) then
            return {
                x_chips = 1.25,
                message = "x1.25Chips"
            }
        elseif (context.other_card:is_suit("Diamonds") and context.other_card:is_face()) then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(1)
            end
            return {
                message = "DRAW"
            }
        elseif (context.other_card:is_suit("Hearts") and (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9)) then
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 5
        elseif (context.other_card:is_suit("Hearts") and (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10)) then
            return {
                mult = 11,
                message = "MULT"
            }
        elseif (context.other_card:is_suit("Hearts") and context.other_card:is_face()) then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
            copied_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, copied_card)
            G.hand:emplace(copied_card)
            copied_card.states.visible = nil
            G.E_MANAGER:add_event(Event({
                func = function() 
                    copied_card:start_materialize()
                    return true
                end
            }))
            return {
                message = "Ctrl+C ,Ctr+V"
            }
        end
    end
end
}