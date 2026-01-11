
SMODS.Joker{ --Palladium
    key = "Pd",
    config = {
        extra = {
            chip = 0,
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Palladium',
        ['text'] = {
            [1] = 'when a Booster pack is',
            [2] = 'opened this joker perm.',
            [3] = 'gives {C:blue}+5 Chips{} more per',
            [4] = 'Red suited card, and {C:red}+1',
            [5] = 'Mult{} more per black siuit.',
            [6] = 'Current {C:blue}Chips{}: {X:blue,C:white}#1#{}',
            [7] = 'Current {C:red}Mult{}: {X:red,C:white}#2#{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_quant_jokers"] = true, ["quant_element"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chip, card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.open_booster  then
            return {
                func = function()
                    card.ability.extra.chip = (card.ability.extra.chip) + 5
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.mult = (card.ability.extra.mult) + 1
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                return {
                    chips = card.ability.extra.chip
                }
            elseif context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}