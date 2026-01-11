
SMODS.Joker{ --Selenium
    key = "Se",
    config = {
        extra = {
            xchips0 = 1.75
        }
    },
    loc_txt = {
        ['name'] = 'Selenium',
        ['text'] = {
            [1] = 'if scored card has the',
            [2] = '{X:enhanced,C:white}#1#{} Suit: {X:chips,C:white}×1.75{} Chips',
            [3] = 'Suit changes every round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 8
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.suit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.suit_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.suit_card = { suit = 'Spades' }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit(G.GAME.current_round.suit_card.suit) then
                return {
                    x_chips = 1.75
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if G.playing_cards then
                local valid_suit_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_suit(v) then
                        valid_suit_cards[#valid_suit_cards + 1] = v
                    end
                end
                if valid_suit_cards[1] then
                    local suit_card = pseudorandom_element(valid_suit_cards, pseudoseed('suit' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.suit_card.suit = suit_card.base.suit
                end
            end
        end
    end
}