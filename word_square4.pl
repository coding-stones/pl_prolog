:- dynamic word/1.

word_square(Words) :-
  Words = [[ W11, W12, W13, W14 ],
           [ W12, W22, W23, W24 ],
           [ W13, W23, W33, W34 ],
           [ W14, W24, W34, W44 ]
  ],
  word([W11, W12, W13, W14]),
  word([W12, W22, W23, W24]),
  word([W13, W23, W33, W34]),
  word([W14, W24, W34, W44])
  .
