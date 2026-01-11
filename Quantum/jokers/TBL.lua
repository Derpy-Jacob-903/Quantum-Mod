
SMODS.Joker{ --The Bloodline
    key = "TBL",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Bloodline',
        ['text'] = {
            [1] = 'If the Played hand contains',
            [2] = 'a five of a kind, X7.5 {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true }
}