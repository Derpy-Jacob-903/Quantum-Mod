
SMODS.Joker{ --Cadmium
    key = "cd",
    config = {
        extra = {
            discards_change = '1',
            xmult0 = 1.05
        }
    },
    loc_txt = {
        ['name'] = 'Cadmium',
        ['text'] = {
            [1] = '{C:red}-1 Discard{}, BUT every',
            [2] = 'time another joker is',
            [3] = 'triggered {X:red,C:white}×1.05{} {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    calculate = function(self, card, context)
        if context.other_joker  then
            return {
                Xmult = 1.05
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = math.max(1, G.GAME.round_resets.discards - 1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
    end
}