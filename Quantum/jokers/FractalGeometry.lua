
SMODS.Joker{ --Fractal Geometry
    key = "FractalGeometry",
    config = {
        extra = {
            handsremaining = 1
        }
    },
    loc_txt = {
        ['name'] = 'Fractal Geometry',
        ['text'] = {
            [1] = 'Retrigger the first card as much as',
            [2] = 'you have hands left.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.handsremaining + ((G.GAME.current_round.hands_left or 0))}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = card.ability.extra.handsremaining + (G.GAME.current_round.hands_left),
                    message = localize('k_again_ex')
                }
            end
        end
    end
}