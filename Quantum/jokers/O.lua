
SMODS.Joker{ --Oxygen
    key = "O",
    config = {
        extra = {
            pb_x_mult_6da48f44 = 0.05
        }
    },
    loc_txt = {
        ['name'] = 'Oxygen',
        ['text'] = {
            [1] = '8 Protons and 8 Neutrons. OXYDISES stuff',
            [2] = 'one of the most {C:common}Common{} elements in the Universe',
            [3] = 'Adds a PERMANENT {C:attention}+0.05{} {X:red,C:white}X{} Mult to ALL scored cards'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_element"] = true, ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
            context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + 0.05
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
            }
        end
    end
}