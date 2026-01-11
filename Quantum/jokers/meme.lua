
SMODS.Joker{ --Meme
    key = "meme",
    config = {
        extra = {
            mult0 = 4,
            chips0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Meme',
        ['text'] = {
            [1] = 'When cards with the rank: 6,7/9,4,2 are',
            [2] = 'scored gain {C:red}4{} Mult and {C:blue}20{} Chips',
            [3] = 'An Internet meme, or meme (/miːm/, MEEM), is a',
            [4] = 'cultural item [(such as an idea, behavior,',
            [5] = 'or style)that spreads across the Internet, primarily',
            [6] = 'through social media platforms. Internet',
            [7] = 'memes manifest in a variety of formats, including',
            [8] = 'images, videos, GIFs, and other viral content. Key',
            [9] = 'characteristics of memes include their tendency to',
            [10] = 'be parodied, their use of intertextuality, their viral',
            [11] = 'dissemination, and their continual evolution.',
            [12] = 'The term meme was originally introduced by',
            [13] = 'Richard Dawkins in his 1976 book The Selfish Gene to',
            [14] = 'describe the concept of cultural transmission.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 6
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
    pools = { ["quant_quant_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 6 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9 or context.other_card:get_id() == 4 or context.other_card:get_id() == 2) then
                return {
                    mult = 4,
                    extra = {
                        chips = 20,
                        colour = G.C.CHIPS
                    }
                }
            end
        end
    end
}