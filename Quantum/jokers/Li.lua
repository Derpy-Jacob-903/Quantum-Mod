
SMODS.Joker{ --Lithium
    key = "Li",
    config = {
        extra = {
            mult0 = 4,
            mult = 4,
            mult2 = 4,
            mult3 = 4,
            mult4 = 4,
            mult5 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Lithium',
        ['text'] = {
            [1] = '3 Protons and maybe 3 Neutrons.',
            [2] = 'cards 1-6 give +4 Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
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
            if context.other_card:get_id() == 14 then
                return {
                    mult = 4
                }
            elseif context.other_card:get_id() == 2 then
                return {
                    mult = 4
                }
            elseif context.other_card:get_id() == 3 then
                return {
                    mult = 4
                }
            elseif context.other_card:get_id() == 4 then
                return {
                    mult = 4
                }
            elseif context.other_card:get_id() == 5 then
                return {
                    mult = 4
                }
            elseif context.other_card:get_id() == 6 then
                return {
                    mult = 4
                }
            end
        end
    end
}