
SMODS.Joker{ --Boron
    key = "B",
    config = {
        extra = {
            mult0 = 2,
            chips0 = 25
        }
    },
    loc_txt = {
        ['name'] = 'Boron',
        ['text'] = {
            [1] = '5 protons and 5 Neutrons.',
            [2] = 'one of the most {C:common}Common{} elements',
            [3] = 'in the universe. odd cards give 25 Chips',
            [4] = 'and even cards give 2 Mult.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_element"] = true, ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10) then
                return {
                    mult = 2
                }
            elseif (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) then
                return {
                    chips = 25
                }
            end
        end
    end
}