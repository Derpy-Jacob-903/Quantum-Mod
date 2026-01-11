
SMODS.Joker{ --Flourine
    key = "F",
    config = {
        extra = {
            pb_x_chips_79e5d011 = 0.05,
            pb_x_mult_2de63737 = 0.05
        }
    },
    loc_txt = {
        ['name'] = 'Flourine',
        ['text'] = {
            [1] = '9 Protons and 9 Neutrons.',
            [2] = 'one of the most {C:common}Common{} elements in the Universe',
            [3] = 'oxydises stuff even better than oxygen!',
            [4] = 'Adds a PERMANENT {C:attention}+0.05{} {X:red,C:white}X{} Mult to ALL scored cards',
            [5] = 'Adds Permanent {C:attention}+0.05{} X Chips and Applies Red seals'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "quant_mythic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_element"] = true, ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (context.other_card.seal ~= nil) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_seal("Red", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            else
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips or 0
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips + 0.05
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + 0.05
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}