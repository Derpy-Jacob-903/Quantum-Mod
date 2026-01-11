
SMODS.Joker{ --OMG-Particle
    key = "omgparticle",
    config = {
        extra = {
            pb_bonus_f0dc8caa = 320,
            pb_mult_c1791a1f = 32,
            pb_bonus_ac6b2ac7 = 320,
            pb_mult_2fb0e9e9 = 32
        }
    },
    loc_txt = {
        ['name'] = 'OMG-Particle',
        ['text'] = {
            [1] = 'If the Played card is a Face',
            [2] = 'Card or higher: add perm 320',
            [3] = 'Chips and 32 Mult to that Card.',
            [4] = 'The OMG-Particle or \"Oh my God\"',
            [5] = 'Particle is a Cosmic ray (Presu-',
            [6] = 'mably a Proton) Traveling at:',
            [7] = '99.9999999999999999987% the',
            [8] = 'speed of Light. And containing',
            [9] = '320 EeV of energy, which is',
            [10] = 'equivalent to a Baseball going',
            [11] = '100 km/h (or 63 mph). This',
            [12] = 'Cosmic ray was detected in the',
            [13] = '15th October 1991 by the Fly\'s',
            [14] = 'Eye camera in the USA in Utah.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = "quant_mythic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 320
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 32
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            elseif context.other_card:get_id() == 14 then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 320
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 32
            end
        end
    end
}