
SMODS.Joker{ --Axion
    key = "axion",
    config = {
        extra = {
            repetitions0 = 1,
            pb_bonus_809b5886 = 15,
            pb_mult_47356367 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Axion',
        ['text'] = {
            [1] = 'one of the canidates for Dark',
            [2] = 'Matter! Only interacts with',
            [3] = 'non face cards, retriggering them',
            [4] = 'and adding prem Chips and Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = "quant_mythic",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if not (context.other_card:is_face()) then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 15
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 3
                return {
                    repetitions = 1,
                    message = localize('k_again_ex'),
                    extra = {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card,
                        colour = G.C.CHIPS
                    }
                }
            end
        end
    end
}