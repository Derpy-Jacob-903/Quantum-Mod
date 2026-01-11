
SMODS.Joker{ --Charm Quark
    key = "CharmQuark",
    config = {
        extra = {
            mult = 100
        }
    },
    loc_txt = {
        ['name'] = 'Charm Quark',
        ['text'] = {
            [1] = 'starts at {C:red}100{} Mult',
            [2] = 'and gains {C:red}25{} Mult each round',
            [3] = 'Current Mult: {C:red}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 25
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}