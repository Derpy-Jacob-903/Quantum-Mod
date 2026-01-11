
SMODS.Joker{ --Sterile Neutrino
    key = "sterileneutrino",
    config = {
        extra = {
            xmult0 = 100
        }
    },
    loc_txt = {
        ['name'] = 'Sterile Neutrino',
        ['text'] = {
            [1] = 'Basically a Idol Ctrl+C and Ctrl+V but',
            [2] = 'better ({X:red,C:white}X100{} Mult) Current Card:',
            [3] = 'Suit: {X:enhanced,C:white}#1#{} Rank:{X:legendary,C:white}#2#{}',
            [4] = 'The Sterile Neutrino is a Neutrino',
            [5] = '(DUH), however it possesses {C:red}NO{} Flavor',
            [6] = 'meaning it can {C:dark_edition}O N L Y{} interact with',
            [7] = 'gravity (EXCEPT Yukawa), making it',
            [8] = 'Ludicrously hard to detect.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
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
        
        return {vars = {localize((G.GAME.current_round.suitvar_card or {}).suit or 'Spades', 'suits_singular'), localize((G.GAME.current_round.rankvar_card or {}).rank or 'Ace', 'ranks')}, colours = {G.C.SUITS[(G.GAME.current_round.suitvar_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.suitvar_card = { suit = 'Spades' }
        G.GAME.current_round.rankvar_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if G.playing_cards then
                local valid_suitvar_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_suit(v) then
                        valid_suitvar_cards[#valid_suitvar_cards + 1] = v
                    end
                end
                if valid_suitvar_cards[1] then
                    local suitvar_card = pseudorandom_element(valid_suitvar_cards, pseudoseed('suitvar' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.suitvar_card.suit = suitvar_card.base.suit
                end
            end
            if G.playing_cards then
                local valid_rankvar_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_rankvar_cards[#valid_rankvar_cards + 1] = v
                    end
                end
                if valid_rankvar_cards[1] then
                    local rankvar_card = pseudorandom_element(valid_rankvar_cards, pseudoseed('rankvar' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.rankvar_card.rank = rankvar_card.base.value
                    G.GAME.current_round.rankvar_card.id = rankvar_card.base.id
                end
            end
        end
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 and context.other_card:is_suit(G.GAME.current_round.suitvar_card.suit)) then
                return {
                    Xmult = 100
                }
            end
        end
    end
}