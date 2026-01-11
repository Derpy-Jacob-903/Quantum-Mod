
SMODS.Joker{ --Tachyon
    key = "tachyon",
    config = {
        extra = {
            hands0 = 1,
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Tachyon',
        ['text'] = {
            [1] = 'A particle traveling faster',
            [2] = 'than the speed of light!',
            [3] = 'Allows Infinite Hands, Disables',
            [4] = 'Boss Blinds and Retriggers',
            [5] = 'EVERY scoring card ONCE',
            [6] = 'Fun Fact: Tachyons are theroretically',
            [7] = 'Possible since it would have an imaginary',
            [8] = 'mass allowing  it to go above light speed.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 16,
    rarity = "quant_mythic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                    return true
                end
            }
        end
        if context.first_hand_drawn  then
            return {
                func = function()
                    if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.blind:disable()
                                play_sound('timpani')
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                    end
                    return true
                end
            }
        end
        if context.repetition and context.cardarea == G.play  then
            return {
                repetitions = 1,
                message = localize('k_again_ex')
            }
        end
    end
}