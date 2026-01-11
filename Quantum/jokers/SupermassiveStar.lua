
SMODS.Joker{ --Supermassive Star
    key = "SupermassiveStar",
    config = {
        extra = {
            xchips0 = 4,
            xmult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Supermassive Star',
        ['text'] = {
            [1] = 'Gives 4x Chips and 4x Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 50,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = 4,
                extra = {
                    Xmult = 4
                }
            }
        end
    end
}