symbols = (1:6); % Alphabet vector
prob = [.03 .08 .13 .19 .23 .34]; % Symbol probability vector
[dict,avglen] = huffmandict(symbols,prob)