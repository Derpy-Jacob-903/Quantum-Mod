
SMODS.Joker{ --Etherium
    key = "ETH",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Etherium',
        ['text'] = {
            [1] = 'Gives between 15$ and {}-10$',
            [2] = 'at the end of a round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_util"] = true }
}