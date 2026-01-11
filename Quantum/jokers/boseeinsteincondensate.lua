
SMODS.Joker{ --Bose Einstein Condensate
    key = "boseeinsteincondensate",
    config = {
        extra = {
            xchips0 = 1.5,
            mult0 = 1.5,
            mult = 25,
            chips0 = 250,
            pb_mult_aef0c519 = 5,
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Bose Einstein Condensate',
        ['text'] = {
            [1] = 'Scored cards gain buffs',
            [2] = 'depending on how many of',
            [3] = 'the same card is played.',
            [4] = 'Buffs stack! Did you Know',
            [5] = 'in a BEC all atoms are so',
            [6] = 'cold, they behave like 1 big',
            [7] = 'particle! However it has to',
            [8] = 'be extremely cold, around',
            [9] = '170nK!!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 16,
    rarity = "quant_mythic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if next(context.poker_hands["High Card"]) then
                return {
                    x_chips = 1.5
                }
            elseif next(context.poker_hands["Pair"]) then
                return {
                    mult = 1.5
                }
            elseif next(context.poker_hands["Three of a Kind"]) then
                return {
                    mult = 25
                }
            elseif next(context.poker_hands["Four of a Kind"]) then
                return {
                    chips = 250
                }
            elseif next(context.poker_hands["Five of a Kind"]) then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 5
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            elseif next(context.poker_hands["Flush Five"]) then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}