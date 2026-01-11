
SMODS.Joker{ --OMIVERSE
    key = "omiverse",
    config = {
        extra = {
            hyperchips_n0 = 9223372036854776,
            hyperchips_arrows0 = 9223372036854776,
            hypermult_n0 = 9223372036854776,
            hypermult_arrows0 = 9223372036854776,
            xmult0 = 2.0000000000000002e+307
        }
    },
    loc_txt = {
        ['name'] = 'OMIVERSE',
        ['text'] = {
            [1] = '{C:dark_edition}A D D S{} {C:red}ERR:[stack_overflow=64]{} {C:dark_edition}H Y P E R{}',
            [2] = '{C:dark_edition} M U L T  A N D H Y P E R C H I P S{}',
            [3] = '{C:dark_edition}a n d + 3 0 7 e X M u l t{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "quant_extra_dimensional_transient_ultima_supreme_hyper_exotic_arcane_limitless_omniversal_unmatched_deity_infinitecimal_unknowable_infinty_",
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                hyperchips = {
                    9223372036854776,
                    9223372036854776
                },
                extra = {
                    hypermult = {
                        9223372036854776,
                        9223372036854776
                    },
                    colour = G.C.DARK_EDITION,
                    extra = {
                        Xmult = 2.0000000000000002e+307
                    }
                }
            }
        end
    end
}