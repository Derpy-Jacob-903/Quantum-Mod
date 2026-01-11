
SMODS.Joker{ --Gaseous State
    key = "gaseousstate",
    config = {
        extra = {
            repetitions0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Gaseous State',
        ['text'] = {
            [1] = 'If The Played hand has only',
            [2] = '1 or 2 Cards retrigger them twice.',
            [3] = 'What? you really expected',
            [4] = 'something more? BRUH you',
            [5] = 'cant see a gas! what did',
            [6] = 'you expect from this?'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_state"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if to_big(#context.scoring_hand) < to_big(3) then
                return {
                    repetitions = 2,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}