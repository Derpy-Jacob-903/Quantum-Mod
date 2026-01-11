
SMODS.Joker{ --Pentaquark
    key = "pentaquark",
    config = {
        extra = {
            xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Pentaquark',
        ['text'] = {
            [1] = 'The Myth The Legend THE ONLY',
            [2] = 'PENTAQUARK! The first Man-Made',
            [3] = 'Subatomic Particle. Doubles Its Mult',
            [4] = 'EVERY HAND. Starts with 2 xMult',
            [5] = '(Currently {X:mult,C:white}X#1#{} Mult)',
            [6] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 100,
    rarity = "quant_ultra_rare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) * 2
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}