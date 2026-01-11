
SMODS.Joker{ --Magnesium
    key = "Mg",
    config = {
        extra = {
            booster_slots_increase = '2'
        }
    },
    loc_txt = {
        ['name'] = 'Magnesium',
        ['text'] = {
            [1] = 'Adds {C:attention}+2{} Booster Pack slots.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["quant_element"] = true, ["quant_quant_jokers"] = true, ["quant_util"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(2)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-2)
    end
}