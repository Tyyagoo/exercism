values = (
    ("AEIOULNRST", 1),
    ("DG", 2),
    ("BCMP", 3),
    ("FHVWY", 4),
    ("K", 5),
    ("JX", 8),
    ("QZ", 10)
)

def score(word):
    fn = lambda l: [v for (k, v) in values if l in k][0]
    return sum([fn(l) for l in word.upper()])
    
