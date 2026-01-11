
SMODS.Joker{ --Superfluidity
    key = "superfluidity",
    config = {
        extra = {
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Superfluidity',
        ['text'] = {
            [1] = 'If all Played cards are',
            [2] = 'Enhanced Retrigger them.',
            [3] = 'Superfluidity is present in',
            [4] = 'extremely cold He4 at 2.17K',
            [5] = 'and is characterized by being',
            [6] = 'a frictionless fluid, allowing it',
            [7] = 'to do some wacky stuff.',
            [8] = 'interestingly enough He3',
            [9] = 'only becomes a superfluid at',
            [10] = '2.491 mK, much colder.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 12,
    rarity = "quant_ultra_rare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_state"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card.edition and playing_card.edition.key == "undefined" then
                        count = count + 1
                    end
                end
                return to_big(count) == to_big(5)
            end)() then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}