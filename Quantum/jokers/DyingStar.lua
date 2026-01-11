
SMODS.Joker{ --Dying Star
    key = "DyingStar",
    config = {
        extra = {
            mult = 20
        }
    },
    loc_txt = {
        ['name'] = 'Dying Star',
        ['text'] = {
            [1] = 'Dies in 10 Rounds',
            [2] = 'Multiplies its Mult by 2',
            [3] = 'Starting Mult: {C:red}20{}',
            [4] = 'current Mult: {C:red}#1#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 25,
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
        if context.after and context.cardarea == G.jokers  then
            if to_big(card.ability.extra.mult) == to_big(20480) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.mult = (card.ability.extra.mult) * 2
            return {
                mult = card.ability.extra.mult_value
            }
        end
    end
}