
SMODS.Joker{ --X-Boson
    key = "xboson",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'X-Boson',
        ['text'] = {
            [1] = 'Balances Chips and Mult.',
            [2] = 'The X-Boson is a theoretical',
            [3] = 'mediator of the unified force',
            [4] = 'predicted by the Georgi–Glashow',
            [5] = 'model and are analogous to the',
            [6] = 'W and Z Bosons, but are much',
            [7] = 'Heavier and couple to quarks,',
            [8] = 'allowing violation of the',
            [9] = 'conservation of baryon number',
            [10] = 'thus permitting proton decay.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                balance = true,
                message = "BALANCED"
            }
        end
    end
}