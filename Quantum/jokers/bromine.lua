
SMODS.Joker{ --Bromine
    key = "bromine",
    config = {
        extra = {
            pb_p_dollars_d570e2c5 = 1,
            pb_bonus_5114346b = 10,
            pb_x_mult_62b13945 = 1.05,
            pb_mult_55279d4e = 2
        }
    },
    loc_txt = {
        ['name'] = 'Bromine',
        ['text'] = {
            [1] = '{C:hearts}Hearts{} gain {C:blue}+5 Chips{} permanently.',
            [2] = '{C:diamonds}Diamonds{} gain + {X:chips,C:white}×1.1{} HELD Chips.',
            [3] = '{C:spades}Spades{} gain {C:money}+1${} on scoring perm.',
            [4] = '{C:clubs}Clubs{} gain {C:red}+2 Mult{} Permanently.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars or 0
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars + 1
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MONEY }, card = card
                }
            elseif context.other_card:is_suit("Hearts") then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 10
            elseif context.other_card:is_suit("Diamonds") then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + 1.05
            elseif context.other_card:is_suit("Clubs") then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 2
            end
        end
    end
}