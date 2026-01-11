
SMODS.Joker{ --leptoquark
    key = "leptoquark",
    config = {
        extra = {
            pb_mult_1008b2f3 = 5,
            pb_bonus_9e9e754d = 25,
            pb_x_chips_a5367b60 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'leptoquark',
        ['text'] = {
            [1] = 'If a card has a Seal, add 5 perm Mult',
            [2] = 'If it is {C:enhanced}Enhanced{} add 25 perm Chips and',
            [3] = 'If it has a {C:dark_edition}Edition{} add 0.1 perm x Chips',
            [4] = 'A leptoquark is a hypothetical particle that',
            [5] = 'is a Lepton AND  a quark! It serves the',
            [6] = 'purpose to connect both, however it not',
            [7] = 'been discovered, and might not be real.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal ~= nil then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 5
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            elseif (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 25
            elseif context.other_card.edition ~= nil then
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips or 0
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips + 0.1
            end
        end
    end
}